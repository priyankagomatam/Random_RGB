clear, clc;
quota = check_quota;
    while(quota < 0)
        backoff;
        quota = check_quota;
    end
    for color = 1:3      
        while(quota < 0)
            backoff;
            quota = check_quota;
        end
        result = send_request(128*128, [1, 999], 1);   
        res_mat = reshape(result, [128 128]);
        R(:,:,color) = result/1000; %To get the numbers between 0 and 1. This will change
                                    % if the range changes. Include 0,1000
                                    % for white and black colours.
    end         
%
imshow(R)

