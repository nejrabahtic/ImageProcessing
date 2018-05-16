function varargout = thirdguii(varargin)
% THIRDGUII MATLAB code for thirdguii.fig
%      THIRDGUII, by itself, creates a new THIRDGUII or raises the existing
%      singleton*.
%
%      H = THIRDGUII returns the handle to a new THIRDGUII or the handle to
%      the existing singleton*.
%
%      THIRDGUII('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in THIRDGUII.M with the given input arguments.
%
%      THIRDGUII('Property','Value',...) creates a new THIRDGUII or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before thirdguii_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to thirdguii_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help thirdguii

% Last Modified by GUIDE v2.5 16-May-2018 13:03:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @thirdguii_OpeningFcn, ...
                   'gui_OutputFcn',  @thirdguii_OutputFcn, ...
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


% --- Executes just before thirdguii is made visible.
function thirdguii_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to thirdguii (see VARARGIN)

% Choose default command line output for thirdguii
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes thirdguii wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = thirdguii_OutputFcn(hObject, eventdata, handles) 
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
fourthguii();

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%loading variables from workspace
he = evalin('base', 'he');
cform = evalin('base', 'cform');
lab_he = evalin('base', 'lab_he');

ab = double(lab_he(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);

nColors = 3;
% repeat the clustering 3 times to avoid local minima
[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                      'Replicates',3);

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

pic3 = imread('33.png');
axes(handles.axes1);
imshow(pic3);
