package main

import (
	"fmt"
	"log"
	"net"
	"net/http"
	_ "net/http/pprof"
	"strings"
	"time"
)

// SimpleClient is a thin statsd client.
type SimpleClient struct {
	c  net.PacketConn
	ra *net.UDPAddr
}

// NewSimpleClient instantiates a new SimpleClient instance which binds
// to the provided UDP address.
func NewSimpleClient(addr string) (*SimpleClient, error) {
	c, err := net.ListenPacket("udp", ":0")
	if err != nil {
		return nil, err
	}

	ra, err := net.ResolveUDPAddr("udp", addr)
	if err != nil {
		c.Close()
		return nil, err
	}

	return &SimpleClient{
		c:  c,
		ra: ra,
	}, nil
}

// Timing sends a statsd timing call.
func (sc *SimpleClient) Timing(s string, d time.Duration, sampleRate float64,
	tags map[string]string) error {
	return sc.send(fmtStatStr(
		fmt.Sprintf("%s:%d|ms", s, d/time.Millisecond), tags),
	)
}

func (sc *SimpleClient) send(s string) error {
	_, err := sc.c.(*net.UDPConn).WriteToUDP([]byte(s), sc.ra)
	if err != nil {
		return err
	}

	return nil
}

func fmtStatStr(stat string, tags map[string]string) string {
	parts := []string{}
	for k, v := range tags {
		if v != "" {
			parts = append(parts, fmt.Sprintf("%s:%s", k, v))
		}
	}

	return fmt.Sprintf("%s|%s", stat, strings.Join(parts, ","))
}

func main() {
	stats, err := NewSimpleClient("localhost:6060")
	if err != nil {
		log.Fatal("could not start stas client: ", err)
	}

	// add handlers to default mux
	http.HandleFunc("/ping", pingHandler(stats))

	s := &http.Server{
		Addr: ":8080",
	}

	log.Fatal(s.ListenAndServe())
}

func pingHandler(s *SimpleClient) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		st := time.Now()
		defer func() {
			_ = s.Timing("http.ping", time.Since(st), 1.0, nil)
		}()

		w.WriteHeader(200)
	}
}
