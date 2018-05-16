function varargout = firstguii(varargin)
% FIRSTGUII MATLAB code for firstguii.fig
%      FIRSTGUII, by itself, creates a new FIRSTGUII or raises the existing
%      singleton*.
%
%      H = FIRSTGUII returns the handle to a new FIRSTGUII or the handle to
%      the existing singleton*.
%
%      FIRSTGUII('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIRSTGUII.M with the given input arguments.
%
%      FIRSTGUII('Property','Value',...) creates a new FIRSTGUII or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before firstguii_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to firstguii_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help firstguii

% Last Modified by GUIDE v2.5 16-May-2018 13:24:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @firstguii_OpeningFcn, ...
                   'gui_OutputFcn',  @firstguii_OutputFcn, ...
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


% --- Executes just before firstguii is made visible.
function firstguii_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to firstguii (see VARARGIN)

% Choose default command line output for firstguii
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes firstguii wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = firstguii_OutputFcn(hObject, eventdata, handles) 
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
secondguii();

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

he = imread('hestain.png');
axes(handles.axes1);
imshow(he), title('H&E image');
text(size(he,2),size(he,1)+15,...
     'Image courtesy of Alan Partin', ...
     'FontSize',6,'HorizontalAlignment','right');
 
%putting variable in workspace
assignin('base', 'he', he);

pic1 = imread('11.png');
axes(handles.axes2);
imshow(pic1);
