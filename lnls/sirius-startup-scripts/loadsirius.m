function loadsirius(varargin)
% Inicializa as estruturas do MML-SIRIUS

Disconnect = false;

default_tb_version = 'TB.V02.01';
default_bo_version = 'BO.V04.01';
default_ts_version = 'TS.V03.04';
default_si_version = 'SI.V22.04';
default_link       = 'NONE';

submachine = 'StorageRing';
default_version = default_si_version;

for i=length(varargin):-1:1
    if ischar(varargin{i})
        varargin{i} = upper(varargin{i});
        if strfind(varargin{i}, 'TB')
            submachine = 'TB';
            default_version = default_tb_version;
        elseif strfind(varargin{i}, 'BO')
            submachine = 'Booster';
            default_version = default_bo_version;
        elseif strfind(varargin{i}, 'TS')
            submachine = 'TS';
            default_version = default_ts_version;
        elseif strfind(varargin{i}, 'SI')
            submachine = 'StorageRing';
            default_version = default_si_version;
        elseif strcmpi(varargin{i}, 'LABCA')
            default_link = 'LABCA';
        elseif strcmpi(varargin{i}, 'CA_MATLAB')
            default_link = 'CA_MATLAB';
        end
    end
end
setappdata(0, 'SIRIUSMachineVersion', default_version)

% inicializa estruturas do MML
cdir = pwd;
root_folder = sirius_get_root_folder();
folder = fullfile(root_folder, 'matlab-middle-layer','mml');
if ~exist(folder, 'dir')
    folder = fullfile(root_folder, 'code', 'matlab-middle-layer','mml');
end
cd(folder)

% remove toolbox/finance/finsupport/ do path para previnir conflito com
% funcao drift da Financial Toolbox (se pasta est?? no caminho, para evitar warningMessage)
fins = fullfile(matlabroot, 'toolbox', 'finance', 'finsupport');
if ~isempty(strfind(path, fins))
    rmpath(fins);
end
mmlpaths = textscan(path(), '%s', 'delimiter', pathsep); mmlpaths = mmlpaths{1};
for i=1:length(mmlpaths)
    if ~isempty(strfind(mmlpaths{i},'matlab-middle-layer')) && isempty(strfind(mmlpaths{i}, 'sirius-startup-scripts'))
        rmpath(mmlpaths{i})
    end
end

% Ximenes 2015-09-09
if strcmpi(default_link, 'LABCA')
    % Luana 2015-08-25
    setpathsirius(submachine, 'LABCA');
    lcaSetTimeout(.01);
elseif strcmpi(default_link, 'CA_MATLAB')
    setpathsirius(submachine, 'CA_MATLAB');
    ca_matlab_lib = fullfile(root_folder, 'matlab-middle-layer','links','ca_matlab','ca_matlab-1.0.0.jar');
    javaaddpath(ca_matlab_lib);
    ca_matlab_config = fullfile(root_folder, 'matlab-middle-layer','links','ca_matlab');
    javaaddpath(ca_matlab_config);
    import ch.psi.jcae.*;
    ca_properties = java.util.Properties();
    ca_context = Context(ca_properties);
    setappdata(0, 'ca_context', ca_context);
else
    setpathsirius(submachine, 'NONE');
end

cd(cdir);
clear cdir;

folder = fullfile(root_folder, 'matlab-middle-layer');
if ~exist(folder,'dir')
    folder = fullfile(root_folder, 'code', 'matlab-middle-layer');
end
addpath(genpath(fullfile(folder,'applications','lnls','lattice_errors')),'-begin');
addpath(fullfile(folder,'lnls','fac_scripts','trackcpp'), '-begin');
