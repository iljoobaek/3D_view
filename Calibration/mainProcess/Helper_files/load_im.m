% This file loads the image and interactively allows the user to click
% coordinates on the image through cursor interface
function varargout = load_im(varargin)

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

% --- Executes just before load_im is made visible.
function load_im_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to load_im (see VARARGIN)

% Choose default command line output for load_im
handles.output = hObject;

% Following code represents cases for loading images from different use
% cases

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

imshow(matlabim);
axis off
axis image

% Assign clicked coordinates to x and y variables for use in TPS algorithm
[x_clicked, y_clicked] = getpts
assignin('base', 'x_clicked', x_clicked)
assignin('base', 'y_clicked', y_clicked)

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = load_im_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
