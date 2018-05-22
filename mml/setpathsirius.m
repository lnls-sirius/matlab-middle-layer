function [MachineName, SubMachineName, LinkFlag, MMLROOT] = setpathsirius(SubMachine, LinkFlag)
%SETPATHSIRIUS - Initializes the Matlab Middle Layer (MML) for Brazilian Source SIRIUS
%  [MachineName, SubMachineName, OnlineLinkMethod, MMLROOT] = setpathsirius(OnlineLinkMethod)
%
%  INPUTS
%  1. Machine - 'SIRIUS' {Default}
%  1. OnlineLinkMethod - 'None' {Default}

%  Written by Greg Portmann
%             Ximenes.

if ~isempty(strfind(SubMachine, 'StorageRing'))
    MachineType = 'StorageRing';
elseif ~isempty(strfind(SubMachine, 'Booster'))
    MachineType = 'Booster';
elseif ~isempty(strfind(SubMachine, 'TB'))
    MachineType = 'TransportLine';
elseif ~isempty(strfind(SubMachine, 'TS'))
    MachineType = 'TransportLine';
elseif ~isempty(strfind(SubMachine, 'LI'))
    MachineType = 'Linac';
end

[MachineName, SubMachineName, LinkFlag, MMLROOT] = setpathmml('SIRIUS', SubMachine, MachineType, LinkFlag);

