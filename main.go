package main

import (
	"context"
	"fmt"
	"log"
	"os"

	"github.com/gofiber/fiber/v2"
	"github.com/joho/godotenv"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

type Todo struct {
	ID        int    `json:"_id" bson:"_id"`
	Completed bool   `json:"completed"`
	Body      string `json:"body"`
}

var collection *mongo.Collection

func main() {

	err := godotenv.Load(".env")
	if err != nil {
		log.Fatal("Error loading .env file", err)
	}

	MONGODB_URI := os.Getenv("MONGODB_URI")
	clientOptions := options.Client().ApplyURI(MONGODB_URI)
	client, err := mongo.Connect(context.Background(), clientOptions)

	if err != nil {
		log.Fatal(err)
	}

	err = client.Ping(context.Background(), nil)

    if err!=nil{
		log.Fatal(err)
	}

	fmt.Println("Connected to MONGODB ATLAS :")

	collection = client.Database("golang_db").Collection("todos")
	app:=fiber.New()
	app.Get("/api/todos",getTodos)
	app.Post("/api/todos",createTodos)
	app.Patch("/api/todos/:id",updateTodos)
	app.Delete("/api/todos/:id",deleteTodos)

	PORT=5000
PASSWORD=gvTO3jd5j4t5RV7X
USERNAME=shubhbhamise
MONGODB_URI=mongodb+srv://shubhbhamise:gvTO3jd5j4t5RV7X@cluster0.qp3vv1a.mongodb.net/golang_db?retryWrites=true&w=majority&appName=Cluster0




}
