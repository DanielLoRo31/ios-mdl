package middleware

import "github.com/dgrijalva/jwt-go"

var JwtKey = []byte("secret_password")

type Clamis struct {
	Email string `json:"email"`
	// ID string `json:"id"`
	jwt.StandardClaims
}
