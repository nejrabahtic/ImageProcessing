function varargout = fourthguii(varargin)
% FOURTHGUII MATLAB code for fourthguii.fig
%      FOURTHGUII, by itself, creates a new FOURTHGUII or raises the existing
%      singleton*.
%
%      H = FOURTHGUII returns the handle to a new FOURTHGUII or the handle to
%      the existing singleton*.
%
%      FOURTHGUII('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FOURTHGUII.M with the given input arguments.
%
%      FOURTHGUII('Property','Value',...) creates a new FOURTHGUII or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fourthguii_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fourthguii_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fourthguii

% Last Modified by GUIDE v2.5 16-May-2018 13:28:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fourthguii_OpeningFcn, ...
                   'gui_OutputFcn',  @fourthguii_OutputFcn, ...
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


% --- Executes just before fourthguii is made visible.
function fourthguii_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fourthguii (see VARARGIN)

% Choose default command line output for fourthguii
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fourthguii wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fourthguii_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

closereq;
fifthguii();

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

pixel_labels = reshape(cluster_idx,nrows,ncols);
axes(handles.axes1);
imshow(pixel_labels,[]), title('image labeled by cluster index');

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

pic4 = imread('44.png');
axes(handles.axes2);
imshow(pic4);
