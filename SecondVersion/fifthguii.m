function varargout = fifthguii(varargin)
% FIFTHGUII MATLAB code for fifthguii.fig
%      FIFTHGUII, by itself, creates a new FIFTHGUII or raises the existing
%      singleton*.
%
%      H = FIFTHGUII returns the handle to a new FIFTHGUII or the handle to
%      the existing singleton*.
%
%      FIFTHGUII('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIFTHGUII.M with the given input arguments.
%
%      FIFTHGUII('Property','Value',...) creates a new FIFTHGUII or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fifthguii_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fifthguii_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fifthguii

% Last Modified by GUIDE v2.5 16-May-2018 13:19:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fifthguii_OpeningFcn, ...
                   'gui_OutputFcn',  @fifthguii_OutputFcn, ...
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


% --- Executes just before fifthguii is made visible.
function fifthguii_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fifthguii (see VARARGIN)

% Choose default command line output for fifthguii
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fifthguii wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fifthguii_OutputFcn(hObject, eventdata, handles) 
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
sixthguii();

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%loading variables from workspace
he = evalin('base', 'he');
cform = evalin('base', 'cform');
lab_he = evalin('base', 'lab_he');
ab = evalin('base', 'ab');
nrows = evalin('base', 'nrows');
ncols = evalin('base', 'ncols');
nColors = evalin('base', 'nColors');
cluster_center = evalin('base', 'cluster_center');
cluster_idx = evalin('base', 'cluster_idx');
pixel_labels = evalin('base', 'pixel_labels');

segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);

for k = 1:nColors
    color = he;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end

axes(handles.axes1);
imshow(segmented_images{1}), title('objects in cluster 1');

%putting variable in workspace
assignin('base', 'he', he);
assignin('base', 'cform', cform);
assignin('base', 'lab_he', lab_he);
assignin('base', 'ab', ab);
assignin('base', 'nrows', nrows);
assignin('base', 'ncols', ncols);
assignin('base', 'nColors', nColors);
assignin('base', 'cluster_idx', cluster_idx);
assignin('base', 'cluster_center', cluster_center);
assignin('base', 'pixel_labels', pixel_labels);
assignin('base', 'color', color);
assignin('base', 'k', k);
assignin('base', 'rgb_label', rgb_label);
assignin('base', 'segmented_images', segmented_images);

pic5 = imread('55.png');
axes(handles.axes2);
imshow(pic5);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%loading variables from workspace
he = evalin('base', 'he');
cform = evalin('base', 'cform');
lab_he = evalin('base', 'lab_he');
ab = evalin('base', 'ab');
nrows = evalin('base', 'nrows');
ncols = evalin('base', 'ncols');
nColors = evalin('base', 'nColors');
cluster_center = evalin('base', 'cluster_center');
cluster_idx = evalin('base', 'cluster_idx');
pixel_labels = evalin('base', 'pixel_labels');

segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);

for k = 1:nColors
    color = he;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end

axes(handles.axes1);
imshow(segmented_images{2}), title('objects in cluster 2');


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%loading variables from workspace
he = evalin('base', 'he');
cform = evalin('base', 'cform');
lab_he = evalin('base', 'lab_he');
ab = evalin('base', 'ab');
nrows = evalin('base', 'nrows');
ncols = evalin('base', 'ncols');
nColors = evalin('base', 'nColors');
cluster_center = evalin('base', 'cluster_center');
cluster_idx = evalin('base', 'cluster_idx');
pixel_labels = evalin('base', 'pixel_labels');

segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);

for k = 1:nColors
    color = he;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end

axes(handles.axes1);
imshow(segmented_images{3}), title('objects in cluster 3');
