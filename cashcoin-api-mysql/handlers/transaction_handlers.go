package handlers

import (
	"encoding/json"
	"net/http"

	"github.com/Dall06/cashcoin-api-mysql/models"
	"github.com/Dall06/cashcoin-api-mysql/repositories"
	"github.com/gorilla/mux"
)


func MakeTransactionHandler(w http.ResponseWriter, r *http.Request) {
	// Validate your token
	var validationStatus bool = ValidateTokenCookie(w, r)
	if validationStatus == false {
		RespondWithInternalServerError(validationStatus, w)
		return
	}
	// transaction from transactionDetail is created
	var transaction models.TransactionDetail
	// if error when decode
	err := json.NewDecoder(r.Body).Decode(&transaction)
	if err != nil {
		RespondWithInternalServerError(err, w)
		return
	}
	// Make transaction mysql consult
	result, err := repositories.MakeTransaction(transaction)
	// if err different from nil response error
	if err != nil {
		RespondWithInternalServerError(result, w)
		return
	}
	RespondWithSuccess(transaction, w)
}

func FindUserTransactionsHandler(w http.ResponseWriter, r *http.Request) {
	codeString := mux.Vars(r)["code"]
	if codeString == "" {
		RespondWithBadRequest("Empty user code", w)
		return
	}
	// Get transactions of the specific user
	transaction, err := repositories.GetUserTransactions(codeString)
	if err != nil {
		RespondWithInternalServerError(err, w)
		return
	}
	RespondWithSuccess(transaction, w)
}