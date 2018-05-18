function varargout = fourthguiii(varargin)
% FOURTHGUIII MATLAB code for fourthguiii.fig
%      FOURTHGUIII, by itself, creates a new FOURTHGUIII or raises the existing
%      singleton*.
%
%      H = FOURTHGUIII returns the handle to a new FOURTHGUIII or the handle to
%      the existing singleton*.
%
%      FOURTHGUIII('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FOURTHGUIII.M with the given input arguments.
%
%      FOURTHGUIII('Property','Value',...) creates a new FOURTHGUIII or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fourthguiii_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fourthguiii_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fourthguiii

% Last Modified by GUIDE v2.5 18-May-2018 00:19:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fourthguiii_OpeningFcn, ...
                   'gui_OutputFcn',  @fourthguiii_OutputFcn, ...
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


% --- Executes just before fourthguiii is made visible.
function fourthguiii_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fourthguiii (see VARARGIN)

% Choose default command line output for fourthguiii
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fourthguiii wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fourthguiii_OutputFcn(hObject, eventdata, handles) 
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
fifthguiii();

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%loading variables from workspace
rgb = evalin('base', 'rgb'); 
d = evalin('base', 'd');
gray_image = evalin('base', 'gray_image');
centers = evalin('base', 'centers');
radii = evalin('base', 'radii');

[centers, radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark', ...
    'Sensitivity',0.9);

%putting variable in workspace
assignin('base', 'rgb', rgb);
assignin('base', 'd', d);
assignin('base', 'gray_image', gray_image);
assignin('base', 'centers', centers);
assignin('base', 'radii', radii);

pic5 = imread('555.png');
axes(handles.axes1);
imshow(pic5);
