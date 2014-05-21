/*
Benchmark test tools
*/
package main

import (
	"fmt"
	"github.com/shxsun/exec"
	"github.com/shxsun/flags"
	"log"
	"time"
)

func runCmd(ch chan error, timeout time.Duration, name string, v ...string) {
	cmd := exec.Command(name, v...)
	cmd.IsClean = true
	cmd.Timeout = timeout

	ch <- cmd.Run()
}

func runRound(count int, timeout time.Duration, name string, v ...string) {
	ch := make(chan error, count)
	for i := 0; i < opts.Concurrency; i++ {
		go runCmd(ch, timeout, name, v...)
	}
	succ, fail := 0, 0
	now := time.Now()
	for i := 0; i < count; i++ {
		err := <-ch
		fmt.Print(".")
		if err != nil {
			fail += 1
		} else {
			succ += 1
		}
	}
	fmt.Println("")
	fmt.Printf("%-5s%-5s%-10s\n", "succ", "fail", "time")
	fmt.Printf("%-5d%-5d%10s\n", succ, fail, time.Since(now))
}

var opts struct {
	Concurrency int    `short:"j" long:"concurrency" description:"how many process run in the same time" default:"1"`
	Timeout     int    `short:"t" long:"timeout" description:"kill program when run timeout, unit second" default:"20"`
	Round       int    `short:"r" long:"round" description:"round count" default:"1"`
	Interval    string `short:"i" long:"interval" description:"interval between each round" default:"1s"`
}

func main() {
	args, err := flags.Parse(&opts)
	if err != nil {
		return
	}
	if len(args) == 0 {
		fmt.Println("Use -h, --help for more usage")
		return
	}

	timeout := time.Second * time.Duration(opts.Timeout)
	interval, err := time.ParseDuration(opts.Interval)
	if err != nil {
		log.Fatal(err)
	}
	for i := 0; i < opts.Round; i++ {
		start := time.Now()
		runRound(opts.Concurrency, timeout, args[0], args[1:]...)
		duration := time.Since(start)
		log.Printf("round takes %s\n", duration)
		if duration >= interval {
			continue
		}
        if i != opts.Round - 1 {
            time.Sleep(interval - duration)
        }
	}
}
