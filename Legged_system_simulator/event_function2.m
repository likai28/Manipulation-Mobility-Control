function [value,isterminal,direction] = event_function(t,xy)
% when value is equal to zero, an event is triggered.
% set isterminal to 1 to stop the solver at the first event, or 0 to
% get all the events.
%  direction=0 if all zeros are to be computed (the default), +1 if
%  only zeros where the event function is increasing, and -1 if only
%  zeros where the event function is decreasing.
l0=1;
value = sqrt(xy(1)^2+xy(2)^2)-l0-0.01;  % when value = 0, an event is triggered
isterminal = 1; % terminate after the first event
direction = 0;  % get all the zeros