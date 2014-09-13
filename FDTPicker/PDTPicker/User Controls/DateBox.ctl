VERSION 5.00
Begin VB.UserControl DateBox 
   ClientHeight    =   570
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3270
   ScaleHeight     =   570
   ScaleWidth      =   3270
   ToolboxBitmap   =   "DateBox.ctx":0000
   Begin VB.PictureBox DatePic 
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Height          =   420
      Left            =   0
      ScaleHeight     =   360
      ScaleWidth      =   2385
      TabIndex        =   0
      Top             =   0
      Width           =   2445
      Begin VB.TextBox Dt 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         Height          =   195
         Index           =   2
         Left            =   900
         MaxLength       =   2
         MousePointer    =   1  'Arrow
         TabIndex        =   3
         Top             =   45
         Width           =   195
      End
      Begin VB.TextBox Dt 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         Height          =   195
         Index           =   1
         Left            =   585
         MaxLength       =   2
         MousePointer    =   1  'Arrow
         TabIndex        =   2
         Top             =   45
         Width           =   195
      End
      Begin VB.TextBox Dt 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         Height          =   195
         Index           =   0
         Left            =   45
         MaxLength       =   4
         MousePointer    =   1  'Arrow
         TabIndex        =   1
         Top             =   45
         Width           =   375
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "/"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   810
         TabIndex        =   5
         Top             =   45
         Width           =   75
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "/"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   450
         TabIndex        =   4
         Top             =   45
         Width           =   75
      End
   End
   Begin VB.Label lblS 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "9"
      Height          =   195
      Left            =   90
      TabIndex        =   6
      Top             =   990
      Width           =   90
   End
End
Attribute VB_Name = "DateBox"
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
'* DateBox.ctl: Implementation of the Date Box for convenience in Date entry.
'* This file is part of the PDTPicker - Persian Date Picker.
'******************************************************************************

'TODO: Some Date calculations are still wrong every 28 years (the next is 1407)
'You can use these algortihm for now till a standard will come - or you won't need
'any Persian Date calculation in the case our calender changes to Gregorian -.

'TODO: implementing different formats for Date display.
'Public Enum FDtFormat
'    [0 - ShortFormat] = 0
'    [1 - LongFormat] = 1
'    [2 - WeakDayShort] = 2
'End Enum

Option Explicit
Event Change() 'MappingInfo=Dt(0),Dt,0,Change
Event Click() 'MappingInfo=DatePic,DatePic,-1,Click
Attribute Click.VB_UserMemId = -600
Event MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single) 'MappingInfo=DatePic,DatePic,-1,MouseMove
Attribute MouseMove.VB_UserMemId = -606
Event MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

'Private Sub UserControl_Initialize()
'    blnTested = False
'
'    Dim lic As New License
'    ProID = lic.GetString
'    Set lic = Nothing
'
'    GetSysRegs
'End Sub
Private Sub UserControl_InitProperties()
'blnTested = True
'CheckReg
Me.Font = Ambient.Font
If Me.Font.Size < 10 Then Me.Font.Size = 10
Me.Text = Today
RePos
End Sub
'Private Sub UserControl_Show()
'If Ambient.UserMode = False Then
'    CheckReg
'End If

'Dim hCwnd As Long
'hCwnd = GetAncestor(UserControl.ContainerHwnd, 1)
'hCwnd = GetParent(UserControl.ContainerHwnd)
'Dim MyStr As String
'MyStr = String(100, Chr$(0))
'GetWindowText hCwnd, MyStr, 300
'MsgBox MyStr
'    Dim Ret As String, RetVal As Long, lpClassName As String
'    lpClassName = Space(256)
'    'retrieve the class name
'    RetVal = GetClassName(hCwnd, lpClassName, 256)
'    'Show the classname
'    MsgBox "Classname: " + Left$(lpClassName, RetVal)
'If "*internet exp*" Like LCase$(MyStr) Then 'if you don't want this to be used in IE.
'    MsgBox "sorry"
'Else
'    MsgBox "its ok"
'End If
'End Sub
Property Get InitDate() As String
    InitDate = Dt(0) & "/" & Dt(1) & "/" & Dt(2)
End Property

Property Let InitDate(ByVal Value As String)
    Dim Dtparts As Variant, UB As Integer, i As Byte
    If ErrorResume Then On Error Resume Next
    Dtparts = Split(Value, "/")
    UB = UBound(Dtparts)
    If UB <> 2 Then
        MsgBox "Invalid Date"
    End If
    For i = 0 To 2
        Dtparts(i) = Val(Dtparts(i))
        If Not IsNumeric(Dtparts(i)) Then
            MsgBox "Invalid Date, containing invalid characters."
        End If
    Next i
    If Len(Dtparts(0)) <= 2 And Len(Dtparts(2)) = 4 Then
        Dim Temp As Integer
        Temp = Dtparts(0)
        Dtparts(0) = Dtparts(2)
        Dtparts(2) = Temp
    End If
    If Val(Dtparts(1)) > 12 Then
        Temp = Dtparts(2)
        Dtparts(2) = Dtparts(1)
        Dtparts(1) = Temp
    End If
    
    Dt(0) = Dtparts(0)
    Dt(1) = Format$(Dtparts(1), "00")
    Dt(2) = Format$(Dtparts(2), "00")
    RaiseEvent Change
End Property
Private Sub Dt_Click(Index As Integer)
    RaiseEvent Click
    With Dt(Index)
        .SelStart = 0
        .SelLength = Len(.Text)
    End With
End Sub
Public Sub About()
Attribute About.VB_UserMemId = -552
    MsgBox "~~~~~~~~~~~~~~~~~~~~~~ FDTPicker v1.5 ~~~~~~~~~~~~~~~~~~~~~~" & vbCrLf & _
        "Written by Mohsen A. Momeni" & vbTab & vbTab & vbTab & "Website : www.momeni.us.tc" & vbCrLf & vbCrLf & _
        "Persian clone for Microsoft DTPicker ActiveX control, for simple implementation of Shamsi Date in your programs"
End Sub
Private Sub Dt_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
Dim nYear As Integer, nMonth As Integer, nDay As Integer, bnd As Integer

If ErrorResume Then On Error Resume Next
nYear = Val(Dt(0).Text)
nMonth = Val(Dt(1).Text)
nDay = Val(Dt(2).Text)
'MsgBox KeyCode
'Unload Me
Select Case KeyCode
    Case 8: Exit Sub
    Case 38:
        With Dt(Index)
            Select Case Index
                Case 0:
                    If nYear = 9999 Then
                        nYear = 1100
                      Else
                        nYear = nYear + 1
                    End If
                    .Text = nYear
                    
                    If Leaped(nYear) = False And nMonth = 12 And nDay > 29 Then Dt(2).Text = 29
                Case 1:
                    If nMonth = 12 Then
                        nMonth = 1
                      Else
                        nMonth = nMonth + 1
                    End If
                    .Text = nMonth
                    If nMonth > 6 And nDay = 31 Then nDay = 30
                    If nMonth = 12 And Leaped = False And nDay = 30 Then nDay = 29
                    Dt(2).Text = nDay
                Case 2:
                    If nMonth <= 6 Then
                        bnd = 31
                       ElseIf nMonth > 6 And nMonth < 12 Then
                        bnd = 30
                       Else
                        If Leaped Then bnd = 30 Else bnd = 29
                    End If
                    
                    If nDay = bnd Then
                        nDay = 1
                      Else
                        nDay = nDay + 1
                    End If
                    .Text = nDay
            End Select
            .SetFocus
            .SelStart = 0
            .SelLength = Len(.Text)
        End With
        RaiseEvent Change
        Exit Sub
    Case 40:
        With Dt(Index)
            Select Case Index
                Case 0:
                    If nYear = 1100 Then
                        nYear = 9999
                      Else
                        nYear = nYear - 1
                    End If
                    .Text = nYear
                    
                    If Leaped(nYear) = False And nMonth = 12 And nDay > 29 Then Dt(2).Text = 29

                Case 1:
                    If nMonth = 1 Or nMonth = 0 Then
                        nMonth = 12
                      Else
                        nMonth = nMonth - 1
                    End If
                    .Text = nMonth
                    If nMonth > 6 And nDay = 31 Then nDay = 30
                    If nMonth = 12 And Leaped = False And nDay = 30 Then nDay = 29
                    Dt(2).Text = nDay
                Case 2:
                    If nMonth <= 6 Then
                        bnd = 31
                       ElseIf nMonth > 6 And nMonth < 12 Then
                        bnd = 30
                       Else
                        If Leaped Then bnd = 30 Else bnd = 29
                    End If
                    If nDay = 1 Or nDay = 0 Then
                        nDay = bnd
                      Else
                        nDay = nDay - 1
                    End If
                    .Text = nDay
            End Select
            .SetFocus
            .SelStart = 0
            .SelLength = Len(.Text)
        End With
        RaiseEvent Change
        Exit Sub
    Case 39:
        With Dt((Index + 1) Mod 3)
            .SetFocus
            .SelStart = 0
            .SelLength = Len(.Text)
        End With
        'RaiseEvent Change
        Exit Sub
    Case 37:
        Dim NI As Integer
        If Index = 0 Then NI = 2 Else NI = Index - 1
        With Dt(NI)
            .SetFocus
            .SelStart = 0
            .SelLength = Len(.Text)
        End With
        'RaiseEvent Change
        Exit Sub
End Select
End Sub

Private Sub Dt_KeyPress(Index As Integer, KeyAscii As Integer)
If KeyAscii = 8 Then Exit Sub
If KeyAscii <= 47 Or KeyAscii >= 58 Then KeyAscii = 0: Exit Sub
Dim cur As String, mnt As Integer, l As Integer
If ErrorResume Then On Error Resume Next
mnt = Val(Dt(1).Text)
cur = Dt(Index).Text
l = Len(cur)
Select Case Index
    Case 1:
        If l = 1 Then
            If Val(cur) = 1 And KeyAscii >= 51 Then KeyAscii = 0: Beep
            If Val(cur) > 1 Then KeyAscii = 0: Beep
        End If
    Case 2:
        If l = 1 Then
            Dim os As Integer
            os = Val(IIf(mnt <= 6, 1, 0))
            If Val(cur) = 3 And mnt = 12 And Not Leaped Then KeyAscii = 0: Beep: Exit Sub
            If Val(cur) = 3 And KeyAscii > 48 + os Then KeyAscii = 0: Beep
            If Val(cur) > 3 Then KeyAscii = 0: Beep
        End If
End Select
End Sub
Private Function Leaped(Optional y As Integer) As Boolean
    If Not y Then y = Val(Dt(0).Text)
    If y Mod 4 = 3 Then
        Leaped = True
       Else
        Leaped = False
    End If
End Function

Private Sub Dt_LostFocus(Index As Integer)
Dim l As Integer, FYear As Integer
Dim Changed As Boolean
Changed = False
Dim cur As String
If ErrorResume Then On Error Resume Next
cur = Dt(Index).Text
Select Case Index
    Case 0:
        FYear = Left$(Year(Date) - 621, 3)
        If Val(cur) = 0 Then Dt(0).Text = "1100": Changed = True
        l = Len(cur)
        Select Case l
            Case 1: Dt(0).Text = FYear & cur: Changed = True
            Case 2: Dt(0).Text = Left$(FYear, 2) & cur: Changed = True
            Case 3: Dt(0).Text = Left$(FYear, 1) & cur: Changed = True
            Case 4: If cur < 1100 Then cur = 1100: Changed = True
        End Select
    Case 1:
        If Val(cur) = 0 Then
            Dt(Index).Text = "01": Changed = True
        ElseIf Len(cur) < 2 Then
            Dt(Index).Text = "0" & cur
        End If
        If Val(cur) = 12 Then
            If Leaped And Dt(2).Text = 31 Then Dt(2).Text = 30: Changed = True
            If Not Leaped And Dt(2).Text > 29 Then Dt(2).Text = 29: Changed = True
        End If
    Case 2:
        If Val(cur) = 0 Then
            Dt(Index).Text = "01": Changed = True
        ElseIf Len(cur) < 2 Then
            Dt(Index).Text = "0" & cur
        End If
End Select
If Changed Then RaiseEvent Change
End Sub
Private Sub Dt_MouseDown(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
    RaiseEvent MouseDown(Button, Shift, x, y)
End Sub
Private Sub Label1_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dt(0).SetFocus
    Dt(0).SelStart = 0
    Dt(0).SelLength = 4
End Sub
Private Sub Label2_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dt(1).SetFocus
    Dt(1).SelStart = 0
    Dt(1).SelLength = 2
End Sub
Private Sub DatePic_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dt(2).SetFocus
    Dt(2).SelStart = 0
    Dt(2).SelLength = 2
End Sub
Private Function Today() As String
'Old date conversion routine.
'Dim mYear, mMonth, mDay As Integer
'
'    Dim iMonthFarsi()
'    iMonthFarsi = Array(31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 29)
'
'    Dim iLeap As Integer
'    mYear = Year(Date) - 621
'    iLeap = Year(Date) Mod 4
'    If iLeap = 1 Then iMonthFarsi(11) = 30
'
''Finding Passed days
'    mDay = DatePart("y", Date)
'    mDay = mDay - 79
'    If mDay <= 0 Then
'        If iLeap = 1 Then
'         mDay = mDay + 366
'        Else
'         mDay = mDay + 365
'        End If
'    End If
'
'Dim d As Integer
'd = mDay
'If d > 186 Then
'    d = d - 186
'    mDay = (d) Mod 30
'    If mDay = 0 Then mDay = 30
'    mMonth = 7 + (d - mDay) / 30
'    'If d = 179 Then mMonth = mMonth + 1
'Else
'    mDay = d Mod 31
'    If mDay = 0 Then mDay = 31
'    mMonth = ((d - mDay) / 31) + 1
'End If
'
''Finding species days for Set Year
'    Dim iSensentiveArea As Integer
'    iSensentiveArea = IIf(iLeap = 0, 20, 21)
'    If Month(Date) = 3 And Day(Date) < iSensentiveArea Then mYear = mYear - 1
'    If Month(Date) <= 2 Then mYear = mYear - 1
'
'Today = mYear & "/" & mMonth & "/" & mDay
Dim CDt As New ClsDate
Today = CDt.Mi2Sh(Date)
Set CDt = Nothing
End Function
Private Sub UserControl_Resize()
    DatePic.Height = UserControl.Height
    DatePic.Width = UserControl.Width
End Sub
Private Sub RePos()
Dim Width As Long, Heigth As Long, i As Byte
Width = lblS.Width
Height = lblS.Height
If ErrorResume Then On Error Resume Next

Dt(0).Width = Width * 4 ' + 8

Dt(0).Left = 20

For i = 0 To 2
    Dt(i).Top = 20
    Dt(i).Height = Height
    If i <> 0 Then
        Dt(i).Left = Dt(i - 1).Left + Dt(i - 1).Width + Label1.Width
        Dt(i).Width = Width * 2 ' + 8
    End If
Next i
Label1.Left = Dt(0).Left + Dt(0).Width
Label2.Left = Dt(1).Left + Dt(1).Width
Label1.Top = 20
Label2.Top = 20
UserControl.Height = 4 * Dt(0).Top + Dt(0).Height
End Sub
Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_UserMemId = -501
    BackColor = DatePic.BackColor
End Property
Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
    DatePic.BackColor() = New_BackColor
    Dim i As Byte
    For i = 0 To 2
        Dt(i).BackColor = New_BackColor
    Next i
    Label1.BackColor = New_BackColor
    Label2.BackColor = New_BackColor
    PropertyChanged "BackColor"
End Property
Public Property Get BorderStyle() As Integer
Attribute BorderStyle.VB_UserMemId = -504
    BorderStyle = DatePic.BorderStyle
End Property

Public Property Let BorderStyle(ByVal New_BorderStyle As Integer)
    DatePic.BorderStyle() = New_BorderStyle
    PropertyChanged "BorderStyle"
End Property

Private Sub Dt_Change(Index As Integer)
    'RaiseEvent Change
End Sub

Private Sub DatePic_Click()
    RaiseEvent Click
End Sub
Public Property Get Enabled() As Boolean
Attribute Enabled.VB_UserMemId = -514
    Enabled = DatePic.Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
    DatePic.Enabled() = New_Enabled
    Dt(0).Enabled = New_Enabled
    Dt(1).Enabled = New_Enabled
    Dt(2).Enabled = New_Enabled
    Label1.Enabled = New_Enabled
    Label2.Enabled = New_Enabled
    PropertyChanged "Enabled"
End Property
Public Property Get Font() As Font
Attribute Font.VB_UserMemId = -512
    Set Font = Dt(0).Font
End Property

Public Property Set Font(ByVal New_Font As Font)
Dim i As Integer
If New_Font.Size > 10 Then New_Font.Size = 10

For i = 0 To 2
    Set Dt(i).Font = New_Font
Next i

Set Label1.Font = New_Font
Set Label2.Font = New_Font
Set lblS.Font = New_Font
RePos

PropertyChanged "Font"
End Property
Public Property Get ForeColor() As OLE_COLOR
Attribute ForeColor.VB_UserMemId = -513
    ForeColor = Dt(0).ForeColor
End Property

Public Property Let ForeColor(ByVal New_ForeColor As OLE_COLOR)
Dim i As Integer
For i = 0 To 2
    Dt(i).ForeColor() = New_ForeColor
Next i
    Label1.ForeColor = New_ForeColor
    Label2.ForeColor = New_ForeColor
    PropertyChanged "ForeColor"
End Property
Public Property Get hwnd() As Long
Attribute hwnd.VB_UserMemId = -515
    hwnd = UserControl.hwnd
End Property
Public Property Get Locked() As Boolean
    Locked = Dt(0).Locked
End Property

Public Property Let Locked(ByVal New_Locked As Boolean)
Dim i As Integer
For i = 0 To 2
    Dt(i).Locked() = New_Locked
Next i
    PropertyChanged "Locked"
End Property

Private Sub DatePic_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    RaiseEvent MouseMove(Button, Shift, x, y)
End Sub
Public Property Get RightToLeft() As Boolean
Attribute RightToLeft.VB_UserMemId = -611
    RightToLeft = DatePic.RightToLeft
End Property

Public Property Let RightToLeft(ByVal New_RightToLeft As Boolean)
    DatePic.RightToLeft() = New_RightToLeft
    PropertyChanged "RightToLeft"
End Property
Public Property Get Text() As String
Attribute Text.VB_UserMemId = -517
Attribute Text.VB_MemberFlags = "1224"
    Text = Me.InitDate
End Property

Public Property Let Text(ByVal New_Text As String)
    InitDate = New_Text
    PropertyChanged "Text"
End Property
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    Dim fnt As Font, fclr As OLE_COLOR, bclr As OLE_COLOR, bl As Boolean
    bclr = PropBag.ReadProperty("BackColor", &H80000005)
    DatePic.BorderStyle = PropBag.ReadProperty("BorderStyle", 1)
    DatePic.Enabled = PropBag.ReadProperty("Enabled", True)
    
    Set fnt = PropBag.ReadProperty("Font", Ambient.Font)
    fclr = PropBag.ReadProperty("ForeColor", &H80000008)
    bl = PropBag.ReadProperty("Locked", False)
    DatePic.RightToLeft = PropBag.ReadProperty("RightToLeft", False)
    Me.Text = PropBag.ReadProperty("Text", Today)
    Dim i As Byte
    DatePic.BackColor = bclr
    For i = 0 To 2
        Set Dt(i).Font = fnt
        Dt(i).ForeColor = fclr
        Dt(i).BackColor = bclr
        Dt(i).Locked = bl
    Next i
    Set Label1.Font = fnt
    Set Label2.Font = fnt
    Set lblS.Font = fnt
    RePos
    Label1.ForeColor = fclr
    Label1.BackColor = bclr
    Label2.ForeColor = fclr
    Label2.BackColor = bclr
End Sub

'Write property values to storage
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)

    Call PropBag.WriteProperty("BackColor", DatePic.BackColor, &H80000005)
    Call PropBag.WriteProperty("BorderStyle", DatePic.BorderStyle, 1)
    'Call PropBag.WriteProperty("DataSource", m_DataSource, Nothing)
    Call PropBag.WriteProperty("Enabled", DatePic.Enabled, True)
    Call PropBag.WriteProperty("Font", Dt(0).Font, Ambient.Font)
    Call PropBag.WriteProperty("ForeColor", Dt(0).ForeColor, &H80000008)
    Call PropBag.WriteProperty("Locked", Dt(0).Locked, False)
    Call PropBag.WriteProperty("RightToLeft", DatePic.RightToLeft, False)
    Call PropBag.WriteProperty("Text", Me.Text, Today)
End Sub

