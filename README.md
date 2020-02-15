# SSServiceProvider

This is the sampe app for declarative service client architecture. You can find detailed blog post in my medium page. [Go to medium post.](https://medium.com/@serhatsezer/tiny-alamofire-wrapper-serviceprovider-daf08dd8952 "Go to related medium post.")

## Usage
Just declare your end point conforming `SSRequestRepresentable` protocol and define your endpoints along with request body or request parameters.
```
enum UserProvider: SSRequestRepresentable {
    typealias RequestParameters = [String: Any]
    typealias JSONBody = [String: Any]
    
    var baseURL: URL {
        return URL(string: "http://sample.com")!
    }
    
    var parameters: RequestParameters {
        let params: [String: Any] = ["API_TOKEN": "123123123",
                                     "USER_ID": 3434,
                                     "TIME_STAMP": "12042017"]
        return params
    }
    
    var bodyData: JSONBody {
        let bodyDict: [String: Any] = ["API_TOKEN": "123123123",
                                       "USER_ID": 3434,
                                       "TIME_STAMP": "12042017"]
        return bodyDict
    }
    
    case getUser(name: String)
    case getAllUser
    case updateUser(id: String)
    case reportUser(id: String)
}
```

Then initialize `SSProvider` with your endpoint object. 

```
let provider = SSProvider<UserProvider>()
provider.request(.getUser(name: "Serhat")) { (response, error) in
     if let response = response {
          print("result \(response.result)")
     }
}
```
