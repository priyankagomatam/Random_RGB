# Random_RGB
The project connects to the random.org interface and obtains a set of random values, and uses this to create a 128x128 RGB image

There are four functions: main, send_request, check_quota and backoff

#### Main
This function is where the requests are sent to the interface, and the results are stored in a 3-d (128x128x3) Matrix to represent the R,G,B values of each pixel. 

Scope for development: Can automatically loop the send_requests based by calculating the size of each chunk (<10000) that will fit nicely into the RGB matrix. This involves defining the number of times we need to loop (which is ceil(128*128 / 10000)), and either specifying neat values for num with col = 128(a multiple of 128), or getting the values with col = 1 and then resizing it.

#### Send_request
This handles the requests sent to random.org. It tries to send the request, if failed, the catch block verifies if the failure was an error returned by the website. If obtained correctly, the result is returned to the main function

#### Check_quota
This ensures that the quota has not exceeded. It returns the amount of quota left for the IP address. 

#### backoff
If the quota has in fact exceeded, i.e., the value returned for check_quota is negative, a timer is executed to wait for 10 minutes and try again. 
