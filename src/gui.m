function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 18-Dec-2015 17:52:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in loadbutton.
function loadbutton_Callback(hObject, eventdata, handles)
% hObject    handle to loadbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pathName
global fileName
global testImage

set(handles.text10, 'String', 'Loading!');
set(handles.text10, 'visible', 'on');
[fileName,pathName] = uigetfile('*.bmp','Select an eye image', '../databases/');
str = [pathName, fileName];
if  ~isequal(str,zeros(1,2)) && exist(str, 'file')
    % prepare testimage
    testImage = imread(str);
    axes(handles.originFrame);
    imshow(testImage); 
end
set(handles.text10, 'visible', 'off');



% --- Executes on button press in segmentbutton.
function segmentbutton_Callback(hObject, eventdata, handles)
% hObject    handle to segmentbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pathName
global fileName
global testImage

set(handles.text10, 'String', 'Computing!');
set(handles.text10, 'visible', 'on');

% wait for the hint massage
pause(1)
disp('Get started!');
disp('There are 10 steps to go through!');

% if image is loaded
isEmpytAxes = isempty(get(handles.originFrame, 'Children'));
if ~isEmpytAxes
    %run example code
    example(pathName, fileName, testImage);

    % plot answer comparison result
    global result;
    axes(handles.originFrame);
    imshow(result); 

    % plot scelra
    global sclera;
    axes(handles.scleraFrame);
    imshow(sclera);

    % plot iris
    global  iris;
    axes(handles.irisFrame);
    imshow(iris);

    %print accuracy
    global accu;
    a = num2str(accu);
    str = ['Accuracy Rate: ', a, '%'];
    set(handles.text6, 'String', str);

 else
     disp('You have not loaded an eye image yet!');
 end
 
 set(handles.text10, 'String', 'Done!');
