function varargout = secondguii(varargin)
% SECONDGUII MATLAB code for secondguii.fig
%      SECONDGUII, by itself, creates a new SECONDGUII or raises the existing
%      singleton*.
%
%      H = SECONDGUII returns the handle to a new SECONDGUII or the handle to
%      the existing singleton*.
%
%      SECONDGUII('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SECONDGUII.M with the given input arguments.
%
%      SECONDGUII('Property','Value',...) creates a new SECONDGUII or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before secondguii_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to secondguii_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help secondguii

% Last Modified by GUIDE v2.5 16-May-2018 12:55:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @secondguii_OpeningFcn, ...
                   'gui_OutputFcn',  @secondguii_OutputFcn, ...
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


% --- Executes just before secondguii is made visible.
function secondguii_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to secondguii (see VARARGIN)

% Choose default command line output for secondguii
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes secondguii wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = secondguii_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

closereq;
thirdguii();

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%loading variables from workspace
he = evalin('base', 'he');
 
cform = makecform('srgb2lab');
lab_he = applycform(he,cform);

%putting variable in workspace
assignin('base', 'he', he);
assignin('base', 'cform', cform);
assignin('base', 'lab_he', lab_he);

pic2 = imread('22.png');
axes(handles.axes2);
imshow(pic2);
