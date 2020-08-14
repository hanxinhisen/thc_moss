// Created by Hisen at 2020/8/11..
package views

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
	"os"
)

func Index(c *gin.Context) {
	hostname, err := os.Hostname()
	if err != nil {
		hostname = "Unknown"
	}
	c.String(http.StatusOK, fmt.Sprintf("v1.2--%s", hostname))

}
