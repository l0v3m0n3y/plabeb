import asyncdispatch, httpclient, json, strutils

const api = "https://api.plabeb.com/api"
var headers = newHttpHeaders({"Connection": "keep-alive",  "Host": "api.plabeb.com",  "Content-Type": "application/json",  "accept": "application/json, text/plain, */*", "user-agent":"Mozilla/5.0 (Android; Android 7.1.1; LG-H910 Build/NRD90M) AppleWebKit/536.38 (KHTML, like Gecko)  Chrome/55.0.1973.314 Mobile Safari/600.3"})

proc get_servers*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/servers")
    let body = await response.body
    result=parseJson(body)
  finally:
    client.close()
