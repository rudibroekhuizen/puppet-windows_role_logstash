convertto-json @(Get-EventLog System -After (Get-Date).AddMinutes(-1)) | Out-File "C:/Windows/Temp/json_array.json" -encoding utf8
cmd /c "jq -c .[] < C:/Windows/Temp/json_array.json" | Out-File -Append -NoClobber "C:/Windows/Temp/json_objects.json" -encoding utf8
