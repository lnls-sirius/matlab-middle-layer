function GeV = bend2gev(varargin)
%BEND2GEV - Compute the energy based on the ramp tables
% GeV = bend2gev(Family, Field, Amps, DeviceList, BranchFlag)
%
%  INPUTS
%  1. Bend - Bend magnet family {Optional}
%  2. Field - Field {Optional}
%  3. Amps - Bend magnet current
%  4. DeviceList - Bend magnet device list to reference energy to {Default: BEND(1,1)}
%  5. BranchFlag - 1 -> Lower branch
%                  2 -> Upper branch {Default}
%
%  OUTPUTS
%  1. GeV - Electron beam energy [GeV]
%
%  See also gev2bend, getenergy

%  Written by Greg Portmann


% Default
Family = '';
Field = '';
Amps = [];
DeviceList = [];
BranchFlag = [];

ModeFlag = '';  % model, online, manual
UnitsFlag = ''; % hardware, physics
for i = length(varargin):-1:1
    if isstruct(varargin{i})
        % Ignor structures
    elseif iscell(varargin{i})
        % Ignor cells
    elseif strcmpi(varargin{i},'struct')
        varargin(i) = [];
    elseif strcmpi(varargin{i},'numeric')
        varargin(i) = [];
    elseif strcmpi(varargin{i},'physics')
        UnitsFlag = 'Physics';
        varargin(i) = [];
    elseif strcmpi(varargin{i},'hardware')
        UnitsFlag = varargin{i};
        varargin(i) = [];
    elseif strcmpi(varargin{i},'simulator') || strcmpi(varargin{i},'model')
        ModeFlag = varargin{i};
        varargin(i) = [];
    elseif strcmpi(varargin{i},'online')
        ModeFlag = varargin{i};
        varargin(i) = [];
    elseif strcmpi(varargin{i},'manual')
        ModeFlag = varargin{i};
        varargin(i) = [];
    end        
end


if length(varargin) >= 1
    if ischar(varargin{1})
        Family = varargin{1};
        varargin(1) = [];
    else
        Amps = varargin{1};
        varargin(1) = [];
        if length(varargin) >= 1
            DeviceList = varargin{1};
            varargin(1) = [];
        end
        if length(varargin) >= 1
            BranchFlag = varargin{1};
            varargin(1:end) = [];
        end
    end
end
if length(varargin) >= 1 && ischar(varargin{1})
    Field = varargin{1};
    varargin(1) = [];
end
if length(varargin) >= 1
    Amps = varargin{1};
    varargin(1) = [];
end
if length(varargin) >= 1
    DeviceList = varargin{1};
    varargin(1) = [];
end
if length(varargin) >= 1
    BranchFlag = varargin{1};
    varargin(1) = [];
end


if isempty(Family)
    Family = 'BEND';
end
if isempty(ModeFlag)
    ModeFlag = getmode(Family);
end

if isempty(Field)
    Field = 'Setpoint';
end
if isempty(DeviceList)
    DeviceList = family2dev(Family);
    if all(size(Amps)==[1 1]) || isempty(Amps)
        DeviceList = DeviceList(1,:);
    end
end


% Hysteresis branch
if isempty(BranchFlag)
    if strcmpi(getfamilydata('HysteresisBranch'),'Lower')
        % Lower branch
        BranchFlag = 1;
    else
        % Upper branch (default)
        BranchFlag = 2;
    end
else
    if char(BranchFlag)
        if strcmpi(BranchFlag, 'Lower')
            % Lower branch
            BranchFlag = 1;
        elseif strcmpi(BranchFlag, 'Upper')
            % Upper branch
            BranchFlag = 2;
        end
    end
end


if isempty(Amps)
    if strcmpi(ModeFlag,'simulator') || strcmpi(ModeFlag,'model')
        % The model energy is used only if Amps is empty
        GeV = getenergymodel;
        return;
    else 
        Amps = getpv(Family, Field, [1 1], 'Hardware', ModeFlag);
        UnitsFlag = 'UnitsFlag';
    end
end

if size(Amps,1) == 1 && size(DeviceList,1) > 1
    Amps = ones(size(DeviceList,1),1) * Amps;
end

% End of input checking
% Machine dependent stuff below


% Amps should be in hardware units
if strcmpi(UnitsFlag,'Physics')
    Amps = physics2hw(Family, 'Setpoint', Amps, DeviceList);
end


% Get the proper table
if BranchFlag == 1
    % Lower branch (ramp up) ELOG 559
    a1 = 0.96009;
    a2 = -0.69526E-10;
    a3 = 0.99451;
    a4 = 0.38157E-01;
    a5 = 0.94392;
    a6 = 0.13181E-01;
else
    % Upper branch (ramp down) ELOG 559
    a1 = 0.97820;
    a2 = -0.20452E-04;
    a3 = 0.99451;
    a4 = 0.15580E-01;
    a5 = 0.94392;
    a6 = 0.23877E-01;
end


ger = a1 + a2 * Amps;
hysks = (a3 - a1 - 105.70 *a2).*exp(-(Amps-105.70)*a4);
hysgs = (a5 - a1 - 665.98 *a2).*exp( (Amps-665.98)*a6);

MeV = ger + hysgs + hysks;
GeV = Amps .* MeV / 1000;
