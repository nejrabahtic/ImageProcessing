function varargout = fourthgui(varargin)
% FOURTHGUI MATLAB code for fourthgui.fig
%      FOURTHGUI, by itself, creates a new FOURTHGUI or raises the existing
%      singleton*.
%
%      H = FOURTHGUI returns the handle to a new FOURTHGUI or the handle to
%      the existing singleton*.
%
%      FOURTHGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FOURTHGUI.M with the given input arguments.
%
%      FOURTHGUI('Property','Value',...) creates a new FOURTHGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fourthgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fourthgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fourthgui

% Last Modified by GUIDE v2.5 10-May-2018 20:41:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fourthgui_OpeningFcn, ...
                   'gui_OutputFcn',  @fourthgui_OutputFcn, ...
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


% --- Executes just before fourthgui is made visible.
function fourthgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fourthgui (see VARARGIN)

% Choose default command line output for fourthgui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fourthgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fourthgui_OutputFcn(hObject, eventdata, handles) 
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
fifthgui();


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

rgb_label = repmat(label,[1 1 3]);
segmented_images = zeros([size(fabric), nColors],'uint8');

for count = 1:nColors
  color = fabric;
  color(rgb_label ~= color_labels(count)) = 0;
  segmented_images(:,:,:,count) = color;
end 

axes(handles.axes1);
imshow(segmented_images(:,:,:,2)), title('red objects');

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
assignin('base', 'rgb_label', rgb_label);
assignin('base', 'segmented_images', segmented_images);
assignin('base', 'color', color);

pic5 = imread('5.png');
axes(handles.axes2);
imshow(pic5);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
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

rgb_label = repmat(label,[1 1 3]);
segmented_images = zeros([size(fabric), nColors],'uint8');

for count = 1:nColors
  color = fabric;
  color(rgb_label ~= color_labels(count)) = 0;
  segmented_images(:,:,:,count) = color;
end 

axes(handles.axes1);
imshow(segmented_images(:,:,:,3)), title('green objects');

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
assignin('base', 'rgb_label', rgb_label);
assignin('base', 'segmented_images', segmented_images);
assignin('base', 'color', color);


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
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

rgb_label = repmat(label,[1 1 3]);
segmented_images = zeros([size(fabric), nColors],'uint8');

for count = 1:nColors
  color = fabric;
  color(rgb_label ~= color_labels(count)) = 0;
  segmented_images(:,:,:,count) = color;
end 

axes(handles.axes1);
imshow(segmented_images(:,:,:,4)), title('purple objects');

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
assignin('base', 'rgb_label', rgb_label);
assignin('base', 'segmented_images', segmented_images);
assignin('base', 'color', color);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
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

rgb_label = repmat(label,[1 1 3]);
segmented_images = zeros([size(fabric), nColors],'uint8');

for count = 1:nColors
  color = fabric;
  color(rgb_label ~= color_labels(count)) = 0;
  segmented_images(:,:,:,count) = color;
end 

axes(handles.axes1);
imshow(segmented_images(:,:,:,5)), title('magenta objects');

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
assignin('base', 'rgb_label', rgb_label);
assignin('base', 'segmented_images', segmented_images);
assignin('base', 'color', color);
