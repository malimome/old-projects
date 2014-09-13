VERSION 5.00
Begin VB.Form frmstart 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   4500
   ClientLeft      =   4500
   ClientTop       =   3300
   ClientWidth     =   6300
   DrawMode        =   4  'Mask Not Pen
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   4500
   ScaleWidth      =   6300
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   4500
      Left            =   0
      Picture         =   "frmstart.frx":0000
      ScaleHeight     =   4500
      ScaleWidth      =   6300
      TabIndex        =   0
      Top             =   0
      Width           =   6300
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   75
      Top             =   5925
   End
End
Attribute VB_Name = "frmstart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit: Dim blntst As Boolean: Dim timbef, timaft As Long  'timbef=time when the form is loaded:timaft=the time now
Private Sub Form_Initialize()   'when loading wants to start
  Dim tst As Byte
  If App.PrevInstance = True Then   'if another copy of this program is running now then it's true
   tst = MsgBox("A copy of Biorhythm is running,are you sure you want to run another one?", vbInformation + vbYesNo, "Confirm")
    If tst = vbNo Then End
  End If
End Sub
Private Sub Form_Load()    'setting the dimensions and the location of the form
 frmstart.Width = 5: frmstart.Height = 5: blntst = False: timbef = Timer
 frmstart.Left = (Screen.Width - 6300) / 2
frmstart.Top = (Screen.Height - 4500) / 2
End Sub
Private Sub picture1_Click()
  If blntst = True Then
      On Error Resume Next    'if tipofday is not to be started
      Timer1.Enabled = False: frmstart.Visible = False: Unload Me: frminfo.Visible = True: frmTip.Visible = True
  End If
End Sub
Private Sub Timer1_Timer()
  If blntst = False Then
    frmstart.Width = frmstart.Width + 630
    frmstart.Height = frmstart.Height + 450
  End If
  If frmstart.Height >= 4500 Or frmstart.Width >= 6300 Then blntst = True
  timaft = Timer
  If timaft - timbef >= 3 Then    'if the diffrence of timaft and timbef was greater than 4 then the form disapears
    picture1_Click    'the click-event is performed
  End If
End Sub
