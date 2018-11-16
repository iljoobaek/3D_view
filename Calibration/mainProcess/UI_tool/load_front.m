function varargout = load_front(varargin)
% LOAD_FRONT MATLAB code for load_front.fig
%      LOAD_FRONT, by itself, creates a new LOAD_FRONT or raises the existing
%      singleton*.
%
%      H = LOAD_FRONT returns the handle to a new LOAD_FRONT or the handle to
%      the existing singleton*.
%
%      LOAD_FRONT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOAD_FRONT.M with the given input arguments.
%
%      LOAD_FRONT('Property','Value',...) creates a new LOAD_FRONT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before load_front_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to load_front_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help load_front

% Last Modified by GUIDE v2.5 16-Feb-2018 21:31:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @load_front_OpeningFcn, ...
                   'gui_OutputFcn',  @load_front_OutputFcn, ...
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


% --- Executes just before load_front is made visible.
function load_front_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to load_front (see VARARGIN)

% Choose default command line output for load_front
handles.output = hObject;
matlabim = imread('front_origin2.bmp');
matlabim = imresize(matlabim, 2);
figure('Name', 'Front View click')
imshow(matlabim)
axis off
axis image

[x_clicked_front, y_clicked_front] = getpts
imshow(matlabim);
assignin('base', 'x_clicked_front', x_clicked_front/2)
assignin('base', 'y_clicked_front', y_clicked_front/2)

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes load_front wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = load_front_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
