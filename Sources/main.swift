import Router
import HTTPServer

let app = Router { route in
    route.get("/hello/:name") { request in
        guard let name = request.pathParameters["name"] else {
            return Response(status: .internalServerError)
        }
        return Response(body: "Hello, \(name)!")
    }
}

try Server(host: "0.0.0.0", port: 8080, reusePort: true, responder: app).start()

