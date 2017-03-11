clear, clc;
quota = check_quota;
    while(quota < 0)
        backoff;
        quota = check_quota;
    end
    for color = 1:3
        result2 = send_request(9600, [1, 999], 128, [128,128]); % Have to automate the split instead of hardcoding requests
        result3 = send_request(6784, [1, 999], 128, [128,128]);
        result = [result2; result3];
        R(:,:,color) = result/1000;
    end 
        
%%
imshow(R)

