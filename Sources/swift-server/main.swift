import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

func getAPI(request: HTTPRequest, response: HTTPResponse) {
    response.setHeader(.contentType, value: "application/json")
    _ = try? response.setBody(json: ["response": "Hello from Swift!"])
    response.completed()
}


func postAPI(request: HTTPRequest, response: HTTPResponse) {
    response.setHeader(.contentType, value: "application/json")
    let body = request.postBodyString
    let json = try? body?.jsonDecode() as? [String:Any]
    let name = json?["name"] as? String ?? "Undefined"
    
    _ = try? response.setBody(json: ["request:":name])
    response.completed()
}


func startServer(routes: Routes) {
    /// Inititiate the server on `http://localhost:8181`
  let server = HTTPServer()
  server.addRoutes(routes)
  server.serverPort = 8181

  /// Start the serever
  do {
    try server.start()
  } catch {
    print("Network error thrown: \(error)")
  }
}


/// Define the API routes
var routes = Routes()
routes.add(method: .get, uri: "/get_api", handler: getAPI)
routes.add(method: .post, uri: "/post_api", handler: postAPI)

/// Start the server
startServer(routes: routes)
