import sys
import requests

# pip install -r requirements.txt
# python request_test.py <url>

arg = sys.argv[1]

request = requests.get(arg)

print(request.status_code)
print(request.headers['content-type'])
print(request.encoding)
print(request.text)