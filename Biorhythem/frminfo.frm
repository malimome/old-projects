VERSION 5.00
Begin VB.Form frminfo 
   Appearance      =   0  'Flat
   BackColor       =   &H00F9E8EC&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "info..."
   ClientHeight    =   3855
   ClientLeft      =   45
   ClientTop       =   690
   ClientWidth     =   6450
   BeginProperty Font 
      Name            =   "Palatino Linotype"
      Size            =   9.75
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frminfo.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   3855
   ScaleWidth      =   6450
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdabout 
      BackColor       =   &H00FFC0C0&
      Caption         =   "About"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   690
      Left            =   4950
      MouseIcon       =   "frminfo.frx":0442
      MousePointer    =   99  'Custom
      Picture         =   "frminfo.frx":0594
      Style           =   1  'Graphical
      TabIndex        =   13
      ToolTipText     =   "œ—»«—Â »—‰«„Â"
      Top             =   150
      Width           =   690
   End
   Begin VB.CommandButton cmdhelp 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Help"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   690
      Left            =   5700
      MouseIcon       =   "frminfo.frx":09D6
      MousePointer    =   99  'Custom
      Picture         =   "frminfo.frx":0B28
      Style           =   1  'Graphical
      TabIndex        =   12
      ToolTipText     =   "—«Â‰„«"
      Top             =   150
      Width           =   690
   End
   Begin VB.OptionButton optsolar 
      BackColor       =   &H00F9E8EC&
      Caption         =   "Solar &Hijri "
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Left            =   1350
      MouseIcon       =   "frminfo.frx":0F6A
      MousePointer    =   99  'Custom
      TabIndex        =   7
      ToolTipText     =   "ÂÃ—Ì ‘„”Ì "
      Top             =   2475
      Value           =   -1  'True
      Width           =   1215
   End
   Begin VB.OptionButton optad 
      BackColor       =   &H00F9E8EC&
      Caption         =   "&A.D."
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Left            =   2550
      MouseIcon       =   "frminfo.frx":10BC
      MousePointer    =   99  'Custom
      TabIndex        =   5
      ToolTipText     =   "„Ì·«œÌ"
      Top             =   2475
      Width           =   840
   End
   Begin VB.CommandButton cmdsave 
      BackColor       =   &H00FFC0C0&
      Caption         =   "&Save"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   720
      Left            =   825
      MouseIcon       =   "frminfo.frx":120E
      MousePointer    =   99  'Custom
      Picture         =   "frminfo.frx":1360
      Style           =   1  'Graphical
      TabIndex        =   6
      ToolTipText     =   "–ŒÌ—Â"
      Top             =   150
      Width           =   720
   End
   Begin VB.CommandButton cmdopen 
      BackColor       =   &H00FFC0C0&
      Caption         =   "&Open"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   720
      Left            =   75
      MouseIcon       =   "frminfo.frx":17A2
      MousePointer    =   99  'Custom
      Picture         =   "frminfo.frx":18F4
      Style           =   1  'Graphical
      TabIndex        =   4
      ToolTipText     =   "»«“ ò—œ‰ ›«Ì·"
      Top             =   150
      Width           =   705
   End
   Begin VB.CommandButton cmdexit 
      BackColor       =   &H00FFC0C0&
      Caption         =   "E&xit"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   780
      Left            =   5550
      MouseIcon       =   "frminfo.frx":1D36
      MousePointer    =   99  'Custom
      Picture         =   "frminfo.frx":1E88
      Style           =   1  'Graphical
      TabIndex        =   3
      ToolTipText     =   "Œ—ÊÃ"
      Top             =   3000
      Width           =   810
   End
   Begin VB.CommandButton cmdshow 
      BackColor       =   &H00FABEC9&
      Caption         =   "&Graph"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   810
      Left            =   4350
      MouseIcon       =   "frminfo.frx":22CA
      MousePointer    =   99  'Custom
      Picture         =   "frminfo.frx":241C
      RightToLeft     =   -1  'True
      Style           =   1  'Graphical
      TabIndex        =   2
      ToolTipText     =   "—”„ ‰„Êœ«—"
      Top             =   1650
      Width           =   1110
   End
   Begin VB.TextBox txtbirth 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "System"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   1350
      MaxLength       =   10
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Text            =   "1362/1/23"
      ToolTipText     =   " «—ÌŒ  Ê·œ"
      Top             =   1950
      Width           =   2535
   End
   Begin VB.TextBox txtname 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "System"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Left            =   1350
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Text            =   "„Õ”‰ ⁄·Ì „Ê„‰Ì"
      ToolTipText     =   "‰«„"
      Top             =   1425
      Width           =   2535
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00F9E8EC&
      Caption         =   "  Personal Information"
      BeginProperty Font 
         Name            =   "System"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FC2530&
      Height          =   1965
      Left            =   225
      TabIndex        =   8
      Top             =   975
      Width           =   5490
      Begin VB.Label Label3 
         BackColor       =   &H00F9E8EC&
         Caption         =   "Date:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   600
         TabIndex        =   11
         ToolTipText     =   "”«·"
         Top             =   1575
         Width           =   465
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackColor       =   &H00F9E8EC&
         Caption         =   "Birth Date:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   150
         TabIndex        =   10
         ToolTipText     =   " «—ÌŒ  Ê·œ"
         Top             =   1050
         Width           =   900
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackColor       =   &H00F9E8EC&
         Caption         =   "Name:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   525
         TabIndex        =   9
         ToolTipText     =   "‰«„"
         Top             =   525
         Width           =   525
      End
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000000&
      X1              =   0
      X2              =   6450
      Y1              =   0
      Y2              =   0
   End
   Begin VB.Menu mnufile 
      Caption         =   "Å—Ê‰œÂ"
      NegotiatePosition=   2  'Middle
      Begin VB.Menu mnunew 
         Caption         =   "ÃœÌœ"
         Shortcut        =   ^N
      End
      Begin VB.Menu mnuopen 
         Caption         =   "»«“ ò—œ‰"
         Shortcut        =   ^O
      End
      Begin VB.Menu mnuline 
         Caption         =   "-"
      End
      Begin VB.Menu mnusave 
         Caption         =   "–ŒÌ—Â"
         Shortcut        =   ^S
      End
      Begin VB.Menu mnuline2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuexi 
         Caption         =   "Œ—ÊÃ"
         Shortcut        =   ^E
      End
   End
   Begin VB.Menu mnuplot 
      Caption         =   "‰„Êœ«—"
      NegotiatePosition=   1  'Left
      Begin VB.Menu mnushow 
         Caption         =   "‰„«Ì‘"
         Shortcut        =   ^G
      End
      Begin VB.Menu mnusolar 
         Caption         =   "ÂÃ—Ì ‘„”Ì"
         Checked         =   -1  'True
         Shortcut        =   ^H
      End
      Begin VB.Menu mnuad 
         Caption         =   "„Ì·«œÌ"
         Shortcut        =   ^A
      End
   End
   Begin VB.Menu mnuhelp 
      Caption         =   "—«Â‰„«"
      NegotiatePosition=   1  'Left
      Begin VB.Menu mnumainhelp 
         Caption         =   " —«Â‰„«"
         Shortcut        =   {F1}
      End
      Begin VB.Menu mnuabout 
         Caption         =   "...œ—»«—Â"
      End
   End
End
Attribute VB_Name = "frminfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub Form_Load()
'sets the location of form
 frminfo.Height = 4620
 frminfo.Left = (Screen.Width - frminfo.Width) / 2
 frminfo.Top = (Screen.Height - frminfo.Height) / 2
 On Error GoTo erhan   'if there was no name saved this event finishes
  Open App.Path + "\My Data.daa" For Input As 1#   'opens the file
      Input #1, ffname(0), dtofbirth(0), blnyearad(0)
  Close 1#
  txtname = ffname(0): txtbirth = TrueDate(dtofbirth(0))   'uses the first name saved as default
  If blnyearad(0) = True Then
    optad.Value = True
    Else
    optsolar.Value = True
  End If
erhan: Close 1#
End Sub
Private Sub cmdexit_Click()
  Unload frminfo: Endprog        'finishes the program
End Sub
Private Sub cmdshow_Click()
 MousePointer = 11
 frmsavings.Visible = False
 If Not (IsDate(txtbirth)) Or Len(txtbirth) < 8 Then  'checks if birth date is wrongly entered
  Call ermessage: MousePointer = 1: Exit Sub
 End If
 ''''''''''''''''''''''calculating year,month,day'''''''''''''''''''''''''''''''''
' birth = frminfo.txtbirth
' yrbrth = Year(birth): dybrth = Day(birth): mnthbrth = Month(birth)
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  biorun.lblname = txtname
  biorun.Cls: frminfo.Visible = False: biorun.Visible = True
End Sub
Private Sub ermessage()
 Dim intnum As Byte
   intnum = MsgBox("Example:1380/9/20,100<=year", vbOKOnly + vbCritical, "Error in entry")
  If intnum = 1 Then
   txtbirth = "": txtbirth.SetFocus
  End If
End Sub
Private Sub cmdsave_Click()
   Dim tst As Byte: Dim i As Byte  'checks if something is wrong with the date or the name
   If frminfo.txtname = "" Or frminfo.txtbirth = "" Or IsDate(frminfo.txtbirth) = False Then
         MsgBox ("You should enter your name and (a valid) birth date. .«”„ Ê  «—ÌŒ („⁄ »—)Ê«—œ ò‰Ìœ")
         frminfo.txtbirth = "": Exit Sub
   End If
   If ffname(255) <> "" Then      'informs about the number of data that can be stored
     MsgBox ("You can save just 256 items.Sorry for inconvinience!  ‘„« ›ﬁÿ „Ì Ê«‰Ìœ 256 «”„ —« –ŒÌ—Â ò‰Ìœ")
     Exit Sub
   End If
   For i = 0 To 255
      If ffname(i) = "" Then Exit For
      If frminfo.txtname = ffname(i) Then   'checks if this name is used before
          MsgBox ("This name exists before.You can add an index for it!  «”„  ò—«—Ì!„Ì Ê«‰Ìœ «“ «‰œÌ” «” ›«œÂ ò‰Ìœ")
          Exit Sub
      End If
   Next i
   tst = MsgBox("Are you sure you want to save " & frminfo.txtname & "?", vbYesNo + vbQuestion, "Confirm")  'confirms that the user wants to save the name
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 If tst <> vbYes Then Exit Sub
  For i = 0 To 255
     If ffname(i) = "" Then   'finds the end of the file(the number i that nothing is stored in it
        ffname(i) = frminfo.txtname
        dtofbirth(i) = frminfo.txtbirth
        Exit For
     End If
  Next i
  If optad.Value = False Then
     blnyearad(i) = False
     Else
       blnyearad(i) = True
  End If
  frmsavings.lstsavings.AddItem (ffname(i))
  frmsavings.cmddelal.Enabled = True: frmsavings.cmddelete.Enabled = True
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  Open App.Path + "\My Data.daa" For Append As #1
     Write #1, ffname(i), dtofbirth(i), blnyearad(i)
  Close #1
End Sub
Private Sub cmdopen_Click()
 frmsavings.Visible = True: frminfo.Enabled = False
End Sub
Private Sub cmdhelp_Click()
 frmhelp.Visible = True
End Sub
Private Sub cmdabout_Click()
 frminfo.Enabled = False: mnuabout_Click
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
 Call offer
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  End
End Sub
Private Sub mnuabout_Click()
 frmAbout.Visible = True
End Sub

Private Sub mnuad_Click()
 optsolar.Value = False: optad.Value = True: mnusolar.Checked = False: mnuad.Checked = True
End Sub

Private Sub mnuexi_Click()
 cmdexit_Click
End Sub
Private Sub mnumainhelp_Click()
  frmhelp.Visible = True
End Sub
Private Sub mnunew_Click()
 frminfo.txtbirth = ""
 frminfo.txtname = ""
End Sub
Private Sub mnuopen_Click()
 cmdopen_Click
End Sub
Private Sub mnushow_Click()
 cmdshow_Click
End Sub
Private Sub mnusave_Click()
 cmdsave_Click
End Sub
Private Sub Frame1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Call offer
End Sub
Private Sub mnusolar_Click()
  optsolar.Value = True: optad.Value = False: mnuad.Checked = False: mnusolar.Checked = True
End Sub

Private Sub optad_Click()
 mnuad.Checked = True: mnusolar.Checked = False
End Sub

Private Sub optad_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
 Call offer
 optad.FontUnderline = True: optad.ForeColor = vbBlue
End Sub

Private Sub optsolar_Click()
 mnuad.Checked = False: mnusolar.Checked = True
End Sub

Private Sub optsolar_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
   Call offer
   optsolar.FontUnderline = True: optsolar.ForeColor = vbBlue
End Sub
Private Sub offer()
  optad.FontUnderline = False: optad.ForeColor = vbBlack
  optsolar.FontUnderline = False: optsolar.ForeColor = vbBlack
End Sub
Private Sub txtbirth_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
 Call offer
End Sub
Private Sub Label3_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
 Call offer
End Sub

