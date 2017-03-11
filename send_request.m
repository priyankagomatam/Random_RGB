function result = send_request(num, range, col, image_size)
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
    loop = 1;
    if(n > 10000) 
        loop = ceil(n/10000);
    end
    remaining = n;
    for i = 1:loop  
        quota = check_quota;
        if(remaining > 10000) 
            num = remaining - 10000;
            
        else
            remaining = num
        end
        remaining = remaining - num;
        
        if(quota > 0)
            api = ['https://www.random.org/integers/?num=', num2str(num),'&min=1&max=999&col=128&base=10&format=plain&rnd=new'];
            %url = [api 'country/cru/tas/year/USA'];
            try
                S2 = webread(api);
                result = [str2num(S2)];

            catch 
                warning('Problem using function.  Assigning a value of 0.');
                result = 'error';
            end

        else
            result = 'Quota exceeded';
        end
end