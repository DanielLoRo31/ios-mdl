package routes

import (
	"net/http"

	"github.com/Dall06/cashcoin-api-mysql/handlers"
	"github.com/Dall06/cashcoin-api-mysql/middleware"
	"github.com/gorilla/mux"
)

func SetUserRoutes(router *mux.Router) {
	middleware.EnableCORS(router)
	subRoute := router.PathPrefix("/api/user").Subrouter()
	subRoute.HandleFunc("/find/{id}", handlers.FindUserByEmailHandler).Methods(http.MethodGet)
	subRoute.HandleFunc("/save", handlers.SaveUserHandler).Methods(http.MethodPost)
	subRoute.HandleFunc("/edit", handlers.EditUserHandler).Methods(http.MethodPut)
	subRoute.HandleFunc("/delete", handlers.DeleteUserHandler).Methods(http.MethodDelete)
}
