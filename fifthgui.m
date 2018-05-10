function varargout = fifthgui(varargin)
% FIFTHGUI MATLAB code for fifthgui.fig
%      FIFTHGUI, by itself, creates a new FIFTHGUI or raises the existing
%      singleton*.
%
%      H = FIFTHGUI returns the handle to a new FIFTHGUI or the handle to
%      the existing singleton*.
%
%      FIFTHGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIFTHGUI.M with the given input arguments.
%
%      FIFTHGUI('Property','Value',...) creates a new FIFTHGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fifthgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fifthgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fifthgui

% Last Modified by GUIDE v2.5 10-May-2018 21:51:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fifthgui_OpeningFcn, ...
                   'gui_OutputFcn',  @fifthgui_OutputFcn, ...
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


% --- Executes just before fifthgui is made visible.
function fifthgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fifthgui (see VARARGIN)

% Choose default command line output for fifthgui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fifthgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fifthgui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;

imageProcessingToolbox();


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
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
count = evalin('base', 'count');
segmented_images = evalin('base', 'segmented_images');
color = evalin('base', 'color');
rgb_label = evalin('base', 'rgb_label');
label = evalin('base', 'label');

load regioncoordinates;

purple = [119/255 73/255 152/255];
plot_labels = {'k', 'r', 'g', purple, 'm', 'y'};

axes(handles.axes2);
for count = 1:nColors
  plot(a(label==count-1),b(label==count-1),'.','MarkerEdgeColor', ...
       plot_labels{count}, 'MarkerFaceColor', plot_labels{count});
  hold on;
end
  
title('Scatterplot of the segmented pixels');
xlabel('''a*'' values');
ylabel('''b*'' values');

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
assignin('base', 'label', label);
assignin('base', 'rgb_label', rgb_label);
assignin('base', 'segmented_images', segmented_images);
assignin('base', 'color', color);
assignin('base', 'purple', purple);
assignin('base', 'plot_labels', plot_labels);

pic6 = imread('6.png');
axes(handles.axes3);
imshow(pic6);
