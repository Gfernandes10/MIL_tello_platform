function asbBusDefinitionCommand(varargin) 
% ASBBUSDEFINITIONCOMMAND initializes a set of bus objects in the MATLAB base workspace 
% Copyright 2013-2023 The MathWorks, Inc.


% Bus object: angular

elems(1) = Simulink.BusElement;
elems(1).Name = 'velocity_angular_x';
elems(1).Dimensions = 1;
elems(1).DimensionsMode = 'Fixed';
elems(1).DataType = 'double';
elems(1).SampleTime = -1;
elems(1).Complexity = 'real';
elems(1).SamplingMode = 'Sample based';
elems(1).Min = [];
elems(1).Max = [];
elems(1).DocUnits = 'rad/s';
elems(1).Description = '';

elems(2) = Simulink.BusElement;
elems(2).Name = 'velocity_angular_y';
elems(2).Dimensions = 1;
elems(2).DimensionsMode = 'Fixed';
elems(2).DataType = 'double';
elems(2).SampleTime = -1;
elems(2).Complexity = 'real';
elems(2).SamplingMode = 'Sample based';
elems(2).Min = [];
elems(2).Max = [];
elems(2).DocUnits = 'rad/s';
elems(2).Description = '';

elems(3) = Simulink.BusElement;
elems(3).Name = 'velocity_angular_z';
elems(3).Dimensions = 1;
elems(3).DimensionsMode = 'Fixed';
elems(3).DataType = 'double';
elems(3).SampleTime = -1;
elems(3).Complexity = 'real';
elems(3).SamplingMode = 'Sample based';
elems(3).Min = [];
elems(3).Max = [];
elems(3).DocUnits = 'rad/s';
elems(3).Description = '';

% Bus object: linear

elems(4) = Simulink.BusElement;
elems(4).Name = 'velocity_linear_x';
elems(4).Dimensions = 1;
elems(4).DimensionsMode = 'Fixed';
elems(4).DataType = 'double';
elems(4).SampleTime = -1;
elems(4).Complexity = 'real';
elems(4).SamplingMode = 'Sample based';
elems(4).Min = [];
elems(4).Max = [];
elems(4).DocUnits = 'm/s';
elems(4).Description = '';

elems(5) = Simulink.BusElement;
elems(5).Name = 'velocity_linear_y';
elems(5).Dimensions = 1;
elems(5).DimensionsMode = 'Fixed';
elems(5).DataType = 'double';
elems(5).SampleTime = -1;
elems(5).Complexity = 'real';
elems(5).SamplingMode = 'Sample based';
elems(5).Min = [];
elems(5).Max = [];
elems(5).DocUnits = 'm/s';
elems(5).Description = '';

elems(6) = Simulink.BusElement;
elems(6).Name = 'velocity_linear_z';
elems(6).Dimensions = 1;
elems(6).DimensionsMode = 'Fixed';
elems(6).DataType = 'double';
elems(6).SampleTime = -1;
elems(6).Complexity = 'real';
elems(6).SamplingMode = 'Sample based';
elems(6).Min = [];
elems(6).Max = [];
elems(6).DocUnits = 'm/s';
elems(6).Description = '';

command = Simulink.Bus;
command.Description = '';
command.Alignment = -1;
command.Elements = elems;
clear elems;
assignin('base','BusCommand', command);

