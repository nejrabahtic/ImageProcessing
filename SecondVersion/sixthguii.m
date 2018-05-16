function varargout = sixthguii(varargin)
% SIXTHGUII MATLAB code for sixthguii.fig
%      SIXTHGUII, by itself, creates a new SIXTHGUII or raises the existing
%      singleton*.
%
%      H = SIXTHGUII returns the handle to a new SIXTHGUII or the handle to
%      the existing singleton*.
%
%      SIXTHGUII('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIXTHGUII.M with the given input arguments.
%
%      SIXTHGUII('Property','Value',...) creates a new SIXTHGUII or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sixthguii_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sixthguii_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sixthguii

% Last Modified by GUIDE v2.5 16-May-2018 13:27:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sixthguii_OpeningFcn, ...
                   'gui_OutputFcn',  @sixthguii_OutputFcn, ...
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


% --- Executes just before sixthguii is made visible.
function sixthguii_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sixthguii (see VARARGIN)

% Choose default command line output for sixthguii
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sixthguii wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sixthguii_OutputFcn(hObject, eventdata, handles) 
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
imageProcessingToolbox();

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
color = evalin('base', 'color');
k = evalin('base', 'k');
rgb_label = evalin('base', 'rgb_label');
segmented_images = evalin('base', 'segmented_images');

mean_cluster_value = mean(cluster_center,2);
[tmp, idx] = sort(mean_cluster_value);
blue_cluster_num = idx(1);

L = lab_he(:,:,1);
blue_idx = find(pixel_labels == blue_cluster_num);
L_blue = L(blue_idx);
is_light_blue = imbinarize(L_blue);

nuclei_labels = repmat(uint8(0),[nrows ncols]);
nuclei_labels(blue_idx(is_light_blue==false)) = 1;
nuclei_labels = repmat(nuclei_labels,[1 1 3]);
blue_nuclei = he;
blue_nuclei(nuclei_labels ~= 1) = 0;
axes(handles.axes1);
imshow(blue_nuclei), title('blue nuclei');

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
assignin('base', 'blue_cluster_num', blue_cluster_num);
assignin('base', 'mean_cluster_value', mean_cluster_value);
assignin('base', 'tmp', tmp);
assignin('base', 'nuclei_labels', nuclei_labels);
assignin('base', 'L', L);
assignin('base', 'L_blue', L_blue);
assignin('base', 'blue_idx', blue_idx);
assignin('base', 'blue_nuclei', blue_nuclei);
assignin('base', 'idx', idx);
assignin('base', 'is_light_blue', is_light_blue);

pic6 = imread('66.png');
axes(handles.axes2);
imshow(pic6);
