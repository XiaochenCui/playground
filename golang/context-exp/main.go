// context expiriment
package main

import (
	"context"
	"log"
	"sync"
	"time"
)

var mu sync.Mutex
var m = make(map[string]context.Context)

func main() {
	go check()

	mu.Lock()

	ctx, cancelFunc := context.WithCancel(context.Background())
	m["ctx"] = ctx

	childCtx := context.WithValue(ctx, key{"canceler"}, "xiaochen")
	m["childCtx"] = childCtx

	cancelFunc()

	mu.Unlock()

	time.Sleep(15 * time.Second)
}

type key struct {
	name string
}

func check() {
	for {
		mu.Lock()

		for k, v := range m {
			log.Printf("ctxName: %s", k)

			ctxValue := v.Value(key{"canceler"})
			log.Printf("ctxValue: %v", ctxValue)
		}

		mu.Unlock()

		time.Sleep(2 * time.Second)
	}
}
