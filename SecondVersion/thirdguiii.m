function varargout = thirdguiii(varargin)
% THIRDGUIII MATLAB code for thirdguiii.fig
%      THIRDGUIII, by itself, creates a new THIRDGUIII or raises the existing
%      singleton*.
%
%      H = THIRDGUIII returns the handle to a new THIRDGUIII or the handle to
%      the existing singleton*.
%
%      THIRDGUIII('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in THIRDGUIII.M with the given input arguments.
%
%      THIRDGUIII('Property','Value',...) creates a new THIRDGUIII or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before thirdguiii_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to thirdguiii_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help thirdguiii

% Last Modified by GUIDE v2.5 16-May-2018 14:37:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @thirdguiii_OpeningFcn, ...
                   'gui_OutputFcn',  @thirdguiii_OutputFcn, ...
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


% --- Executes just before thirdguiii is made visible.
function thirdguiii_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to thirdguiii (see VARARGIN)

% Choose default command line output for thirdguiii
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes thirdguiii wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = thirdguiii_OutputFcn(hObject, eventdata, handles) 
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
fourthguiii();

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%loading variables from workspace
rgb = evalin('base', 'rgb'); 
d = evalin('base', 'd');

gray_image = rgb2gray(rgb);

axes(handles.axes1);
imshow(gray_image);

%putting variable in workspace
assignin('base', 'rgb', rgb);
assignin('base', 'd', d);
assignin('base', 'gray_image', gray_image);

pic3 = imread('333.png');
axes(handles.axes2);
imshow(pic3);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%loading variables from workspace
rgb = evalin('base', 'rgb'); 
d = evalin('base', 'd');
gray_image = evalin('base', 'gray_image');

[centers, radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark');

%putting variable in workspace
assignin('base', 'rgb', rgb);
assignin('base', 'd', d);
assignin('base', 'gray_image', gray_image);
assignin('base', 'centers', centers);
assignin('base', 'radii', radii);

pic4 = imread('444.png');
axes(handles.axes2);
imshow(pic4);
