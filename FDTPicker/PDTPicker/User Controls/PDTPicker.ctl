VERSION 5.00
Begin VB.UserControl FDTPicker 
   Appearance      =   0  'Flat
   BackColor       =   &H00FFFFFF&
   ClientHeight    =   360
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3150
   DataBindingBehavior=   1  'vbSimpleBound
   EditAtDesignTime=   -1  'True
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ScaleHeight     =   360
   ScaleWidth      =   3150
   ToolboxBitmap   =   "PDTPicker.ctx":0000
   Begin VB.PictureBox ImgUp 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   855
      Picture         =   "PDTPicker.ctx":0312
      ScaleHeight     =   255
      ScaleWidth      =   255
      TabIndex        =   0
      Top             =   30
      Width           =   255
   End
   Begin PDTPicker.DateBox TxtSpin 
      Height          =   240
      Left            =   0
      TabIndex        =   1
      Top             =   45
      Width           =   825
      _ExtentX        =   1455
      _ExtentY        =   476
      BorderStyle     =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Text            =   "9999/12/30"
   End
   Begin VB.Image Img 
      Height          =   255
      Index           =   3
      Left            =   690
      Picture         =   "PDTPicker.ctx":06C8
      Top             =   2040
      Width           =   255
   End
   Begin VB.Image Img 
      Height          =   255
      Index           =   2
      Left            =   720
      Picture         =   "PDTPicker.ctx":0A7E
      Top             =   1710
      Width           =   255
   End
   Begin VB.Image Img 
      Height          =   255
      Index           =   1
      Left            =   750
      Picture         =   "PDTPicker.ctx":0E34
      Top             =   1410
      Width           =   255
   End
   Begin VB.Image Img 
      Height          =   255
      Index           =   0
      Left            =   750
      Picture         =   "PDTPicker.ctx":11EA
      Top             =   1140
      Width           =   255
   End
   Begin VB.Shape ShapeBorder 
      BorderColor     =   &H00B99D7F&
      Height          =   315
      Left            =   0
      Top             =   0
      Width           =   1125
   End
End
Attribute VB_Name = "FDTPicker"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
'******************************************************************************
'* Copyright (C) 2002-2005 Mohsen Ali Momeni - All Rights Reserved.
'*
'* This program is free software; you can redistribute it and/or modify
'* it under the terms of the GNU General Public License as published by
'* the Free Software Foundation; either version 2 of the License, or
'* (at your option) any later version.
'*
'* This program is distributed in the hope that it will be useful,
'* but WITHOUT ANY WARRANTY; without even the implied warranty of
'* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
'* GNU General Public License for more details.
'*
'* You should have received a copy of the GNU General Public License
'* along with this program; if not, write to the Free Software
'* Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
'*
'* To get more information, you can mail me at: m.alimomeni@gmail.com
'* or goto my webpage at: www.momeni.us.tc
'*
'* FDTPicker.ctl : The main Control form.
'* This file is part of the XPersian - XP Persian interface.
'******************************************************************************

Option Explicit
Private Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Private Declare Function GetClientRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long
Private Declare Function GetCurrentPositionEx Lib "gdi32" (ByVal hdc As Long, lpPoint As POINTAPI) As Long
Private Declare Function GetWindowRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long

'Private Declare Function EnableWindow Lib "user32" (ByVal hwnd As Long, ByVal fEnable As Long) As Long
'Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
'Private Declare Function GetAncestor Lib "user32.dll" (ByVal hwnd As Long, ByVal gaFlags As Long) As Long
'Private Declare Function GetParent Lib "user32" (ByVal hwnd As Long) As Long
'Private Declare Function GetClassName Lib "user32" Alias "GetClassNameA" (ByVal hwnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long) As Long

Private Type RECT
        Left As Long
        Top As Long
        Right As Long
        Bottom As Long
End Type
Private Type POINTAPI
        x As Long
        y As Long
End Type

'TODO: implementing different formats for Date display.
'Public Enum FDtFormat
'    [0 - ShortFormat] = 0
'    [1 - LongFormat] = 1
'    [2 - WeakDayShort] = 2
'End Enum

'Default Property Values:
Const m_def_BorderColor = &H80000003
Const m_def_BackColor = &HFFFFFF
Const m_def_YearRange = 10
Const m_def_FormBackColor = vbWhite
Dim m_ToolTipText As String
Dim m_Font As Font
Dim m_BorderColor As OLE_COLOR
Dim m_BackColor As OLE_COLOR

Dim m_YearRange As Integer
Dim m_FormBackColor As OLE_COLOR
'Event Declarations:
Event DropDown() 'MappingInfo=ImgUp,ImgUp,-1,Click
Event Change() 'MappingInfo=TxtSpin,TxtSpin,-1,Change
Event DblClick() 'MappingInfo=TxtSpin,TxtSpin,-1,DblClick
Attribute DblClick.VB_UserMemId = -601
Event MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single) 'MappingInfo=TxtSpin,TxtSpin,-1,MouseMove
Attribute MouseMove.VB_UserMemId = -606
Event MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single) 'MappingInfo=TxtSpin,TxtSpin,-1,MouseDown
Attribute MouseDown.VB_UserMemId = -605
Event MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single) 'MappingInfo=TxtSpin,TxtSpin,-1,MouseUp
Attribute MouseUp.VB_UserMemId = -607
'Dim ProID As String, Anscalc As String, InReg As String, blnTested As Boolean
Dim CD As New ClsDate
Dim Checked As Boolean

Private Sub UserControl_Initialize()
    Non_Modal = App.NonModalAllowed
    Set CD = New ClsDate
    Ftoday = CD.Mi2Sh(Date)
End Sub
Private Sub UserControl_InitProperties()
    About
    SaveSetting "FDTPicker", "Config", "FR", True
    
    BackColor = vbWhite
    Set m_Font = Ambient.Font
    If Me.Font.Size < 10 Then Me.Font.Size = 10
    Text = Ftoday
    
    m_BackColor = m_def_BackColor
    YearRange = m_def_YearRange
    m_FormBackColor = m_def_FormBackColor
    m_BorderColor = m_def_BorderColor
End Sub
Private Sub UserControl_Show()
If Ambient.UserMode = False Then
    Checked = GetSetting("FDTPicker", "Config", "FR", False)
    If (Not Checked) Then
        About
        SaveSetting "FDTPicker", "Config", "FR", True
    End If
End If
'Dim hCwnd As Long
'hCwnd = UserControl.ContainerHwnd
'
'Dim Ret As String, RetVal As Long, lpClassName As String
'lpClassName = Space(256)
'RetVal = GetClassName(hCwnd, lpClassName, 256)
'If LCase$(Left$(lpClassName, RetVal)) Like "*internet explorer*" Then
'    MsgBox "sorry"
'Else
'    'MsgBox "its ok"
'    MsgBox LCase$(Left$(lpClassName, RetVal))
'End If

'hCwnd = GetAncestor(UserControl.ContainerHwnd, 2)
'hCwnd = GetParent(UserControl.ContainerHwnd)
'Dim MyStr As String
'MyStr = String(100, Chr$(0))
'GetWindowText hCwnd, MyStr, 300
'MsgBox MyStr
'    Dim a As Long
'    a = ProcessIDhwnd(UserControl.ContainerHwnd)
'    MsgBox GetExename(a)
End Sub
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    If Ambient.UserMode = False Then
'        If Checked = False Then CheckReg
        Checked = GetSetting("FDTPicker", "Config", "FR", False)
        If (Not Checked) Then
            About
            SaveSetting "FDTPicker", "Config", "FR", True
        End If
    End If
    UserControl.Enabled = PropBag.ReadProperty("Enabled", True)
    TxtSpin.Locked = PropBag.ReadProperty("Locked", False)
    TxtSpin.Text = PropBag.ReadProperty("Text", Ftoday)
    Set TxtSpin.Font = PropBag.ReadProperty("Font", Ambient.Font)
    RePos
    m_BackColor = PropBag.ReadProperty("BackColor", m_def_BackColor)
    TxtSpin.BackColor = m_BackColor
    UserControl.BackColor = m_BackColor
    TxtSpin.RightToLeft = PropBag.ReadProperty("RightToLeft", False)
    'TxtSpin.Alignment = PropBag.ReadProperty("Alignment", 0)
    m_YearRange = PropBag.ReadProperty("YearRange", m_def_YearRange)
    YR = m_YearRange
    m_FormBackColor = PropBag.ReadProperty("FormBackColor", m_def_FormBackColor)
    FormBKC = m_FormBackColor
    m_BorderColor = PropBag.ReadProperty("BorderColor", m_def_BorderColor)
    TxtSpin.ForeColor = PropBag.ReadProperty("ForeColor", &H80000008)
    m_SFM = PropBag.ReadProperty("ShowFarsiMonth", True)
    m_FontB = PropBag.ReadProperty("CalFontBold", False)
End Sub
Private Sub UserControl_Terminate()
Set CD = Nothing
End Sub

'Write property values to storage
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    With PropBag
        Call .WriteProperty("Enabled", UserControl.Enabled, True)
        Call .WriteProperty("Locked", TxtSpin.Locked, False)
        Call .WriteProperty("Text", TxtSpin.Text, Ftoday)
        Call .WriteProperty("Font", TxtSpin.Font, Ambient.Font)
        Call .WriteProperty("YearRange", YR, 10)
        'Call .WriteProperty("DefaultDate", New_Date, "DefaultDate")
        'Call .WriteProperty("Value", m_Value, m_def_Value)
        'Call .WriteProperty("FormatDate", m_FormatDate, m_def_FormatDate)
    End With
    Call PropBag.WriteProperty("BackColor", m_BackColor, m_def_BackColor)
    Call PropBag.WriteProperty("RightToLeft", TxtSpin.RightToLeft, False)
    'Call PropBag.WriteProperty("Alignment", TxtSpin.Alignment, 0)
    Call PropBag.WriteProperty("YearRange", m_YearRange, m_def_YearRange)
    Call PropBag.WriteProperty("FormBackColor", m_FormBackColor, m_def_FormBackColor)
    Call PropBag.WriteProperty("BorderColor", m_BorderColor, m_def_BorderColor)
    Call PropBag.WriteProperty("ForeColor", TxtSpin.ForeColor, &H80000008)
    Call PropBag.WriteProperty("ShowFarsiMonth", m_SFM, True)
    Call PropBag.WriteProperty("CalFontBold", m_FontB, False)
End Sub
Public Sub About()
Attribute About.VB_UserMemId = -552
    MsgBox vbTab & "~~~~~~~~~~~~~~~~~~~~~~ FDTPicker v1.5 ~~~~~~~~~~~~~~~~~~~~~~" & vbCrLf & _
        vbTab & "Written by Mohsen A. Momeni" & vbTab & vbTab & vbTab & "Website : www.momeni.us.tc" & vbCrLf & vbCrLf & _
        "Persian clone for Microsoft DTPicker ActiveX control, for simple implementation of Shamsi Date in your programs"
End Sub
Private Sub ImgUp_Click()
RaiseEvent DropDown
On Error GoTo ErrXYZ
    Dim MyApi As POINTAPI
    Dim MyRect As RECT
    Dim MyLeft As Long, MyTop As Long

    GetCursorPos MyApi
    GetWindowRect TxtSpin.hwnd, MyRect
    
    MyTop = (MyRect.Top * 15) + TxtSpin.Height + 45
    If Screen.Height - MyTop < 3000 Then
        MyTop = MyTop - 2835 - 30 - Height
    End If
    
    MyLeft = (MyRect.Left * 15) - TxtSpin.Left
    If Screen.Width - MyLeft < 2900 Then
        MyLeft = (MyRect.Left * 15) + TxtSpin.Width + 45 - 2760
    End If
    
   'ResultDate = Value
    DoEvents
    InitDate = Me.Text
    
    'CntHwnd = UserControl.ContainerHwnd

    With FrmCalender
        DoEvents
        .Left = MyLeft
        .Top = MyTop
        Chosen = False
        If Non_Modal Then
            .Show
            Else
            .Show 1
        End If
    End With
    
    Do Until (Chosen) 'wait for user to choose a date.
        DoEvents
    Loop
    
    ResetPic
    If Not (ResultDate = vbNullString) Then Text = ResultDate
ErrXYZ:
End Sub
Public Property Get hwnd() As Long
Attribute hwnd.VB_UserMemId = -515
    hwnd = UserControl.hwnd
End Property
Public Property Get Locked() As Boolean
    Locked = TxtSpin.Locked
End Property
Public Property Let Locked(ByVal New_Locked As Boolean)
    TxtSpin.Locked() = New_Locked
    PropertyChanged "Locked"
End Property
Public Property Get Text() As String
Attribute Text.VB_ProcData.VB_Invoke_Property = ";Data"
Attribute Text.VB_UserMemId = -517
Attribute Text.VB_MemberFlags = "1224"
    Text = TxtSpin.Text
End Property

Public Property Let Text(ByVal New_Text As String)
    TxtSpin.Text() = New_Text
    PropertyChanged "Text"
End Property
Public Property Get Font() As Font
Attribute Font.VB_UserMemId = -512
    Set Font = TxtSpin.Font
End Property
Public Property Set Font(ByVal New_Font As Font)
    If New_Font.Size > 10 Then New_Font.Size = 10
    Set TxtSpin.Font = New_Font
    PropertyChanged "Font"
    RePos
End Property
Private Sub UserControl_Resize()
'If Ambient.UserMode = False Then
'    Checked = True
'    CheckReg
'End If
    RePos
End Sub
Private Sub TxtSpin_Change()
    RaiseEvent Change
End Sub
Public Property Get Enabled() As Boolean
Attribute Enabled.VB_UserMemId = -514
    Enabled = UserControl.Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
    UserControl.Enabled() = New_Enabled
    TxtSpin.Enabled = New_Enabled
    ImgUp.Enabled = New_Enabled
    If New_Enabled = False Then
        ImgUp.Picture = Img(3).Picture
        ShapeBorder.BorderColor = &HC0C0C0
    Else
        ResetPic
        ShapeBorder.BorderColor = &HB99D7F
    End If
    PropertyChanged "Enabled"
End Property
Private Sub ImgUp_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    ImgUp.Picture = Img(2).Picture
    ImgUp_Click
End Sub

Private Sub ImgUp_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    If ImgUp.Picture <> Img(1).Picture Then ImgUp.Picture = Img(1).Picture
End Sub

Private Sub TxtSpin_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    RaiseEvent MouseMove(Button, Shift, x, y)
    ResetPic
End Sub
Private Sub RePos()
Dim i As Integer
    ShapeBorder.Top = 0
    If Width < 400 Then Width = 400
    ShapeBorder.Width = Width
    ImgUp.Left = Width - 285
    
    TxtSpin.Left = 10
    TxtSpin.Width = Width - 30 ' - 375
    Height = 315
    ShapeBorder.Height = Height
    TxtSpin.Top = 20
    TxtSpin.Height = Height - 40
End Sub
Private Sub ResetPic()
    If ImgUp.Picture <> Img(0).Picture Then
        ImgUp.Picture = Img(0).Picture
    End If
End Sub
Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    ResetPic
End Sub
Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_UserMemId = -501
    BackColor = m_BackColor
End Property
Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
    m_BackColor = New_BackColor
    TxtSpin.BackColor = New_BackColor
    UserControl.BackColor = New_BackColor
    PropertyChanged "BackColor"
End Property
Public Property Get RightToLeft() As Boolean
Attribute RightToLeft.VB_UserMemId = -611
    RightToLeft = TxtSpin.RightToLeft
End Property

Public Property Let RightToLeft(ByVal New_RightToLeft As Boolean)
    TxtSpin.RightToLeft() = New_RightToLeft
    PropertyChanged "RightToLeft"
End Property
'Public Property Get Alignment() As Integer
'    Alignment = TxtSpin.Alignment
'End Property
'Public Property Let Alignment(ByVal New_Alignment As Integer)
'    TxtSpin.Alignment() = New_Alignment
'    PropertyChanged "Alignment"
'End Property
Public Property Get YearRange() As Integer
Attribute YearRange.VB_Description = "Determine Year Range , from YearRange before to YearRange after"
    YearRange = m_YearRange
End Property
Public Property Let YearRange(ByVal New_YearRange As Integer)
    m_YearRange = New_YearRange
    YR = New_YearRange
    PropertyChanged "YearRange"
End Property
Public Property Get FormBackColor() As OLE_COLOR
    FormBackColor = m_FormBackColor
End Property
Public Property Let FormBackColor(ByVal New_FormBackColor As OLE_COLOR)
    m_FormBackColor = New_FormBackColor
    FormBKC = New_FormBackColor
    PropertyChanged "FormBackColor"
End Property
Public Property Get BorderColor() As OLE_COLOR
Attribute BorderColor.VB_UserMemId = -503
    BorderColor = m_BorderColor
End Property
Public Property Let BorderColor(ByVal New_BorderColor As OLE_COLOR)
    m_BorderColor = New_BorderColor
    PropertyChanged "BorderColor"
End Property
Private Sub TxtSpin_DblClick()
    RaiseEvent DblClick
End Sub
Private Sub TxtSpin_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    Unload FrmCalender
    RaiseEvent MouseDown(Button, Shift, x, y)
End Sub
Private Sub TxtSpin_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    RaiseEvent MouseUp(Button, Shift, x, y)
End Sub
Public Property Get ForeColor() As OLE_COLOR
Attribute ForeColor.VB_UserMemId = -513
    ForeColor = TxtSpin.ForeColor
End Property
Public Property Let ForeColor(ByVal New_ForeColor As OLE_COLOR)
    TxtSpin.ForeColor() = New_ForeColor
    PropertyChanged "ForeColor"
End Property
Public Function Mi2Sh(MdDate As String) As String
   Mi2Sh = CD.Mi2Sh(CDate(MdDate))
End Function
Public Function Sh2Mi(ShDate As String) As String
    Sh2Mi = CStr(CD.Sh2Mi(ShDate))
End Function
Public Function FMonthDayName(mdn As Integer) As String
    FMonthDayName = CD.FMonthName(mdn)
End Function
Public Function FWeekDayName(wdn As Integer) As String
    FWeekDayName = CD.FWeekString(wdn)
End Function
Public Function FMonthName(mn As Integer) As String
    FMonthName = CD.FMonthName(mn)
End Function
Public Property Get MiladiDate() As String
    MiladiDate = Sh2Mi(Text)
End Property
Public Property Get curMDYear() As Integer
    curMDYear = Year(Sh2Mi(Text))
End Property
Public Property Get curMDMonth() As Integer
    curMDMonth = Month(Sh2Mi(Text))
End Property
Public Property Get curMDDay() As Integer
    curMDDay = Day(Sh2Mi(Text))
End Property
Public Property Get ShowFarsiMonth() As Boolean
    ShowFarsiMonth = m_SFM
End Property
Public Property Let ShowFarsiMonth(ByVal vNewSFM As Boolean)
    m_SFM = vNewSFM
    PropertyChanged "ShowFarsiMonth"
End Property
Public Property Get CalFontBold() As Boolean
    CalFontBold = m_FontB
End Property
Public Property Let CalFontBold(ByVal vNewCFB As Boolean)
    m_FontB = vNewCFB
    PropertyChanged "CalFontBold"
End Property
