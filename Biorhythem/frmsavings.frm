VERSION 5.00
Begin VB.Form frmsavings 
   Appearance      =   0  'Flat
   BackColor       =   &H00F9E8EC&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "open file..."
   ClientHeight    =   3795
   ClientLeft      =   45
   ClientTop       =   420
   ClientWidth     =   3465
   Icon            =   "frmsavings.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3795
   ScaleWidth      =   3465
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmddelete 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Delete"
      Enabled         =   0   'False
      Height          =   400
      Left            =   2175
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   2625
      Width           =   1100
   End
   Begin VB.CommandButton cmddelal 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Delete all"
      Height          =   400
      Left            =   2175
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   2100
      Width           =   1100
   End
   Begin VB.CommandButton cmdcancel 
      BackColor       =   &H00FFC0C0&
      Caption         =   "cancel"
      Height          =   400
      Left            =   2175
      Style           =   1  'Graphical
      TabIndex        =   1
      ToolTipText     =   "·€Ê"
      Top             =   1200
      Width           =   1100
   End
   Begin VB.CommandButton cmdok 
      BackColor       =   &H00FFC0C0&
      Caption         =   "OK"
      Height          =   400
      Left            =   2175
      Style           =   1  'Graphical
      TabIndex        =   0
      ToolTipText     =   " √ÌÌœ"
      Top             =   675
      Width           =   1100
   End
   Begin VB.TextBox txtopen 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "Simplified Arabic"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   315
      RightToLeft     =   -1  'True
      TabIndex        =   2
      ToolTipText     =   "«”„ «‰ Œ«»Ì"
      Top             =   135
      Width           =   1590
   End
   Begin VB.ListBox lstsavings 
      BeginProperty Font 
         Name            =   "Simplified Arabic"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2895
      ItemData        =   "frmsavings.frx":0442
      Left            =   315
      List            =   "frmsavings.frx":0444
      RightToLeft     =   -1  'True
      TabIndex        =   5
      ToolTipText     =   "«”«„Ì –ŒÌ—Â ‘œÂ"
      Top             =   630
      Width           =   1590
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00F8275B&
      BorderWidth     =   3
      X1              =   3300
      X2              =   2100
      Y1              =   1875
      Y2              =   1875
   End
End
Attribute VB_Name = "frmsavings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit: Dim t As Byte
Private Sub cmdcancel_Click()
  frminfo.Enabled = True: frmsavings.Visible = False: frminfo.Visible = True
  Unload frmsavings
End Sub
Private Sub cmddelal_Click()
 Dim tst, i As Byte
 tst = MsgBox("Are you sure you want to delete all records?", vbCritical + vbYesNo, "Confirm")
  If tst = vbYes Then
     Kill App.Path + "\My Data.daa"
     cmddelete.Enabled = False: cmddelal.Enabled = False
     For i = 0 To lstsavings.ListCount - 1
       ffname(i) = ""
     Next i
     lstsavings.Clear
  End If
erhan:
End Sub
Private Sub cmddelete_Click()
  Dim i, mb As Byte
  mb = MsgBox("Are you sure you want to delete this item?", vbCritical + vbYesNo, "Confirm")
  If mb = vbYes Then
     For t = 0 To lstsavings.ListCount
       If lstsavings.List(t) = lstsavings.Text Then Exit For
     Next t
       Open App.Path + "\My Data.daa" For Output As #1
         For i = 0 To lstsavings.ListCount
              If i = t Then Call changedataorder
              If ffname(i) <> "" Then
                Write #1, ffname(i), dtofbirth(i), blnyearad(i)
              End If
         Next i
       Close 1#
    lstsavings.RemoveItem (t)
    If lstsavings.List(t) <> "" Then
       txtopen = lstsavings.List(t): lstsavings.Text = lstsavings.List(t)
       Else
       txtopen = lstsavings.List(t - 1): lstsavings.Text = lstsavings.List(t - 1)
    End If
    If lstsavings.ListCount = 0 Then cmddelete.Enabled = False
End If
End Sub
Private Sub changedataorder()
  Dim a As Byte
   For a = t To lstsavings.ListCount
     ffname(a) = ffname(a + 1): dtofbirth(a) = dtofbirth(a + 1): blnyearad(a) = blnyearad(a + 1)
   Next a
End Sub
Private Sub cmdok_Click()
  Dim j As Byte
  For j = 0 To lstsavings.ListCount
     If ffname(j) = txtopen Then Exit For
  Next j
  If ffname(j) <> "" Then
    frminfo.txtname = ffname(j): frminfo.txtbirth = dtofbirth(j)
    If blnyearad(j) = True Then
        frminfo.optad.Value = True
       Else
         frminfo.optsolar.Value = True
         frminfo.txtbirth = TrueDate(dtofbirth(j))
     End If
   End If
  frminfo.Enabled = True: frmsavings.Visible = False: frminfo.Visible = True
  Unload frmsavings
End Sub
Private Sub Form_Load()
  lstsavings.Clear
  On Error GoTo erhan
  Open App.Path + "\My Data.daa" For Input As #1
     Dim i As Byte: i = 0
     Do Until EOF(1)
       Input #1, ffname(i), dtofbirth(i), blnyearad(i)
       If ffname(i) <> "" Then
         frmsavings.lstsavings.AddItem ffname(i): cmddelete.Enabled = True: cmddelal.Enabled = True
       End If
       i = i + 1
     Loop
  Close #1
  txtopen = lstsavings.List(0): lstsavings.Text = lstsavings.List(0)
  Exit Sub
erhan: Close 1#: cmddelal.Enabled = False: Exit Sub
End Sub
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  frminfo.Enabled = True
End Sub
Private Sub lstsavings_Click()
 txtopen = lstsavings.Text
End Sub
Private Sub lstsavings_DblClick()
 cmdok_Click
End Sub

