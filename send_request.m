function result = send_request(num, range, col)
    if ~isnumeric(num) || rem(n,1) ~= 0 || n < 1
         error('N should be a valid positive number');
    end
    if(size(range) ~= 2)
        error('Enter a valid range, specify the min and max values');
    end
    image =  0;
    n = num;
    min = range(1);
    max = range(2);
    
    % n > 10000 will not work, so send multiple results
    loop=1;
    if(n>10000)
        loop = ceil(n/10000); % Number of requests with <10000 requests each
    end
    result = [];
    for i = 1:loop        
        num = floor(n/loop); % Divide the number to get chunk size
        if(i==loop && loop~=1) % If it's the last iteration - useful when chunk sizes are uneven
            num = n - (loop*num);
        end
        
        if(quota > 0)
            api = ['https://www.random.org/integers/?num=', num2str(num),'&min=', num2str(min), '&max=', num2str(999), '&col=', num2str(col)', '&base=10&format=plain&rnd=new'];
            
            try
                S2 = webread(api);
                result = [result, str2num(S2)]; % append the results

            catch 
                warning('Problem using function.  Assigning a value of 0.');
                [s, stat] = urlread(api);
                if(stat == 0) 
                    error('error with request');
                else
                    error('code error');
                end
            end

        else
            warning('Quota exceeded');
            backoff;
        end
end
