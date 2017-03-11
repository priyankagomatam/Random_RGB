function quota = check_quota     
    quota_url = 'http://www.random.org/quota/?format=plain';
    %url = [api 'country/cru/tas/year/USA'];
    S = webread(quota_url);
    quota = str2num(S);
% quota = S;
end