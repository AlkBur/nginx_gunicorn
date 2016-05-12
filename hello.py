def application(environ, start_response):
    """Simplest possible application object"""
    resp = environ['QUERY_STRING']
    resp = resp.replace('&','\n')
    #resp = [item+"\r\n" for item in resp]
    status = '200 OK'
    
    response_headers = [
        ('Content-type','text/plain'),
        ('Content-Length', str(len(resp)))
    ]
    start_response(status, response_headers) 
    
    return resp
