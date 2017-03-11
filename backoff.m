function [] = backoff
    t = timer;
    t.StartDelay = 3;
    t.TimerFcn = @(~, ~)disp('Trying again after 10 minutes');
    start(t)
end

