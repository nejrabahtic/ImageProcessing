function varargout = secondgui(varargin)
% SECONDGUI MATLAB code for secondgui.fig
%      SECONDGUI, by itself, creates a new SECONDGUI or raises the existing
%      singleton*.
%
%      H = SECONDGUI returns the handle to a new SECONDGUI or the handle to
%      the existing singleton*.
%
%      SECONDGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SECONDGUI.M with the given input arguments.
%
%      SECONDGUI('Property','Value',...) creates a new SECONDGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before secondgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to secondgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help secondgui

% Last Modified by GUIDE v2.5 10-May-2018 19:47:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @secondgui_OpeningFcn, ...
                   'gui_OutputFcn',  @secondgui_OutputFcn, ...
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


% --- Executes just before secondgui is made visible.
function secondgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to secondgui (see VARARGIN)

% Choose default command line output for secondgui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes secondgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = secondgui_OutputFcn(hObject, eventdata, handles) 
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
thirdgui();

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%loading variables from workspace
fabric = evalin('base', 'fabric'); 

load regioncoordinates;

nColors = 6;
sample_regions = false([size(fabric,1) size(fabric,2) nColors]);

for count = 1:nColors
  sample_regions(:,:,count) = roipoly(fabric,region_coordinates(:,1,count),...
                                      region_coordinates(:,2,count));
end

axes(handles.axes1);
imshow(sample_regions(:,:,2)),title('sample region for red');

%putting variables in workspace
assignin('base', 'fabric', fabric);
assignin('base', 'nColors', nColors);
assignin('base', 'count', count);
assignin('base', 'sample_regions', sample_regions);
assignin('base', 'region_coordinates', region_coordinates);

pic2 = imread('2.png');
axes(handles.axes2);
imshow(pic2);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%loading variables from workspace
fabric = evalin('base', 'fabric'); 
nColors = evalin('base', 'nColors');

lab_fabric = rgb2lab(fabric);

sample_regions = false([size(fabric,1) size(fabric,2) nColors]);
load regioncoordinates;

for count = 1:nColors
  sample_regions(:,:,count) = roipoly(fabric,region_coordinates(:,1,count),...
                                      region_coordinates(:,2,count));
end

a = lab_fabric(:,:,2);
b = lab_fabric(:,:,3);
color_markers = zeros([nColors, 2]);

for count = 1:nColors
  color_markers(count,1) = mean2(a(sample_regions(:,:,count)));
  color_markers(count,2) = mean2(b(sample_regions(:,:,count)));
end

num1 = num2str(color_markers(2,1));
num2 = num2str(color_markers(2,2));
string = strcat(num1, {', '}, num2);
set(handles.text5, 'String', string);

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

pic3 = imread('3.png');
axes(handles.axes2);
imshow(pic3);
