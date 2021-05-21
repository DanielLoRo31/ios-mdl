package handlers

import (
	"encoding/json"
	"net/http"

	"github.com/Dall06/cashcoin-api-mysql/models"
	"github.com/Dall06/cashcoin-api-mysql/repositories"
	// "github.com/Dall06/cashcoin-api-mysql/utils"
	"github.com/google/uuid"
	"github.com/gorilla/mux"
)


func FindUserByEmailHandler(w http.ResponseWriter, r *http.Request) {
	email := mux.Vars(r)["email"]
	user, err := repositories.GetUserByEmail(email)
	if err != nil {
		RespondWithInternalServerError(err, w)
		return
	}
	RespondWithSuccess(user, w)
}

func SaveUserHandler(w http.ResponseWriter, r *http.Request) {
	var user models.UserData
	// decode json
	err := json.NewDecoder(r.Body).Decode(&user)
	if err != nil {
		RespondWithInternalServerError(err, w)
		return
	}
	// Generating code and hash password
	uuidCode := uuid.New().String()
	if uuidCode == "" {
		RespondWithInternalServerError("uuid error", w)
	}
	if err != nil {
		RespondWithInternalServerError("Error whn hashing password", w)
	}
	user.Code = uuidCode
	// consult
	result, err := repositories.CreateUser(user)
	if err != nil {
		RespondWithInternalServerError(err, w)
		return
	}
	RespondWithSuccess(result, w)
}

func EditUserHandler(w http.ResponseWriter, r *http.Request) {
	var validationStatus bool = ValidateTokenCookie(w, r)
	if validationStatus == false {
		RespondWithInternalServerError(validationStatus, w)
		return
	}
	var user models.UserData

	err := json.NewDecoder(r.Body).Decode(&user)
	if err != nil {
		RespondWithInternalServerError(err, w)
		return
	}
	if user.ID <= 0 {
		RespondWithBadRequest("Bad ID", w)
	}

	result, err := repositories.UpdateUser(user)
	if err != nil {
		RespondWithInternalServerError(err, w)
		return
	}
	RespondWithSuccess(result, w)
}

func DeleteUserHandler(w http.ResponseWriter, r *http.Request) {
	var user models.UserData
	err := json.NewDecoder(r.Body).Decode(&user)

	if err != nil {
		RespondWithInternalServerError(err, w)
		return
	}
	if user.ID <= 0 {
		RespondWithBadRequest("Bad ID", w)
	}
	result, err := repositories.DeleteUser(user.ID)
	if err != nil {
		RespondWithInternalServerError(err, w)
		return
	}
	RespondWithSuccess(result, w)
}

