// Created by Hisen at 2020/8/11.
package main

import (
	"github.com/gin-gonic/gin"
	"github.com/hanxinhisen/thc_moss/pkg/views"
)

func main()  {
	r := gin.Default()
	r.GET("/",views.Index)
	r.Run(":8888")
}
