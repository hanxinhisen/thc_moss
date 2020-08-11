// Created by Hisen at 2020/8/11.
package views

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func Index(c *gin.Context) {
	c.String(http.StatusOK, "v1.0")

}
