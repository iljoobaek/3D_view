function  timerFunc( obj, event, w )
%TIMERFUNC Timer call back function
%   This function will be called by Matlab periodically
%   We will in turn, use it to call dvcWorld.step()

w.step();

%% debugging stuffs

% txt1 = ' event occurred at ';
% txt2 = string_arg;
% 
% event_type = event.Type;
% event_time = datestr(event.Data.time);
% 
% msg = [event_type txt1 event_time];
% disp(msg)
% disp(txt2)

end

