package main

import (
	"fmt"

	pg_query "github.com/pganalyze/pg_query_go/v6"
)

func main() {
	result, err := pg_query.Parse("SELECT 42")
	if err != nil {
		panic(err)
	}

	result.Stmts[0].Stmt.GetSelectStmt().GetTargetList()[0].GetResTarget().Val = pg_query.MakeAConstStrNode("Hello World", -1)

	stmt, err := pg_query.Deparse(result)
	if err != nil {
		panic(err)
	}
	fmt.Printf("%s\n", stmt)
}
