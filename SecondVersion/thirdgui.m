function varargout = thirdgui(varargin)
% THIRDGUI MATLAB code for thirdgui.fig
%      THIRDGUI, by itself, creates a new THIRDGUI or raises the existing
%      singleton*.
%
%      H = THIRDGUI returns the handle to a new THIRDGUI or the handle to
%      the existing singleton*.
%
%      THIRDGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in THIRDGUI.M with the given input arguments.
%
%      THIRDGUI('Property','Value',...) creates a new THIRDGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before thirdgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to thirdgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help thirdgui

% Last Modified by GUIDE v2.5 10-May-2018 20:17:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @thirdgui_OpeningFcn, ...
                   'gui_OutputFcn',  @thirdgui_OutputFcn, ...
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


% --- Executes just before thirdgui is made visible.
function thirdgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to thirdgui (see VARARGIN)

% Choose default command line output for thirdgui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes thirdgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = thirdgui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

closereq;
fourthgui();

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%loading variables from workspace
fabric = evalin('base', 'fabric');
nColors = evalin('base', 'nColors');
lab_fabric = evalin('base', 'lab_fabric');
sample_regions = evalin('base', 'sample_regions');
a = evalin('base', 'a');
b = evalin('base', 'b');
color_markers = evalin('base', 'color_markers');
color_markers = evalin('base', 'color_markers');
count = evalin('base', 'count');

load regioncoordinates;

color_labels = 0:nColors-1;

a = double(a);
b = double(b);
distance = zeros([size(a), nColors]);

for count = 1:nColors
  distance(:,:,count) = ( (a - color_markers(count,1)).^2 + ...
                      (b - color_markers(count,2)).^2 ).^0.5;
end

[~, label] = min(distance,[],3);
label = color_labels(label);

%putting variables in workspace
assignin('base', 'fabric', fabric);
assignin('base', 'lab_fabric', lab_fabric);
assignin('base', 'nColors', nColors);
assignin('base', 'count', count);
assignin('base', 'sample_regions', sample_regions);
assignin('base', 'region_coordinates', region_coordinates);
assignin('base', 'a', a);
assignin('base', 'b', b);
assignin('base', 'color_markers', color_markers);
assignin('base', 'color_labels', color_labels);
assignin('base', 'label', label);

pic4 = imread('4.png');
axes(handles.axes2);
imshow(pic4);
