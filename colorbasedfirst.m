function varargout = colorbasedfirst(varargin)
% COLORBASEDFIRST MATLAB code for colorbasedfirst.fig
%      COLORBASEDFIRST, by itself, creates a new COLORBASEDFIRST or raises the existing
%      singleton*.
%
%      H = COLORBASEDFIRST returns the handle to a new COLORBASEDFIRST or the handle to
%      the existing singleton*.
%
%      COLORBASEDFIRST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COLORBASEDFIRST.M w   ith the given input arguments.
%
%      COLORBASEDFIRST('Property','Value',...) creates a new COLORBASEDFIRST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before colorbasedfirst_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to colorbasedfirst_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help colorbasedfirst

% Last Modified by GUIDE v2.5 20-Apr-2018 14:09:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @colorbasedfirst_OpeningFcn, ...
                   'gui_OutputFcn',  @colorbasedfirst_OutputFcn, ...
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


% --- Executes just before colorbasedfirst is made visible.
function colorbasedfirst_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to colorbasedfirst (see VARARGIN)

% Choose default command line output for colorbasedfirst
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes colorbasedfirst wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = colorbasedfirst_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function ipt_Callback(hObject, eventdata, handles)
% hObject    handle to ipt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fabric = imread('fabric.png');
axes(handles.axes1);
imshow(fabric), title('fabric');

%putting variable in workspace
assignin('base', 'fabric', fabric);
 

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
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

axes(handles.axes2);
imshow(sample_regions(:,:,2)),title('sample region for red');

%putting variables in workspace
assignin('base', 'fabric', fabric);
assignin('base', 'nColors', nColors);
assignin('base', 'count', count);
assignin('base', 'sample_regions', sample_regions);
assignin('base', 'region_coordinates', region_coordinates);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
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
set(handles.text6, 'String', string);

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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
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

axes(handles.axes3);
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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
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

axes(handles.axes4);
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


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
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

axes(handles.axes3);
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

axes(handles.axes3);
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

axes(handles.axes3);
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

axes(handles.axes3);
imshow(segmented_images(:,:,:,5)), title('magenta objects');

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

axes(handles.axes3);
imshow(segmented_images(:,:,:,6)), title('yellow objects');

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


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

closereq;

imageProcessingToolbox;
