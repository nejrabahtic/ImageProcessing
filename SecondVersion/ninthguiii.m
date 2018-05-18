function varargout = ninthguiii(varargin)
% NINTHGUIII MATLAB code for ninthguiii.fig
%      NINTHGUIII, by itself, creates a new NINTHGUIII or raises the existing
%      singleton*.
%
%      H = NINTHGUIII returns the handle to a new NINTHGUIII or the handle to
%      the existing singleton*.
%
%      NINTHGUIII('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NINTHGUIII.M with the given input arguments.
%
%      NINTHGUIII('Property','Value',...) creates a new NINTHGUIII or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ninthguiii_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ninthguiii_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ninthguiii

% Last Modified by GUIDE v2.5 18-May-2018 20:48:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ninthguiii_OpeningFcn, ...
                   'gui_OutputFcn',  @ninthguiii_OutputFcn, ...
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


% --- Executes just before ninthguiii is made visible.
function ninthguiii_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ninthguiii (see VARARGIN)

% Choose default command line output for ninthguiii
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ninthguiii wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ninthguiii_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

closereq;
tenthguiii();

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
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

[centersBright, radiiBright] = imfindcircles(rgb,[20 25],'ObjectPolarity', ...
    'bright','Sensitivity',0.92);

hBright = viscircles(centersBright, radiiBright,'Color','b');

%putting variable in workspace
assignin('base', 'rgb', rgb);
assignin('base', 'd', d);
assignin('base', 'gray_image', gray_image);
assignin('base', 'centers', centers);
assignin('base', 'radii', radii);
assignin('base', 'h', h);
assignin('base', 'ans', ans);
assignin('base', 'centersBright', centersBright);
assignin('base', 'radiiBright', radiiBright);
assignin('base', 'hBright', hBright);

pic = imread('011.png');
axes(handles.axes2);
imshow(pic);
