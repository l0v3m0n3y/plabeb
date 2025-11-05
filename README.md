# plabeb
api for plabeb.com vpn service for Android 
# Example
```nim
import asyncdispatch, plabeb, json

let data = waitFor get_servers()
let servers = data["data"]
for server in servers:
  echo server["name"].getStr()
  echo server["location"].getStr()
  echo server["gateway"].getStr()
  echo $server["signal_level"].getInt() & "%"
  echo server["tag"].getStr()
  echo ""
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
