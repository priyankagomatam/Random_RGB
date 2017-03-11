function result = send_request(num, range, col, image_size)
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
    if(nargin == 3)
        image = 1;        
        if(size(range) ~= 2)
            error('Enter a valid range, specify the row and col size');
        
        else
            image_row = image_size(1);
            image_col = image_size(2);            
        end       
    end
    % n > 10000 will not work, so send multiple results
    
        if(quota > 0)
            api = ['https://www.random.org/integers/?num=', num2str(num),'&min=1&max=999&col=128&base=10&format=plain&rnd=new'];
            %url = [api 'country/cru/tas/year/USA'];
            try
                S2 = webread(api);
                result = [str2num(S2)];

            catch 
                warning('Problem using function.  Assigning a value of 0.');
                [s, stat] = urlread(api);
                if(stat == 0) 
                    result = 'error with request';
                else
                    result = 'code error';
                end
            end

        else
            result = 'Quota exceeded';
            backoff;
        end
end
