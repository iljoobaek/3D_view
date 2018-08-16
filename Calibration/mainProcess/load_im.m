function varargout = load_im(varargin)
% LOAD_IM MATLAB code for load_im.fig
%      LOAD_IM, by itself, creates a new LOAD_IM or raises the existing
%      singleton*.
%
%      H = LOAD_IM returns the handle to a new LOAD_IM or the handle to
%      the existing singleton*.
%
%      LOAD_IM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOAD_IM.M with the given input arguments.
%
%      LOAD_IM('Property','Value',...) creates a new LOAD_IM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before load_im_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to load_im_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help load_im

% Last Modified by GUIDE v2.5 28-Sep-2017 20:57:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @load_im_OpeningFcn, ...
                   'gui_OutputFcn',  @load_im_OutputFcn, ...
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


% --- Executes just before load_im is made visible.
function load_im_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to load_im (see VARARGIN)

% Choose default command line output for load_im
handles.output = hObject;

%axes(axisHandle)

% matlabim = imread('front_0711.png');
% matlabim = imread('rear_0711.png');
% matlabim = imread('left_0711.png');
% matlabim = imread('right_0711.png');

% matlabim = imread('front_narrow_0711.png');
% matlabim = imread('rear_narrow_0711.png');
% matlabim = imread('left_narrow_0711.png');
% matlabim = imread('right_narrow_0711.png');

% matlabim = imread('wide_LR_front.png');
% matlabim = imread('wide_LR_rear.png');
% matlabim = imread('wide_LR_left.png');
% matlabim = imread('wide_LR_right.png');

% matlabim = imread('calib_0807/regular_front_0807.png');
% matlabim = imread('calib_0807/regular_rear_0807.png');
% matlabim = imread('calib_0807/regular_left_0807.png');
% matlabim = imread('calib_0807/regular_right_0807.png');

% matlabim = imread('calib_0807/narrow_front_0807.png');
% matlabim = imread('calib_0807/narrow_rear_0807.png');
% matlabim = imread('calib_0807/narrow_left_0807.png');
% matlabim = imread('calib_0807/narrow_right_0807.png');

% matlabim = imread('calib_0808/front_0808.png');
% matlabim = imread('calib_0808/rear_0808.png');
% matlabim = imread('calib_0808/left_normal_0808.png');
% matlabim = imread('calib_0808/left_narrow_0808.png');
matlabim = imread('calib_0808/right_normal_0808.png');
% matlabim = imread('calib_0808/right_narrow_0808.png');


%matlabim = imresize(matlabim);
imshow(matlabim);
axis off
axis image

[x_clicked, y_clicked] = getpts
assignin('base', 'x_clicked', x_clicked)
assignin('base', 'y_clicked', y_clicked)

points = 31;
coordinates = size(2, points)
for i = 1:points
    coordinates (i, 1) = x_clicked (i);
    coordinates (i, 2) = y_clicked (i);
end

csvwrite ('2Dcoordinates.csv', coordinates)
% Update handles structure
guidata(hObject, handles);


% UIWAIT makes load_im wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = load_im_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
