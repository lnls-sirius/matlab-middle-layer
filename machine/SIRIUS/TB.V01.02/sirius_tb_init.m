function sirius_tb_init(OperationalMode)
%SIRIUS_TB_INIT - MML initialization file for the TB at sirius
% 
%  See also setoperationalmode

% 2013-12-02 Inicio (Ximenes)


setao([]);
setad([]);

% Base on the location of this file
[SIRIUS_ROOT, ~, ~] = fileparts(mfilename('fullpath'));

AD.Directory.ExcDataDir  = '/home/fac_files/siriusdb/excitation_curves';

%AD.Directory.ExcDataDir = [SIRIUS_ROOT, filesep, 'excitation_curves'];

setad(AD);


% BENDS
AO.spec.FamilyName  = 'spec';
AO.spec.MemberOf    = {'PlotFamily'; 'spec'; 'BEND'; 'Magnet';};
AO.spec.DeviceList  = getDeviceList(1,1);
AO.spec.ElementList = (1:size(AO.spec.DeviceList,1))';
AO.spec.Status      = ones(size(AO.spec.DeviceList,1),1);
AO.spec.Position    = [];
AO.spec.ExcitationCurves = sirius_getexcdata(repmat('tbma-bend', size(AO.spec.DeviceList,1), 1)); 
AO.spec.Monitor.MemberOf = {};
AO.spec.Monitor.Mode = 'Simulator';
AO.spec.Monitor.DataType = 'Scalar';
AO.spec.Monitor.ChannelNames = sirius_tb_getname(AO.spec.FamilyName, 'Monitor', AO.spec.DeviceList);
AO.spec.Monitor.HW2PhysicsFcn = @bend2gev;
AO.spec.Monitor.Physics2HWFcn = @gev2bend;
AO.spec.Monitor.Units        = 'Hardware';
AO.spec.Monitor.HWUnits      = 'Ampere';
AO.spec.Monitor.PhysicsUnits = 'GeV';
AO.spec.Setpoint.MemberOf = {'MachineConfig';};
AO.spec.Setpoint.Mode = 'Simulator';
AO.spec.Setpoint.DataType = 'Scalar';
AO.spec.Setpoint.ChannelNames = sirius_tb_getname(AO.spec.FamilyName, 'Setpoint', AO.spec.DeviceList);
AO.spec.Setpoint.HW2PhysicsFcn = @bend2gev;
AO.spec.Setpoint.Physics2HWFcn = @gev2bend;
AO.spec.Setpoint.Units        = 'Hardware';
AO.spec.Setpoint.HWUnits      = 'Ampere';
AO.spec.Setpoint.PhysicsUnits = 'GeV';
AO.spec.Setpoint.Range        = [0 300];
AO.spec.Setpoint.Tolerance    = .1;
AO.spec.Setpoint.DeltaRespMat = .01;

AO.dipl.FamilyName  = 'dipl';
AO.dipl.MemberOf    = {'PlotFamily'; 'dipl'; 'BEND'; 'Magnet';};
AO.dipl.DeviceList  = getDeviceList(1,3);
AO.dipl.ElementList = (1:size(AO.dipl.DeviceList,1))';
AO.dipl.Status      = ones(size(AO.dipl.DeviceList,1),1);
AO.dipl.Position    = [];
AO.dipl.ExcitationCurves = sirius_getexcdata(repmat('tbma-bend', size(AO.dipl.DeviceList,1), 1));
AO.dipl.Monitor.MemberOf = {};
AO.dipl.Monitor.Mode = 'Simulator';
AO.dipl.Monitor.DataType = 'Scalar';
AO.dipl.Monitor.ChannelNames = sirius_tb_getname(AO.dipl.FamilyName, 'Monitor', AO.dipl.DeviceList);
AO.dipl.Monitor.HW2PhysicsFcn = @bend2gev;
AO.dipl.Monitor.Physics2HWFcn = @gev2bend;
AO.dipl.Monitor.Units        = 'Hardware';
AO.dipl.Monitor.HWUnits      = 'Ampere';
AO.dipl.Monitor.PhysicsUnits = 'GeV';
AO.dipl.Setpoint.MemberOf = {'MachineConfig';};
AO.dipl.Setpoint.Mode = 'Simulator';
AO.dipl.Setpoint.DataType = 'Scalar';
AO.dipl.Setpoint.ChannelNames = sirius_tb_getname(AO.dipl.FamilyName, 'Setpoint', AO.dipl.DeviceList);
AO.dipl.Setpoint.HW2PhysicsFcn = @bend2gev;
AO.dipl.Setpoint.Physics2HWFcn = @gev2bend;
AO.dipl.Setpoint.Units        = 'Hardware';
AO.dipl.Setpoint.HWUnits      = 'Ampere';
AO.dipl.Setpoint.PhysicsUnits = 'GeV';
AO.dipl.Setpoint.Range        = [0 300];
AO.dipl.Setpoint.Tolerance    = .1;
AO.dipl.Setpoint.DeltaRespMat = .01;

AO.injsept.FamilyName  = 'injsept';
AO.injsept.MemberOf    = {'PlotFamily'; 'injsept'; 'BEND'; 'Magnet';};
AO.injsept.DeviceList  = getDeviceList(1,1);
AO.injsept.ElementList = (1:size(AO.injsept.DeviceList,1))';
AO.injsept.Status      = ones(size(AO.injsept.DeviceList,1),1);
AO.injsept.Position    = [];
AO.injsept.ExcitationCurves = sirius_getexcdata(repmat('tbma-bend', size(AO.injsept.DeviceList,1), 1));
AO.injsept.Monitor.MemberOf = {};
AO.injsept.Monitor.Mode = 'Simulator';
AO.injsept.Monitor.DataType = 'Scalar';
AO.injsept.Monitor.ChannelNames = sirius_tb_getname(AO.injsept.FamilyName, 'Monitor', AO.injsept.DeviceList);
AO.injsept.Monitor.HW2PhysicsFcn = @bend2gev;
AO.injsept.Monitor.Physics2HWFcn = @gev2bend;
AO.injsept.Monitor.Units        = 'Hardware';
AO.injsept.Monitor.HWUnits      = 'Ampere';
AO.injsept.Monitor.PhysicsUnits = 'GeV';
AO.injsept.Setpoint.MemberOf = {'MachineConfig';};
AO.injsept.Setpoint.Mode = 'Simulator';
AO.injsept.Setpoint.DataType = 'Scalar';
AO.injsept.Setpoint.ChannelNames = sirius_tb_getname(AO.injsept.FamilyName, 'Setpoint', AO.injsept.DeviceList);
AO.injsept.Setpoint.HW2PhysicsFcn = @bend2gev;
AO.injsept.Setpoint.Physics2HWFcn = @gev2bend;
AO.injsept.Setpoint.Units        = 'Hardware';
AO.injsept.Setpoint.HWUnits      = 'Ampere';
AO.injsept.Setpoint.PhysicsUnits = 'GeV';
AO.injsept.Setpoint.Range        = [0 300];
AO.injsept.Setpoint.Tolerance    = .1;
AO.injsept.Setpoint.DeltaRespMat = .01;

AO.q1al.FamilyName  = 'q1al';
AO.q1al.MemberOf    = {'PlotFamily'; 'q1al'; 'QUAD'; 'Magnet';};
AO.q1al.DeviceList  = getDeviceList(1,2);
AO.q1al.ElementList = (1:size(AO.q1al.DeviceList,1))';
AO.q1al.Status      = ones(size(AO.q1al.DeviceList,1),1);
AO.q1al.Position    = [];
AO.q1al.ExcitationCurves = sirius_getexcdata(repmat('tbma-q', size(AO.q1al.DeviceList,1), 1));
AO.q1al.Monitor.MemberOf = {};
AO.q1al.Monitor.Mode = 'Simulator';
AO.q1al.Monitor.DataType = 'Scalar';
AO.q1al.Monitor.ChannelNames = sirius_tb_getname(AO.q1al.FamilyName, 'Monitor', AO.q1al.DeviceList);
AO.q1al.Monitor.HW2PhysicsFcn  = @sirius_hw2ph;
AO.q1al.Monitor.Physics2HWFcn  = @sirius_ph2hw;
AO.q1al.Monitor.Units        = 'Hardware';
AO.q1al.Monitor.HWUnits      = 'Ampere';
AO.q1al.Monitor.PhysicsUnits = 'meter^-2';
AO.q1al.Setpoint.MemberOf      = {'MachineConfig'};
AO.q1al.Setpoint.Mode          = 'Simulator';
AO.q1al.Setpoint.DataType      = 'Scalar';
AO.q1al.Setpoint.ChannelNames = sirius_tb_getname(AO.q1al.FamilyName, 'Setpoint', AO.q1al.DeviceList);
AO.q1al.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.q1al.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.q1al.Setpoint.Units         = 'Hardware';
AO.q1al.Setpoint.HWUnits       = 'Ampere';
AO.q1al.Setpoint.PhysicsUnits  = 'meter^-2';
AO.q1al.Setpoint.Range         = [0 225];
AO.q1al.Setpoint.Tolerance     = 0.2;
AO.q1al.Setpoint.DeltaRespMat  = 0.5; 

AO.q1bl.FamilyName  = 'q1bl';
AO.q1bl.MemberOf    = {'PlotFamily'; 'q1bl'; 'QUAD'; 'Magnet';};
AO.q1bl.DeviceList  = getDeviceList(1,1);
AO.q1bl.ElementList = (1:size(AO.q1bl.DeviceList,1))';
AO.q1bl.Status      = ones(size(AO.q1bl.DeviceList,1),1);
AO.q1bl.Position    = [];
AO.q1bl.ExcitationCurves = sirius_getexcdata(repmat('tbma-q', size(AO.q1bl.DeviceList,1), 1));
AO.q1bl.Monitor.MemberOf = {};
AO.q1bl.Monitor.Mode = 'Simulator';
AO.q1bl.Monitor.DataType = 'Scalar';
AO.q1bl.Monitor.ChannelNames = sirius_tb_getname(AO.q1bl.FamilyName, 'Monitor', AO.q1bl.DeviceList);
AO.q1bl.Monitor.HW2PhysicsFcn  = @sirius_hw2ph;
AO.q1bl.Monitor.Physics2HWFcn  = @sirius_ph2hw;
AO.q1bl.Monitor.Units        = 'Hardware';
AO.q1bl.Monitor.HWUnits      = 'Ampere';
AO.q1bl.Monitor.PhysicsUnits = 'meter^-2';
AO.q1bl.Setpoint.MemberOf      = {'MachineConfig'};
AO.q1bl.Setpoint.Mode          = 'Simulator';
AO.q1bl.Setpoint.DataType      = 'Scalar';
AO.q1bl.Setpoint.ChannelNames = sirius_tb_getname(AO.q1bl.FamilyName, 'Setpoint', AO.q1bl.DeviceList);
AO.q1bl.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.q1bl.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.q1bl.Setpoint.Units         = 'Hardware';
AO.q1bl.Setpoint.HWUnits       = 'Ampere';
AO.q1bl.Setpoint.PhysicsUnits  = 'meter^-2';
AO.q1bl.Setpoint.Range         = [0 225];
AO.q1bl.Setpoint.Tolerance     = 0.2;
AO.q1bl.Setpoint.DeltaRespMat  = 0.5; 

AO.q1cl.FamilyName  = 'q1cl';
AO.q1cl.MemberOf    = {'PlotFamily'; 'q1cl'; 'QUAD'; 'Magnet';};
AO.q1cl.DeviceList  = getDeviceList(1,1);
AO.q1cl.ElementList = (1:size(AO.q1cl.DeviceList,1))';
AO.q1cl.Status      = ones(size(AO.q1cl.DeviceList,1),1);
AO.q1cl.Position    = [];
AO.q1cl.ExcitationCurves = sirius_getexcdata(repmat('tbma-q', size(AO.q1cl.DeviceList,1), 1));
AO.q1cl.Monitor.MemberOf = {};
AO.q1cl.Monitor.Mode = 'Simulator';
AO.q1cl.Monitor.DataType = 'Scalar';
AO.q1cl.Monitor.ChannelNames = sirius_tb_getname(AO.q1cl.FamilyName, 'Monitor', AO.q1cl.DeviceList);
AO.q1cl.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.q1cl.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.q1cl.Monitor.Units        = 'Hardware';
AO.q1cl.Monitor.HWUnits      = 'Ampere';
AO.q1cl.Monitor.PhysicsUnits = 'meter^-2';
AO.q1cl.Setpoint.MemberOf      = {'MachineConfig'};
AO.q1cl.Setpoint.Mode          = 'Simulator';
AO.q1cl.Setpoint.DataType      = 'Scalar';
AO.q1cl.Setpoint.ChannelNames = sirius_tb_getname(AO.q1cl.FamilyName, 'Setpoint', AO.q1cl.DeviceList);
AO.q1cl.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.q1cl.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.q1cl.Setpoint.Units         = 'Hardware';
AO.q1cl.Setpoint.HWUnits       = 'Ampere';
AO.q1cl.Setpoint.PhysicsUnits  = 'meter^-2';
AO.q1cl.Setpoint.Range         = [0 225];
AO.q1cl.Setpoint.Tolerance     = 0.2;
AO.q1cl.Setpoint.DeltaRespMat  = 0.5; 

AO.qd2l.FamilyName  = 'qd2l';
AO.qd2l.MemberOf    = {'PlotFamily'; 'qd2l'; 'QUAD'; 'Magnet';};
AO.qd2l.DeviceList  = getDeviceList(1,1);
AO.qd2l.ElementList = (1:size(AO.qd2l.DeviceList,1))';
AO.qd2l.Status      = ones(size(AO.qd2l.DeviceList,1),1);
AO.qd2l.Position    = [];
AO.qd2l.ExcitationCurves = sirius_getexcdata(repmat('tbma-q', size(AO.qd2l.DeviceList,1), 1));
AO.qd2l.Monitor.MemberOf = {};
AO.qd2l.Monitor.Mode = 'Simulator';
AO.qd2l.Monitor.DataType = 'Scalar';
AO.qd2l.Monitor.ChannelNames = sirius_tb_getname(AO.qd2l.FamilyName, 'Monitor', AO.qd2l.DeviceList);
AO.qd2l.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.qd2l.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.qd2l.Monitor.Units        = 'Hardware';
AO.qd2l.Monitor.HWUnits      = 'Ampere';
AO.qd2l.Monitor.PhysicsUnits = 'meter^-2';
AO.qd2l.Setpoint.MemberOf      = {'MachineConfig'};
AO.qd2l.Setpoint.Mode          = 'Simulator';
AO.qd2l.Setpoint.DataType      = 'Scalar';
AO.qd2l.Setpoint.ChannelNames = sirius_tb_getname(AO.qd2l.FamilyName, 'Setpoint', AO.qd2l.DeviceList);
AO.qd2l.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.qd2l.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.qd2l.Setpoint.Units         = 'Hardware';
AO.qd2l.Setpoint.HWUnits       = 'Ampere';
AO.qd2l.Setpoint.PhysicsUnits  = 'meter^-2';
AO.qd2l.Setpoint.Range         = [0 225];
AO.qd2l.Setpoint.Tolerance     = 0.2;
AO.qd2l.Setpoint.DeltaRespMat  = 0.5; 

AO.qf2l.FamilyName  = 'qf2l';
AO.qf2l.MemberOf    = {'PlotFamily'; 'qf2l'; 'QUAD'; 'Magnet';};
AO.qf2l.DeviceList  = getDeviceList(1,1);
AO.qf2l.ElementList = (1:size(AO.qf2l.DeviceList,1))';
AO.qf2l.Status      = ones(size(AO.qf2l.DeviceList,1),1);
AO.qf2l.Position    = [];
AO.qf2l.ExcitationCurves = sirius_getexcdata(repmat('tbma-q', size(AO.qf2l.DeviceList,1), 1));
AO.qf2l.Monitor.MemberOf = {};
AO.qf2l.Monitor.Mode = 'Simulator';
AO.qf2l.Monitor.DataType = 'Scalar';
AO.qf2l.Monitor.ChannelNames = sirius_tb_getname(AO.qf2l.FamilyName, 'Monitor', AO.qf2l.DeviceList);
AO.qf2l.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.qf2l.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.qf2l.Monitor.Units        = 'Hardware';
AO.qf2l.Monitor.HWUnits      = 'Ampere';
AO.qf2l.Monitor.PhysicsUnits = 'meter^-2';
AO.qf2l.Setpoint.MemberOf      = {'MachineConfig'};
AO.qf2l.Setpoint.Mode          = 'Simulator';
AO.qf2l.Setpoint.DataType      = 'Scalar';
AO.qf2l.Setpoint.ChannelNames = sirius_tb_getname(AO.qf2l.FamilyName, 'Setpoint', AO.qf2l.DeviceList);
AO.qf2l.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.qf2l.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.qf2l.Setpoint.Units         = 'Hardware';
AO.qf2l.Setpoint.HWUnits       = 'Ampere';
AO.qf2l.Setpoint.PhysicsUnits  = 'meter^-2';
AO.qf2l.Setpoint.Range         = [0 225];
AO.qf2l.Setpoint.Tolerance     = 0.2;
AO.qf2l.Setpoint.DeltaRespMat  = 0.5; 

AO.qd3al.FamilyName  = 'qd3al';
AO.qd3al.MemberOf    = {'PlotFamily'; 'qd3al'; 'QUAD'; 'Magnet';};
AO.qd3al.DeviceList  = getDeviceList(1,1);
AO.qd3al.ElementList = (1:size(AO.qd3al.DeviceList,1))';
AO.qd3al.Status      = ones(size(AO.qd3al.DeviceList,1),1);
AO.qd3al.Position    = [];
AO.qd3al.ExcitationCurves = sirius_getexcdata(repmat('tbma-q', size(AO.qd3al.DeviceList,1), 1));
AO.qd3al.Monitor.MemberOf = {};
AO.qd3al.Monitor.Mode = 'Simulator';
AO.qd3al.Monitor.DataType = 'Scalar';
AO.qd3al.Monitor.ChannelNames = sirius_tb_getname(AO.qd3al.FamilyName, 'Monitor', AO.qd3al.DeviceList);
AO.qd3al.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.qd3al.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.qd3al.Monitor.Units        = 'Hardware';
AO.qd3al.Monitor.HWUnits      = 'Ampere';
AO.qd3al.Monitor.PhysicsUnits = 'meter^-2';
AO.qd3al.Setpoint.MemberOf      = {'MachineConfig'};
AO.qd3al.Setpoint.Mode          = 'Simulator';
AO.qd3al.Setpoint.DataType      = 'Scalar';
AO.qd3al.Setpoint.ChannelNames = sirius_tb_getname(AO.qd3al.FamilyName, 'Setpoint', AO.qd3al.DeviceList);
AO.qd3al.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.qd3al.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.qd3al.Setpoint.Units         = 'Hardware';
AO.qd3al.Setpoint.HWUnits       = 'Ampere';
AO.qd3al.Setpoint.PhysicsUnits  = 'meter^-2';
AO.qd3al.Setpoint.Range         = [0 225];
AO.qd3al.Setpoint.Tolerance     = 0.2;
AO.qd3al.Setpoint.DeltaRespMat  = 0.5; 

AO.qf3al.FamilyName  = 'qf3al';
AO.qf3al.MemberOf    = {'PlotFamily'; 'qf3al'; 'QUAD'; 'Magnet';};
AO.qf3al.DeviceList  = getDeviceList(1,1);
AO.qf3al.ElementList = (1:size(AO.qf3al.DeviceList,1))';
AO.qf3al.Status      = ones(size(AO.qf3al.DeviceList,1),1);
AO.qf3al.Position    = [];
AO.qf3al.ExcitationCurves = sirius_getexcdata(repmat('tbma-q', size(AO.qf3al.DeviceList,1), 1));
AO.qf3al.Monitor.MemberOf = {};
AO.qf3al.Monitor.Mode = 'Simulator';
AO.qf3al.Monitor.DataType = 'Scalar';
AO.qf3al.Monitor.ChannelNames = sirius_tb_getname(AO.qf3al.FamilyName, 'Monitor', AO.qf3al.DeviceList);
AO.qf3al.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.qf3al.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.qf3al.Monitor.Units        = 'Hardware';
AO.qf3al.Monitor.HWUnits      = 'Ampere';
AO.qf3al.Monitor.PhysicsUnits = 'meter^-2';
AO.qf3al.Setpoint.MemberOf      = {'MachineConfig'};
AO.qf3al.Setpoint.Mode          = 'Simulator';
AO.qf3al.Setpoint.DataType      = 'Scalar';
AO.qf3al.Setpoint.ChannelNames = sirius_tb_getname(AO.qf3al.FamilyName, 'Setpoint', AO.qf3al.DeviceList);
AO.qf3al.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.qf3al.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.qf3al.Setpoint.Units         = 'Hardware';
AO.qf3al.Setpoint.HWUnits       = 'Ampere';
AO.qf3al.Setpoint.PhysicsUnits  = 'meter^-2';
AO.qf3al.Setpoint.Range         = [0 225];
AO.qf3al.Setpoint.Tolerance     = 0.2;
AO.qf3al.Setpoint.DeltaRespMat  = 0.5; 

AO.qf3bl.FamilyName  = 'qf3bl';
AO.qf3bl.MemberOf    = {'PlotFamily'; 'qf3bl'; 'QUAD'; 'Magnet';};
AO.qf3bl.DeviceList  = getDeviceList(1,1);
AO.qf3bl.ElementList = (1:size(AO.qf3bl.DeviceList,1))';
AO.qf3bl.Status      = ones(size(AO.qf3bl.DeviceList,1),1);
AO.qf3bl.Position    = [];
AO.qf3bl.ExcitationCurves = sirius_getexcdata(repmat('tbma-q', size(AO.qf3bl.DeviceList,1), 1));
AO.qf3bl.Monitor.MemberOf = {};
AO.qf3bl.Monitor.Mode = 'Simulator';
AO.qf3bl.Monitor.DataType = 'Scalar';
AO.qf3bl.Monitor.ChannelNames = sirius_tb_getname(AO.qf3bl.FamilyName, 'Monitor', AO.qf3bl.DeviceList);
AO.qf3bl.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.qf3bl.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.qf3bl.Monitor.Units        = 'Hardware';
AO.qf3bl.Monitor.HWUnits      = 'Ampere';
AO.qf3bl.Monitor.PhysicsUnits = 'meter^-2';
AO.qf3bl.Setpoint.MemberOf      = {'MachineConfig'};
AO.qf3bl.Setpoint.Mode          = 'Simulator';
AO.qf3bl.Setpoint.DataType      = 'Scalar';
AO.qf3bl.Setpoint.ChannelNames = sirius_tb_getname(AO.qf3bl.FamilyName, 'Setpoint', AO.qf3bl.DeviceList);
AO.qf3bl.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.qf3bl.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.qf3bl.Setpoint.Units         = 'Hardware';
AO.qf3bl.Setpoint.HWUnits       = 'Ampere';
AO.qf3bl.Setpoint.PhysicsUnits  = 'meter^-2';
AO.qf3bl.Setpoint.Range         = [0 225];
AO.qf3bl.Setpoint.Tolerance     = 0.2;
AO.qf3bl.Setpoint.DeltaRespMat  = 0.5; 

AO.qd3bl.FamilyName  = 'qd3bl';
AO.qd3bl.MemberOf    = {'PlotFamily'; 'qd3bl'; 'QUAD'; 'Magnet';};
AO.qd3bl.DeviceList  = getDeviceList(1,1);
AO.qd3bl.ElementList = (1:size(AO.qd3bl.DeviceList,1))';
AO.qd3bl.Status      = ones(size(AO.qd3bl.DeviceList,1),1);
AO.qd3bl.Position    = [];
AO.qd3bl.ExcitationCurves = sirius_getexcdata(repmat('tbma-q', size(AO.qd3bl.DeviceList,1), 1));
AO.qd3bl.Monitor.MemberOf = {};
AO.qd3bl.Monitor.Mode = 'Simulator';
AO.qd3bl.Monitor.DataType = 'Scalar';
AO.qd3bl.Monitor.ChannelNames = sirius_tb_getname(AO.qd3bl.FamilyName, 'Monitor', AO.qd3bl.DeviceList);
AO.qd3bl.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.qd3bl.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.qd3bl.Monitor.Units        = 'Hardware';
AO.qd3bl.Monitor.HWUnits      = 'Ampere';
AO.qd3bl.Monitor.PhysicsUnits = 'meter^-2';
AO.qd3bl.Setpoint.MemberOf      = {'MachineConfig'};
AO.qd3bl.Setpoint.Mode          = 'Simulator';
AO.qd3bl.Setpoint.DataType      = 'Scalar';
AO.qd3bl.Setpoint.ChannelNames = sirius_tb_getname(AO.qd3bl.FamilyName, 'Setpoint', AO.qd3bl.DeviceList);
AO.qd3bl.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.qd3bl.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.qd3bl.Setpoint.Units         = 'Hardware';
AO.qd3bl.Setpoint.HWUnits       = 'Ampere';
AO.qd3bl.Setpoint.PhysicsUnits  = 'meter^-2';
AO.qd3bl.Setpoint.Range         = [0 225];
AO.qd3bl.Setpoint.Tolerance     = 0.2;
AO.qd3bl.Setpoint.DeltaRespMat  = 0.5; 

AO.qf4l.FamilyName  = 'qf4l';
AO.qf4l.MemberOf    = {'PlotFamily'; 'qf4l'; 'QUAD'; 'Magnet';};
AO.qf4l.DeviceList  = getDeviceList(1,1);
AO.qf4l.ElementList = (1:size(AO.qf4l.DeviceList,1))';
AO.qf4l.Status      = ones(size(AO.qf4l.DeviceList,1),1);
AO.qf4l.Position    = [];
AO.qf4l.ExcitationCurves = sirius_getexcdata(repmat('tbma-q', size(AO.qf4l.DeviceList,1), 1));
AO.qf4l.Monitor.MemberOf = {};
AO.qf4l.Monitor.Mode = 'Simulator';
AO.qf4l.Monitor.DataType = 'Scalar';
AO.qf4l.Monitor.ChannelNames  = sirius_tb_getname(AO.qf4l.FamilyName, 'Monitor', AO.qf4l.DeviceList);
AO.qf4l.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.qf4l.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.qf4l.Monitor.Units        = 'Hardware';
AO.qf4l.Monitor.HWUnits      = 'Ampere';
AO.qf4l.Monitor.PhysicsUnits = 'meter^-2';
AO.qf4l.Setpoint.MemberOf      = {'MachineConfig'};
AO.qf4l.Setpoint.Mode          = 'Simulator';
AO.qf4l.Setpoint.DataType      = 'Scalar';
AO.qf4l.Setpoint.ChannelNames  = sirius_tb_getname(AO.qf4l.FamilyName, 'Setpoint', AO.qf4l.DeviceList);
AO.qf4l.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.qf4l.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.qf4l.Setpoint.Units         = 'Hardware';
AO.qf4l.Setpoint.HWUnits       = 'Ampere';
AO.qf4l.Setpoint.PhysicsUnits  = 'meter^-2';
AO.qf4l.Setpoint.Range         = [0 225];
AO.qf4l.Setpoint.Tolerance     = 0.2;
AO.qf4l.Setpoint.DeltaRespMat  = 0.5; 

AO.qd4l.FamilyName  = 'qd4l';
AO.qd4l.MemberOf    = {'PlotFamily'; 'qd4l'; 'QUAD'; 'Magnet';};
AO.qd4l.DeviceList  = getDeviceList(1,1);
AO.qd4l.ElementList = (1:size(AO.qd4l.DeviceList,1))';
AO.qd4l.Status      = ones(size(AO.qd4l.DeviceList,1),1);
AO.qd4l.Position    = [];
AO.qd4l.ExcitationCurves = sirius_getexcdata(repmat('tbma-q', size(AO.qd4l.DeviceList,1), 1));
AO.qd4l.Monitor.MemberOf = {};
AO.qd4l.Monitor.Mode = 'Simulator';
AO.qd4l.Monitor.DataType = 'Scalar';
AO.qd4l.Monitor.ChannelNames  = sirius_tb_getname(AO.qd4l.FamilyName, 'Monitor', AO.qd4l.DeviceList);
AO.qd4l.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.qd4l.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.qd4l.Monitor.Units        = 'Hardware';
AO.qd4l.Monitor.HWUnits      = 'Ampere';
AO.qd4l.Monitor.PhysicsUnits = 'meter^-2';
AO.qd4l.Setpoint.MemberOf      = {'MachineConfig'};
AO.qd4l.Setpoint.Mode          = 'Simulator';
AO.qd4l.Setpoint.DataType      = 'Scalar';
AO.qd4l.Setpoint.ChannelNames  = sirius_tb_getname(AO.qd4l.FamilyName, 'Setpoint', AO.qd4l.DeviceList);
AO.qd4l.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.qd4l.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.qd4l.Setpoint.Units         = 'Hardware';
AO.qd4l.Setpoint.HWUnits       = 'Ampere';
AO.qd4l.Setpoint.PhysicsUnits  = 'meter^-2';
AO.qd4l.Setpoint.Range         = [0 225];
AO.qd4l.Setpoint.Tolerance     = 0.2;
AO.qd4l.Setpoint.DeltaRespMat  = 0.5; 

AO.qf5l.FamilyName  = 'qf5l';
AO.qf5l.MemberOf    = {'PlotFamily'; 'qf5l'; 'QUAD'; 'Magnet';};
AO.qf5l.DeviceList  = getDeviceList(1,1);
AO.qf5l.ElementList = (1:size(AO.qf5l.DeviceList,1))';
AO.qf5l.Status      = ones(size(AO.qf5l.DeviceList,1),1);
AO.qf5l.Position    = [];
AO.qf5l.ExcitationCurves = sirius_getexcdata(repmat('tbma-q', size(AO.qf5l.DeviceList,1), 1));
AO.qf5l.Monitor.MemberOf = {};
AO.qf5l.Monitor.Mode = 'Simulator';
AO.qf5l.Monitor.DataType = 'Scalar';
AO.qf5l.Monitor.ChannelNames = sirius_tb_getname(AO.qf5l.FamilyName, 'Monitor', AO.qf5l.DeviceList);
AO.qf5l.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.qf5l.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.qf5l.Monitor.Units        = 'Hardware';
AO.qf5l.Monitor.HWUnits      = 'Ampere';
AO.qf5l.Monitor.PhysicsUnits = 'meter^-2';
AO.qf5l.Setpoint.MemberOf      = {'MachineConfig'};
AO.qf5l.Setpoint.Mode          = 'Simulator';
AO.qf5l.Setpoint.DataType      = 'Scalar';
AO.qf5l.Setpoint.ChannelNames = sirius_tb_getname(AO.qf5l.FamilyName, 'Setpoint', AO.qf5l.DeviceList);
AO.qf5l.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.qf5l.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.qf5l.Setpoint.Units         = 'Hardware';
AO.qf5l.Setpoint.HWUnits       = 'Ampere';
AO.qf5l.Setpoint.PhysicsUnits  = 'meter^-2';
AO.qf5l.Setpoint.Range         = [0 225];
AO.qf5l.Setpoint.Tolerance     = 0.2;
AO.qf5l.Setpoint.DeltaRespMat  = 0.5; 

AO.qd5l.FamilyName  = 'qd5l';
AO.qd5l.MemberOf    = {'PlotFamily'; 'qd5l'; 'QUAD'; 'Magnet';};
AO.qd5l.DeviceList  = getDeviceList(1,1);
AO.qd5l.ElementList = (1:size(AO.qd5l.DeviceList,1))';
AO.qd5l.Status      = ones(size(AO.qd5l.DeviceList,1),1);
AO.qd5l.Position    = [];
AO.qd5l.ExcitationCurves = sirius_getexcdata(repmat('tbma-q', size(AO.qd5l.DeviceList,1), 1));
AO.qd5l.Monitor.MemberOf = {};
AO.qd5l.Monitor.Mode = 'Simulator';
AO.qd5l.Monitor.DataType = 'Scalar';
AO.qd5l.Monitor.ChannelNames = sirius_tb_getname(AO.qd5l.FamilyName, 'Monitor', AO.qd5l.DeviceList);
AO.qd5l.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.qd5l.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.qd5l.Monitor.Units        = 'Hardware';
AO.qd5l.Monitor.HWUnits      = 'Ampere';
AO.qd5l.Monitor.PhysicsUnits = 'meter^-2';
AO.qd5l.Setpoint.MemberOf      = {'MachineConfig'};
AO.qd5l.Setpoint.Mode          = 'Simulator';
AO.qd5l.Setpoint.DataType      = 'Scalar';
AO.qd5l.Setpoint.ChannelNames = sirius_tb_getname(AO.qd5l.FamilyName, 'Setpoint', AO.qd5l.DeviceList);
AO.qd5l.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.qd5l.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.qd5l.Setpoint.Units         = 'Hardware';
AO.qd5l.Setpoint.HWUnits       = 'Ampere';
AO.qd5l.Setpoint.PhysicsUnits  = 'meter^-2';
AO.qd5l.Setpoint.Range         = [0 225];
AO.qd5l.Setpoint.Tolerance     = 0.2;
AO.qd5l.Setpoint.DeltaRespMat  = 0.5; 

%%%%%%%%%%%%%%%%%%%%%
% Corrector Magnets %
%%%%%%%%%%%%%%%%%%%%%

% ch
AO.ch.FamilyName  = 'ch';
AO.ch.MemberOf    = {'PlotFamily'; 'COR'; 'CH'; 'HCM'; 'Magnet'};
AO.ch.DeviceList  = getDeviceList(1,5);
AO.ch.ElementList = (1:size(AO.ch.DeviceList,1))';
AO.ch.Status      = ones(size(AO.ch.DeviceList,1),1);
AO.ch.Position    = [];
AO.ch.ExcitationCurves = sirius_getexcdata(repmat('tbma-ch', size(AO.ch.DeviceList,1), 1));
AO.ch.Monitor.MemberOf = {'Horizontal'; 'COR'; 'CH'; 'HCM'; 'Magnet';};
AO.ch.Monitor.ChannelNames = sirius_tb_getname(AO.ch.FamilyName, 'Monitor', AO.ch.DeviceList);
AO.ch.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.ch.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.ch.Monitor.Mode = 'Simulator';
AO.ch.Monitor.DataType = 'Scalar';
AO.ch.Monitor.Units        = 'Physics';
AO.ch.Monitor.HWUnits      = 'Ampere';
AO.ch.Monitor.PhysicsUnits = 'Radian';
AO.ch.Setpoint.MemberOf = {'MachineConfig'; 'Horizontal'; 'COR'; 'CH'; 'HCM'; 'Magnet'; 'Setpoint'; 'measbpmresp';};
AO.ch.Setpoint.ChannelNames = sirius_tb_getname(AO.ch.FamilyName, 'Setpoint', AO.ch.DeviceList);
AO.ch.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.ch.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.ch.Setpoint.Mode = 'Simulator';
AO.ch.Setpoint.DataType = 'Scalar';
AO.ch.Setpoint.Units        = 'Physics';
AO.ch.Setpoint.HWUnits      = 'Ampere';
AO.ch.Setpoint.PhysicsUnits = 'Radian';
AO.ch.Setpoint.Range        = [-10 10];
AO.ch.Setpoint.Tolerance    = 0.00001;
AO.ch.Setpoint.DeltaRespMat = 0.0005; 

% cv
AO.cv.FamilyName  = 'cv';
AO.cv.MemberOf    = {'PlotFamily'; 'COR'; 'CV'; 'VCM'; 'Magnet'};
AO.cv.DeviceList  = getDeviceList(1,6);
AO.cv.ElementList = (1:size(AO.cv.DeviceList,1))';
AO.cv.Status      = ones(size(AO.cv.DeviceList,1),1);
AO.cv.Position    = [];
AO.cv.ExcitationCurves = sirius_getexcdata(repmat('tbma-cv', size(AO.cv.DeviceList,1), 1));
AO.cv.Monitor.MemberOf = {'Vertical'; 'COR'; 'CV'; 'VCM'; 'Magnet';};
AO.cv.Monitor.ChannelNames = sirius_tb_getname(AO.cv.FamilyName, 'Monitor', AO.cv.DeviceList);
AO.cv.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.cv.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.cv.Monitor.Mode = 'Simulator';
AO.cv.Monitor.DataType = 'Scalar';
AO.cv.Monitor.Units        = 'Physics';
AO.cv.Monitor.HWUnits      = 'Ampere';
AO.cv.Monitor.PhysicsUnits = 'Radian';
AO.cv.Setpoint.MemberOf = {'MachineConfig'; 'Horizontal'; 'COR'; 'CV'; 'VCM'; 'Magnet'; 'Setpoint'; 'measbpmresp';};
AO.cv.Setpoint.ChannelNames = sirius_tb_getname(AO.cv.FamilyName, 'Setpoint', AO.cv.DeviceList);
AO.cv.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.cv.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.cv.Setpoint.Mode = 'Simulator';
AO.cv.Setpoint.DataType = 'Scalar';
AO.cv.Setpoint.Units        = 'Physics';
AO.cv.Setpoint.HWUnits      = 'Ampere';
AO.cv.Setpoint.PhysicsUnits = 'Radian';
AO.cv.Setpoint.Range        = [-10 10];
AO.cv.Setpoint.Tolerance    = 0.00001;
AO.cv.Setpoint.DeltaRespMat = 0.0005; 


% bpmx
AO.bpmx.FamilyName  = 'bpmx';
AO.bpmx.MemberOf    = {'PlotFamily'; 'BPM'; 'bpmx'; 'Diagnostics'};
AO.bpmx.DeviceList  = getDeviceList(1,5);
AO.bpmx.ElementList = (1:size(AO.bpmx.DeviceList,1))';
AO.bpmx.Status      = ones(size(AO.bpmx.DeviceList,1),1);
AO.bpmx.Position    = [];
AO.bpmx.Golden      = zeros(length(AO.bpmx.ElementList),1);
AO.bpmx.Offset      = zeros(length(AO.bpmx.ElementList),1);
AO.bpmx.Monitor.MemberOf = {'bpmx'; 'Monitor';};
AO.bpmx.Monitor.ChannelNames = sirius_tb_getname(AO.bpmx.FamilyName, 'Monitor', AO.bpmx.DeviceList);
AO.bpmx.Monitor.Mode = 'Simulator';
AO.bpmx.Monitor.DataType = 'Scalar';
AO.bpmx.Monitor.HW2PhysicsParams = 1e-6;  % HW [um], Simulator [Meters]
AO.bpmx.Monitor.Physics2HWParams =  1e6;
AO.bpmx.Monitor.Units        = 'Hardware';
AO.bpmx.Monitor.HWUnits      = 'um';
AO.bpmx.Monitor.PhysicsUnits = 'meter';

% bpmy
AO.bpmy.FamilyName  = 'bpmy';
AO.bpmy.MemberOf    = {'PlotFamily'; 'BPM'; 'bpmy'; 'Diagnostics'};
AO.bpmy.DeviceList  = getDeviceList(1,5);
AO.bpmy.ElementList = (1:size(AO.bpmy.DeviceList,1))';
AO.bpmy.Status      = ones(size(AO.bpmy.DeviceList,1),1);
AO.bpmy.Position    = [];
AO.bpmy.Golden      = zeros(length(AO.bpmy.ElementList),1);
AO.bpmy.Offset      = zeros(length(AO.bpmy.ElementList),1);
AO.bpmy.Monitor.MemberOf = {'bpmy'; 'Monitor';};
AO.bpmy.Monitor.ChannelNames = sirius_tb_getname(AO.bpmy.FamilyName, 'Monitor', AO.bpmy.DeviceList);
AO.bpmy.Monitor.Mode = 'Simulator';
AO.bpmy.Monitor.DataType = 'Scalar';
AO.bpmy.Monitor.HW2PhysicsParams = 1e-6;  % HW [um], Simulator [Meters]
AO.bpmy.Monitor.Physics2HWParams =  1e6;
AO.bpmy.Monitor.Units        = 'Hardware';
AO.bpmy.Monitor.HWUnits      = 'um';
AO.bpmy.Monitor.PhysicsUnits = 'meter';

% The operational mode sets the path, filenames, and other important parameters
% Run setoperationalmode after most of the AO is built so that the Units and Mode fields
% can be set in setoperationalmode
setao(AO);
%setoperationalmode(OperationalMode);

 
function DList = getDeviceList(NSector,NDevices)

DList = [];
DL = ones(NDevices,2);
DL(:,2) = (1:NDevices)';
for i=1:NSector
    DL(:,1) = i;
    DList = [DList; DL];
end