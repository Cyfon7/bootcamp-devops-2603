import sys
import requests

# pip install -r requirements.txt
# python request_test.py <url>

if len(sys.argv) > 1:
  arg = sys.argv[1]
else:
  arg = 'http://127.0.0.1:5000'

request = requests.get(arg)

print(request.status_code)
print(request.headers['content-type'])
print(request.encoding)
print(request.text)