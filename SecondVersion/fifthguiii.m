function varargout = fifthguiii(varargin)
% FIFTHGUIII MATLAB code for fifthguiii.fig
%      FIFTHGUIII, by itself, creates a new FIFTHGUIII or raises the existing
%      singleton*.
%
%      H = FIFTHGUIII returns the handle to a new FIFTHGUIII or the handle to
%      the existing singleton*.
%
%      FIFTHGUIII('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIFTHGUIII.M with the given input arguments.
%
%      FIFTHGUIII('Property','Value',...) creates a new FIFTHGUIII or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fifthguiii_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fifthguiii_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fifthguiii

% Last Modified by GUIDE v2.5 18-May-2018 01:54:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fifthguiii_OpeningFcn, ...
                   'gui_OutputFcn',  @fifthguiii_OutputFcn, ...
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


% --- Executes just before fifthguiii is made visible.
function fifthguiii_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fifthguiii (see VARARGIN)

% Choose default command line output for fifthguiii
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fifthguiii wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fifthguiii_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

closereq;
sixthguiii();

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%loading variables from workspace
rgb = evalin('base', 'rgb'); 
d = evalin('base', 'd');
gray_image = evalin('base', 'gray_image');
centers = evalin('base', 'centers');
radii = evalin('base', 'radii');

axes(handles.axes1);
imshow(rgb);

h = viscircles(centers,radii);

%putting variable in workspace
assignin('base', 'rgb', rgb);
assignin('base', 'd', d);
assignin('base', 'gray_image', gray_image);
assignin('base', 'centers', centers);
assignin('base', 'radii', radii);
assignin('base', 'h', h);

pic6 = imread('666.png');
axes(handles.axes2);
imshow(pic6);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
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

axes(handles.axes1);
imshow(rgb);

h = viscircles(centers,radii);

[centers, radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark', ...
    'Sensitivity',0.92);

length(centers);
ans = 16;

%putting variable in workspace
assignin('base', 'rgb', rgb);
assignin('base', 'd', d);
assignin('base', 'gray_image', gray_image);
assignin('base', 'centers', centers);
assignin('base', 'radii', radii);
assignin('base', 'h', h);
assignin('base', 'ans', ans);

pic7 = imread('777.png');
axes(handles.axes2);
imshow(pic7);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%loading variables from workspace
rgb = evalin('base', 'rgb'); 
d = evalin('base', 'd');
gray_image = evalin('base', 'gray_image');
centers = evalin('base', 'centers');
radii = evalin('base', 'radii');
h = evalin('base', 'h');
ans = evalin('base', 'ans');

axes(handles.axes1);
imshow(rgb);    

delete(h);  % Delete previously drawn circles
h = viscircles(centers,radii);

%putting variable in workspace
assignin('base', 'rgb', rgb);
assignin('base', 'd', d);
assignin('base', 'gray_image', gray_image);
assignin('base', 'centers', centers);
assignin('base', 'radii', radii);
assignin('base', 'h', h);
assignin('base', 'ans', ans);

pic7 = imread('777.png');
axes(handles.axes2);
imshow(pic7);
