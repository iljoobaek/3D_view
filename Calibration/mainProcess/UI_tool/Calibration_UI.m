function varargout = Calibration_UI(varargin)
% CALIBRATION_UI MATLAB code for Calibration_UI.fig
%      CALIBRATION_UI, by itself, creates a new CALIBRATION_UI or raises the existing
%      singleton*.
%
%      H = CALIBRATION_UI returns the handle to a new CALIBRATION_UI or the handle to
%      the existing singleton*.
%
%      CALIBRATION_UI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CALIBRATION_UI.M with the given input arguments.
%
%      CALIBRATION_UI('Property','Value',...) creates a new CALIBRATION_UI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Calibration_UI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Calibration_UI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Calibration_UI

% Last Modified by GUIDE v2.5 25-Feb-2018 22:18:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Calibration_UI_OpeningFcn, ...
                   'gui_OutputFcn',  @Calibration_UI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

global i;
i = 0;

% --- Executes just before Calibration_UI is made visible.
function Calibration_UI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Calibration_UI (see VARARGIN)

% Choose default command line output for Calibration_UI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.pushbutton6,'enable','off');
set(handles.pushbutton6,'visible','off');
set(handles.pushbutton7,'enable','off');
set(handles.pushbutton7,'visible','off');
set(handles.pushbutton11,'enable','off');
set(handles.pushbutton11,'visible','off');
set(handles.pushbutton12,'enable','off');
set(handles.pushbutton12,'visible','off');
set(handles.pushbutton13,'enable','off');
set(handles.pushbutton13,'visible','off');
set(handles.pushbutton14,'enable','off');
set(handles.pushbutton14,'visible','off');


% UIWAIT makes Calibration_UI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Calibration_UI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
evalin( 'base', 'clearvars *' );
figure('Name', 'Right View')
imshow('right_origin2.bmp');
i = 2;
assignin('base', 'i', i)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
evalin( 'base', 'clearvars *' );
figure('Name', 'Front View')
imshow('front_origin2.bmp');
i = 1;
assignin('base', 'i', i)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
evalin( 'base', 'clearvars *' );
figure('Name', 'Left View')
imshow('left_origin2.bmp');
i = 3;
assignin('base', 'i', i)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
evalin( 'base', 'clearvars *' );
figure('Name', 'Rear View')
imshow('rear_origin2.bmp');
i = 4;
assignin('base', 'i', i)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton1,'enable','off');
set(handles.pushbutton1,'visible','off');
set(handles.pushbutton2,'enable','off');
set(handles.pushbutton2,'visible','off');
set(handles.pushbutton3,'enable','off');
set(handles.pushbutton3,'visible','off');
set(handles.pushbutton4,'enable','off');
set(handles.pushbutton4,'visible','off');
set(handles.pushbutton6,'enable','on');
set(handles.pushbutton6,'visible','on');


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
i = evalin('base', 'i');
if (i == 1)
    demoloadawobj_front;
    obj_front = readObj('elliptical_mesh_rectcutout_front.obj');
    assignin('base', 'obj_front', obj_front);
elseif (i == 2)
    demoloadawobj_right;
    obj_right = readObj('elliptical_mesh_side_flat_rectcutout_right.obj');
    assignin('base', 'obj_right', obj_right);
elseif (i == 3)
    demoloadawobj_left;
    obj_left = readObj('elliptical_mesh_side_flat_rectcutout_left.obj');
    assignin('base', 'obj_left', obj_left);
elseif (i == 4)
    demoloadawobj_rear;
    obj_rear = readObj('elliptical_mesh_rectcutout_rear.obj');
    assignin('base', 'obj_rear', obj_rear);
end
set(handles.pushbutton11,'enable','on');
set(handles.pushbutton11,'visible','on');
set(handles.pushbutton5,'enable','off');
set(handles.pushbutton5,'visible','off');


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton11,'enable','off');
set(handles.pushbutton11,'visible','off');
i = evalin('base', 'i');
if (i == 1)
    load_front;
    front_ellipse;
    shuffle_v_vt_front;
    copy_to_file_front;
elseif (i == 2)
    load_right;
    right_ellipse_flat;
    shuffle_v_vt_right;
    copy_to_file_right;
elseif (i == 3)
    load_left;
    left_ellipse_flat;
    shuffle_v_vt_left;
    copy_to_file_left;
elseif (i == 4)
    load_rear;
    rear_ellipse;
    shuffle_v_vt_rear;
    copy_to_file_rear;
end
set(handles.pushbutton12,'enable','on');
set(handles.pushbutton12,'visible','on');
set(handles.pushbutton13,'enable','on');
set(handles.pushbutton13,'visible','on');
set(handles.pushbutton7,'enable','off');
set(handles.pushbutton7,'visible','off');
set(handles.pushbutton14,'enable','on');
set(handles.pushbutton14,'visible','on');

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton7,'enable','on');
set(handles.pushbutton7,'visible','on');
set(handles.pushbutton6,'enable','off');
set(handles.pushbutton6,'visible','off');


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(Calibration_UI);


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
i = evalin('base', 'i');
set(handles.pushbutton7,'enable','off');
set(handles.pushbutton7,'visible','off');
set(handles.pushbutton12,'enable','off');
set(handles.pushbutton12,'visible','off');
set(handles.pushbutton11,'enable','off');
set(handles.pushbutton11,'visible','off');
set(handles.pushbutton13,'enable','off');
set(handles.pushbutton13,'visible','off');
if (i == 1)
    set(handles.pushbutton2,'enable','off');
    set(handles.pushbutton2,'visible','on');
    set(handles.pushbutton1,'enable','on');
    set(handles.pushbutton1,'visible','on');
    set(handles.pushbutton3,'enable','on');
    set(handles.pushbutton3,'visible','on');
    set(handles.pushbutton4,'enable','on');
    set(handles.pushbutton4,'visible','on');
elseif (i == 2)
    set(handles.pushbutton1,'enable','off');
    set(handles.pushbutton1,'visible','on');
    set(handles.pushbutton2,'enable','on');
    set(handles.pushbutton2,'visible','on');
    set(handles.pushbutton3,'enable','on');
    set(handles.pushbutton3,'visible','on');
    set(handles.pushbutton4,'enable','on');
    set(handles.pushbutton4,'visible','on');
elseif (i == 3)
    set(handles.pushbutton3,'enable','off');
    set(handles.pushbutton3,'visible','on');
    set(handles.pushbutton1,'enable','on');
    set(handles.pushbutton1,'visible','on');
    set(handles.pushbutton2,'enable','on');
    set(handles.pushbutton2,'visible','on');
    set(handles.pushbutton4,'enable','on');
    set(handles.pushbutton4,'visible','on');
elseif (i == 4)
    set(handles.pushbutton4,'enable','off');
    set(handles.pushbutton4,'visible','on');
    set(handles.pushbutton1,'enable','on');
    set(handles.pushbutton1,'visible','on');
    set(handles.pushbutton2,'enable','on');
    set(handles.pushbutton2,'visible','on');
    set(handles.pushbutton3,'enable','on');
    set(handles.pushbutton3,'visible','on');
end
set(handles.pushbutton5,'enable','on');
set(handles.pushbutton5,'visible','on');
set(handles.pushbutton14,'enable','off');
set(handles.pushbutton14,'visible','off');


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton12,'enable','off');
set(handles.pushbutton12,'visible','off');
set(handles.pushbutton13,'enable','off');
set(handles.pushbutton13,'visible','off');
set(handles.pushbutton14,'enable','off');
set(handles.pushbutton14,'visible','off');
i = evalin('base', 'i');
if (i == 2)
    set(handles.pushbutton1,'visible','on');
    set(handles.pushbutton1,'enable','on');
end
if (i == 1)
    set(handles.pushbutton2,'visible','on');
    set(handles.pushbutton2,'enable','on');
end
if (i == 3)
    set(handles.pushbutton3,'visible','on');
    set(handles.pushbutton3,'enable','on');
end
if (i == 4)
    set(handles.pushbutton4,'visible','on');
    set(handles.pushbutton4,'enable','on');
end

set(handles.pushbutton5,'visible','on');
set(handles.pushbutton5,'enable','on');
