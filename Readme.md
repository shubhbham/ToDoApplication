
Using go fiber for api building:
--------------------------------
install: fiber
go get github.com/gofiber/fiber/v2

Using go air: 
--------------
install: air-verse
go install github.com/air-verse/air@latest

usiing go path:
---------------
export PATH=$PATH:/home/shubhbham/go/bin

Kill the ports in use:
----------------------
kill -9 $(lsof -t -i:4000)
fuser -k 4000/tcp
