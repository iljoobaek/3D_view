function varargout = load_left(varargin)
% LOAD_LEFT MATLAB code for load_left.fig
%      LOAD_LEFT, by itself, creates a new LOAD_LEFT or raises the existing
%      singleton*.
%
%      H = LOAD_LEFT returns the handle to a new LOAD_LEFT or the handle to
%      the existing singleton*.
%
%      LOAD_LEFT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOAD_LEFT.M with the given input arguments.
%
%      LOAD_LEFT('Property','Value',...) creates a new LOAD_LEFT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before load_left_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to load_left_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help load_left

% Last Modified by GUIDE v2.5 16-Feb-2018 21:07:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @load_left_OpeningFcn, ...
                   'gui_OutputFcn',  @load_left_OutputFcn, ...
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


% --- Executes just before load_left is made visible.
function load_left_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to load_left (see VARARGIN)

% Choose default command line output for load_left
handles.output = hObject;
matlabim = imread('left_origin2.bmp');
matlabim = imresize(matlabim, 2);
imshow(matlabim)
axis off
axis image

[x_clicked_left, y_clicked_left] = getpts
assignin('base', 'x_clicked_left', x_clicked_left/2)
assignin('base', 'y_clicked_left', y_clicked_left/2)

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes load_left wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = load_left_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
