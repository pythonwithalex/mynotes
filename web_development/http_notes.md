## **HTTP**

**request**

Telnet www.google.com 80

GET  /foo  HTTP/1.0

<verb> <path> <version>

**response**

HTTP version, status code, status reason

HTTP/1.1  200  OK

**status codes**

2xx - good

3xx - you need to do something technically to fetch resource

4xx - user side error

5xx - server side error



HTTP/1.0 - no 'keep alive optimization'

HTTP/1.1 - keep alive optimization

#### WHAT DOES A WEB APP DO?

It lives on a browser, speaks http, and generates content depending on browser requests



#### HTML FORM

hitting enter in a form isn't any different than using a submit button (by default)



#### URL ENCODING

urls can't have spaces, so they need to be transformed when generated via input with , e.g., spaces
