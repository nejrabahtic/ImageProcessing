function varargout = firstguiii(varargin)
% FIRSTGUIII MATLAB code for firstguiii.fig
%      FIRSTGUIII, by itself, creates a new FIRSTGUIII or raises the existing
%      singleton*.
%
%      H = FIRSTGUIII returns the handle to a new FIRSTGUIII or the handle to
%      the existing singleton*.
%
%      FIRSTGUIII('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIRSTGUIII.M with the given input arguments.
%
%      FIRSTGUIII('Property','Value',...) creates a new FIRSTGUIII or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before firstguiii_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to firstguiii_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help firstguiii

% Last Modified by GUIDE v2.5 16-May-2018 14:26:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @firstguiii_OpeningFcn, ...
                   'gui_OutputFcn',  @firstguiii_OutputFcn, ...
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


% --- Executes just before firstguiii is made visible.
function firstguiii_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to firstguiii (see VARARGIN)

% Choose default command line output for firstguiii
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes firstguiii wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = firstguiii_OutputFcn(hObject, eventdata, handles) 
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
secondguiii();

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

rgb = imread('coloredChips.png');
axes(handles.axes1);
imshow(rgb);

%putting variable in workspace
assignin('base', 'rgb', rgb);

pic1 = imread('111.png');
axes(handles.axes2);
imshow(pic1);
