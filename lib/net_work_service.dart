import 'package:http/http.dart'as http;

  var token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZTg3OTg0OWUxZGQwMjExY2QwMGU4OGExODg4OTg5NTNhMDY0OGMxNzAzZjZhZjIxNDc0NTllYWY2MGY5OTcyZmIyNTdmZDYxZWMwMjg1ZTYiLCJpYXQiOjE2OTc1Mjc1MzAuNzY5MTA0OTU3NTgwNTY2NDA2MjUsIm5iZiI6MTY5NzUyNzUzMC43NjkxMDcxMDMzNDc3NzgzMjAzMTI1LCJleHAiOjE3MjkxNDk5MzAuNzY0NDM5MTA1OTg3NTQ4ODI4MTI1LCJzdWIiOiIxMSIsInNjb3BlcyI6W119.VXzHROY4KpoaPwt-ZxnLWBjY_LVSXg60b8deYDt4EY4yVJCfeEC2QhV58kC754-SGXTa60Tv4wDRP7HKUwl4kXv-1Ba1bDkqLlm6ex_Y7nnOrctE4hIOd6dyzikAqji8xEzGCUo5piuRabcJlaA5xUbo0dE77TRvzpdis6Bfg_V07VaWbv540aNtGl0b3lnKDJZeqkGh-W_6sOjA0mXzZLYJ52l8QoT8EwDqCzEO0i6YRty5x4Rr9jcMcLDTUjJwoh7PNccOBPuzPUc2J3uC_GIgxYRmSSROrF23Lp4uH8qKSaC0gnAetwov5C_g8_QY0rWlGlqfuL_32BNcZHamQqy5vN_hCDUvpu35NN4HDOQ7XIKkkeMSH1u2cUXg8uj2ayP8YtyvP4Nkwj_nCERKx5xY-XPGfMbiYKPwxguHbjEUbHNY0QM26EgA2pHihPU9x2S7kHwd4mkk2DSoAHeXVthvJb2ITmI86jixJyrHdPsIRpzQ6mNetj7qheG8eFiAaP2Jmspov3vMc432ddO8kmZ0ImGhPxiF2SLnkX554CqUM27B3qILqhs2oLMYIftsPRAd_AZ4bZQ9ZMQ-rm7POBGLffrUJEOxiNOCYSsuwblytn3sCpzmu57dNZChxGHnmU304Qw4Y4Wc6kBX3A4iuW1ISMIF57Ci7HuU-nIirAU';
         createData(url,body,{bearerToken=false}) async {
        Map<String, String>? headers = {
          'content-type':'application/json',
          'Authorization':bearerToken==true?withToken(token):witOutToken()
        };
        var uri = Uri.parse(url);
        var response =  await http.post(uri,headers:headers,body: body);
        return response;
       }
       withToken(bearerToken){
  Map<String, String>? headers = {
          'content-type':'application/json',
          'Authorization':bearerToken

        };
 }
 witOutToken() {
   Map<String, String>? headers = {
          'content-type':'application/json',
          

        };
 }
 
 