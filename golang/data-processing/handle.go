package main

import (
	"playground/node"

	"github.com/onrik/logrus/filename"
	log "github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
)

func init() {
	filenameHook := filename.NewHook()
	log.AddHook(filenameHook)
	log.SetLevel(log.DebugLevel)
}

// Can be run in below ways:
// 1) Master (e.g., go run handle.go master generate)
// 1) Master (e.g., go run handle.go master average)
// 1) Master (e.g., go run handle.go master median)
// 1) Master (e.g., go run handle.go master sort)
// 1) Master (e.g., go run handle.go master close)
// 2) Worker (e.g., go run handle.go worker --addr localhost:8001 --master-addr localhost:8000)
func main() {
	viper.SetConfigName("config")
	viper.AddConfigPath(".")
	var conf node.Configuration

	if err := viper.ReadInConfig(); err != nil {
		log.Errorf("Error reading config file, %s", err)
	}
	err := viper.Unmarshal(&conf)
	if err != nil {
		log.Errorf("unable to decode into struct, %v", err)
	}

	var masterCmd = &cobra.Command{
		Use: "master",
	}

	var closeCmd = &cobra.Command{
		Use:   "close",
		Short: "Close all workers",
		Run: func(cmd *cobra.Command, args []string) {
			master := node.NewMaster(conf.MasterAddr, conf.Workers, conf.ChunkSize)
			master.CloseWorkers()
		},
	}

	var genCmd = &cobra.Command{
		Use: "generate",
		Run: func(cmd *cobra.Command, args []string) {
			master := node.NewMaster(conf.MasterAddr, conf.Workers, conf.ChunkSize)
			master.Generate()
		},
	}

	var aveCmd = &cobra.Command{
		Use: "average",
		Run: func(cmd *cobra.Command, args []string) {
			master := node.NewMaster(conf.MasterAddr, conf.Workers, conf.ChunkSize)
			master.Average()
		},
	}

	var medCmd = &cobra.Command{
		Use: "median",
		Run: func(cmd *cobra.Command, args []string) {
		},
	}

	var frequencyCmd = &cobra.Command{
		Use: "freq",
		Run: func(cmd *cobra.Command, args []string) {
		},
	}

	var sortCmd = &cobra.Command{
		Use: "sort",
		Run: func(cmd *cobra.Command, args []string) {
			master := node.NewMaster(conf.MasterAddr, conf.Workers, conf.ChunkSize)
			master.Sort()
		},
	}

	var masterAddr string
	var workerAddr string
	var workerCmd = &cobra.Command{
		Use: "worker",
		Run: func(cmd *cobra.Command, args []string) {
			node.RunWorker(masterAddr, workerAddr)
		},
	}
	workerCmd.Flags().StringVarP(&masterAddr, "master-addr", "", "", "Address of master rpc socket")
	workerCmd.Flags().StringVarP(&workerAddr, "addr", "", "", "Address of worker rpc socket")
	workerCmd.MarkFlagRequired("master-addr")
	workerCmd.MarkFlagRequired("addr")

	var rootCmd = &cobra.Command{
		Use: "handle",
	}

	rootCmd.AddCommand(masterCmd, workerCmd)
	masterCmd.AddCommand(closeCmd)
	masterCmd.AddCommand(genCmd)
	masterCmd.AddCommand(aveCmd)
	masterCmd.AddCommand(medCmd)
	masterCmd.AddCommand(frequencyCmd)
	masterCmd.AddCommand(sortCmd)

	rootCmd.Execute()
}
