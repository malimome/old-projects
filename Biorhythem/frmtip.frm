VERSION 5.00
Begin VB.Form frmTip 
   Appearance      =   0  'Flat
   BackColor       =   &H00F9E8EC&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Tip of the Day"
   ClientHeight    =   2895
   ClientLeft      =   2355
   ClientTop       =   2385
   ClientWidth     =   4800
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   178
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmtip.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   2895
   ScaleWidth      =   4800
   StartUpPosition =   2  'CenterScreen
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin VB.CheckBox chkLoadTipsAtStartup 
      BackColor       =   &H00F9E8EC&
      Caption         =   "&Show Tips at Startup"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   120
      TabIndex        =   3
      Top             =   2550
      Width           =   1830
   End
   Begin VB.CommandButton cmdNextTip 
      BackColor       =   &H00FFC0C0&
      Caption         =   "&Next Tip"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3675
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   600
      Width           =   1065
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H80000018&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2415
      Left            =   120
      Picture         =   "frmtip.frx":0442
      ScaleHeight     =   2355
      ScaleWidth      =   3375
      TabIndex        =   1
      Top             =   120
      Width           =   3435
      Begin VB.Label Label1 
         BackColor       =   &H80000018&
         Caption         =   "Did you know..."
         Height          =   255
         Left            =   525
         TabIndex        =   5
         Top             =   150
         Width           =   2655
      End
      Begin VB.Label lblTipText 
         BackColor       =   &H80000018&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1710
         Left            =   75
         TabIndex        =   4
         Top             =   525
         Width           =   3165
      End
   End
   Begin VB.CommandButton cmdOK 
      BackColor       =   &H00FFC0C0&
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3675
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   150
      Width           =   1065
   End
End
Attribute VB_Name = "frmTip"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' The in-memory database of tips.
Dim Tips As New Collection
' Index in collection of tip currently being displayed.
Dim CurrentTip As Long
Private Sub Form_Load()
    Dim ShowAtStartup As Long
    
    ' See if we should be shown at startup
    ShowAtStartup = GetSetting(App.EXEName, "Options", "Show Tips at Startup", 1)
    If ShowAtStartup = 0 Then
        Unload Me
        Exit Sub
    End If
        
    ' Set the checkbox, this will force the value to be written back out to the registry
    Me.chkLoadTipsAtStartup.Value = vbChecked
    ' Read in the tips file and display a tip at random.
  Call LoadTips
End Sub
Private Sub LoadTips()
    Dim NextTip(19) As String   ' Each tip read in from file.
    Dim i As Byte
    NextTip(0) = "What are biorhythms?"
    NextTip(1) = " Biorhythms are a method to predict three cycles in your life based on your birthday.These cycles are the physical,emotional and intellectual cycle.Each of these cycles goes through different phases: high, low and critical."
    NextTip(2) = "What do the different phases mean?"
    NextTip(3) = "If a cycle is above the midline (the 0% line) you experience a high is the corresponding field. If a cycle is below the midline you experience a low and finally if a cycle crosses the midline you experience a critical phase."
    NextTip(4) = "If a cycle is in a high phase you are better able to interact in that area. If for example your intellectual cycle is in a high phase you are better able to do exams. "
    NextTip(5) = "If a cycle is in a low phase it is harder to do well in an area. If for example your emotional cycle is in a low phase you are more irritable."
    NextTip(6) = "What is the meaning of the critical phase?"
    NextTip(7) = "You experience a critical phase when a cycle crosses the midline. During this time there is a greater risk of errors and accidents."
    NextTip(8) = "Are biorhythms for real?"
    NextTip(9) = "This is up for you to decide! Just like for example horoscopes and numerology some people believe them and some people don't."
    NextTip(10) = " What 's the history of biorhythms?"
    NextTip(11) = "The scientists Dr. Hermanna Swoboda and Dr. Wilhelm Fliess discovered biorhythms about a hundred years ago. Both scientists weren't working together but discovered biorhythms at about the same time."
    NextTip(12) = "You can send your problems or comments about this program at:                                               Email:a_momeni@hotmail.com"
    NextTip(13) = "To use this program, your computer date must be according to Gregorian Calendar(English)."
    NextTip(14) = " To get help about buttons and other parts of program you can pause on them with your mouse and see the tooltiptext apearing very soon."
    NextTip(15) = " Names and birth dates can be easily saved by pressing Save button.The first name you save will be always the default name."
    NextTip(16) = "You can use both A.D. Date or solar(persian calender) Date depending on your birth date."
    NextTip(17) = "Keyboard shortcuts can make it easier and faster to work with the plot:pause on the buttons with your mouse to see the same-functioning keys on keyboard.(e.g. R----Refresh,Esc----Exit,Backspace-----------Previous page)"
    NextTip(18) = "you can move the plot to future and to past:Just press F to move the plot to future and B to past."
    NextTip(19) = "For more information visit these sites:                                                                                                    http:\\www.DailyBiorhythm.com                                                      http:\\www.BioLoveMatch.com"
     For i = 0 To 19
        Tips.Add NextTip(i)
     Next i
    DoNextTip
End Sub
Private Sub DoNextTip()
    '  cycle through the Tips in order
    CurrentTip = CurrentTip + 1
    If Tips.Count < CurrentTip Then
        CurrentTip = 1
    End If
    ' Show it.
    frmTip.DisplayCurrentTip
    
End Sub
Public Sub DisplayCurrentTip()
    If Tips.Count > 0 Then
        lblTipText.Caption = Tips.Item(CurrentTip)
    End If
End Sub
Private Sub chkLoadTipsAtStartup_Click()
    ' save whether or not this form should be displayed at startup
    SaveSetting App.EXEName, "Options", "Show Tips at Startup", chkLoadTipsAtStartup.Value
End Sub

Private Sub cmdNextTip_Click()
    DoNextTip
End Sub

Private Sub cmdok_Click()
    Unload Me
End Sub


