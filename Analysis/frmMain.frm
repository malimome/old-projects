VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.MDIForm frmMain 
   BackColor       =   &H8000000C&
   Caption         =   "Numerical Analysis"
   ClientHeight    =   9360
   ClientLeft      =   2820
   ClientTop       =   1530
   ClientWidth     =   11115
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "MDIForm1"
   WindowState     =   2  'Maximized
   Begin MSComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   570
      Left            =   0
      TabIndex        =   2
      Top             =   570
      Visible         =   0   'False
      Width           =   11115
      _ExtentX        =   19606
      _ExtentY        =   1005
      ButtonWidth     =   1931
      ButtonHeight    =   953
      Appearance      =   1
      Style           =   1
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   11
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "2D"
            Key             =   "ind1"
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "3D"
            Key             =   "ind2"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Func Seq"
            Key             =   "ind3"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Func Series"
            Key             =   "ind4"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Fourier Series"
            Key             =   "ind5"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Weieres"
            Key             =   "ind6"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar tbToolBar 
      Align           =   1  'Align Top
      Height          =   570
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11115
      _ExtentX        =   19606
      _ExtentY        =   1005
      ButtonWidth     =   2143
      ButtonHeight    =   953
      Appearance      =   1
      Style           =   1
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   15
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Plotter"
            Key             =   "Arc"
            Object.ToolTipText     =   "Plot some king of functions"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Equation"
            Key             =   "Equation"
            Object.ToolTipText     =   "Equation solver f(x)=0"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Matrix"
            Key             =   "Mat"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Interpolation"
            Key             =   "Inter"
            Object.ToolTipText     =   "Sum"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Integral"
            Key             =   "Integral"
            Object.ToolTipText     =   "Word Underline"
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Number Theory"
            Key             =   "Num"
         EndProperty
         BeginProperty Button13 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button14 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button15 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "About me"
            Key             =   "About"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.StatusBar sbStatusBar 
      Align           =   2  'Align Bottom
      Height          =   270
      Left            =   0
      TabIndex        =   0
      Top             =   9090
      Width           =   11115
      _ExtentX        =   19606
      _ExtentY        =   476
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   3
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   13944
            Text            =   "Status"
            TextSave        =   "Status"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   6
            AutoSize        =   2
            TextSave        =   "1/10/2006"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            AutoSize        =   2
            TextSave        =   "10:02 PM"
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuFileNew 
         Caption         =   "&New"
         Shortcut        =   ^N
      End
      Begin VB.Menu mnuFileOpen 
         Caption         =   "&Open..."
         Shortcut        =   ^O
      End
      Begin VB.Menu mnuFileClose 
         Caption         =   "&Close"
      End
      Begin VB.Menu mnuFileBar0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileSave 
         Caption         =   "&Save"
      End
      Begin VB.Menu mnuFileSaveAs 
         Caption         =   "Save &As..."
      End
      Begin VB.Menu mnuFileSaveAll 
         Caption         =   "Save A&ll"
      End
      Begin VB.Menu mnuFileBar1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileProperties 
         Caption         =   "Propert&ies"
      End
      Begin VB.Menu mnuFileBar2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFilePageSetup 
         Caption         =   "Page Set&up..."
      End
      Begin VB.Menu mnuFilePrintPreview 
         Caption         =   "Print Pre&view"
      End
      Begin VB.Menu mnuFilePrint 
         Caption         =   "&Print..."
      End
      Begin VB.Menu mnuFileBar3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileSend 
         Caption         =   "Sen&d..."
      End
      Begin VB.Menu mnuFileBar4 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileMRU 
         Caption         =   ""
         Index           =   1
         Visible         =   0   'False
      End
      Begin VB.Menu mnuFileMRU 
         Caption         =   ""
         Index           =   2
         Visible         =   0   'False
      End
      Begin VB.Menu mnuFileMRU 
         Caption         =   ""
         Index           =   3
         Visible         =   0   'False
      End
      Begin VB.Menu mnuFileBar5 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuFileExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu mnuEdit 
      Caption         =   "&Edit"
      Begin VB.Menu mnuEditUndo 
         Caption         =   "&Undo"
      End
      Begin VB.Menu mnuEditBar0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuEditCut 
         Caption         =   "Cu&t"
         Shortcut        =   ^X
      End
      Begin VB.Menu mnuEditCopy 
         Caption         =   "&Copy"
         Shortcut        =   ^C
      End
      Begin VB.Menu mnuEditPaste 
         Caption         =   "&Paste"
         Shortcut        =   ^V
      End
      Begin VB.Menu mnuEditPasteSpecial 
         Caption         =   "Paste &Special..."
      End
   End
   Begin VB.Menu mnuView 
      Caption         =   "&View"
      Begin VB.Menu mnuViewToolbar 
         Caption         =   "&Toolbar"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuViewStatusBar 
         Caption         =   "Status &Bar"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuViewBar0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuViewRefresh 
         Caption         =   "&Refresh"
      End
      Begin VB.Menu mnuViewOptions 
         Caption         =   "&Options..."
      End
      Begin VB.Menu mnuViewWebBrowser 
         Caption         =   "&Web Browser"
      End
   End
   Begin VB.Menu mnuWindow 
      Caption         =   "&Window"
      WindowList      =   -1  'True
      Begin VB.Menu mnuWindowNewWindow 
         Caption         =   "&New Window"
      End
      Begin VB.Menu mnuWindowBar0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWindowCascade 
         Caption         =   "&Cascade"
      End
      Begin VB.Menu mnuWindowTileHorizontal 
         Caption         =   "Tile &Horizontal"
      End
      Begin VB.Menu mnuWindowTileVertical 
         Caption         =   "Tile &Vertical"
      End
      Begin VB.Menu mnuWindowArrangeIcons 
         Caption         =   "&Arrange Icons"
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "&Help"
      Begin VB.Menu mnuHelpContents 
         Caption         =   "&Contents"
      End
      Begin VB.Menu mnuHelpSearchForHelpOn 
         Caption         =   "&Search For Help On..."
      End
      Begin VB.Menu mnuHelpBar0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuHelpAbout 
         Caption         =   "&About "
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Any) As Long
Const EM_UNDO = &HC7
'Private Sub LoadNewDoc()
'    Static lDocumentCount As Long
'    Dim frmD As frmDocument
'    lDocumentCount = lDocumentCount + 1
'    Set frmD = New frmDocument
'    frmD.Caption = "Document " & lDocumentCount
'    frmD.Show
'End Sub
'
'Private Sub MDIForm_Load()
'
'End Sub

Private Sub tbToolBar_ButtonClick(ByVal Button As MSComctlLib.Button)
    On Error Resume Next
    Select Case Button.Key
        Case "Num"
            Toolbar1.Buttons.Item(1).Caption = ""
            Toolbar1.Buttons.Item(3).Caption = ""
            Toolbar1.Buttons.Item(5).Caption = ""
            Toolbar1.Buttons.Item(7).Caption = ""
            Toolbar1.Buttons.Item(9).Caption = "One Variable"
            Toolbar1.Buttons.Item(11).Caption = "2 Variable"
            Toolbar1.Visible = True
        Case "Integral"
            Toolbar1.Visible = False
            Dim F1 As New frmIntegral
            F1.Show
        Case "Inter"
            Toolbar1.Visible = False
            Dim F2 As New frmInterpol
            F2.Show
        Case "Mat"
            Toolbar1.Visible = False
            Dim FM As New frmMat
            FM.Show
        Case "Equation"
            Toolbar1.Buttons.Item(1).Caption = "One Variable"
            Toolbar1.Buttons.Item(3).Caption = "2 Variable"
            Toolbar1.Buttons.Item(5).Caption = ""
            Toolbar1.Buttons.Item(7).Caption = ""
            Toolbar1.Buttons.Item(9).Caption = ""
            Toolbar1.Buttons.Item(11).Caption = ""
            Toolbar1.Visible = True
        Case "Arc"
            Toolbar1.Buttons.Item(1).Caption = "2D Func"
            Toolbar1.Buttons.Item(3).Caption = "3D Func"
            Toolbar1.Buttons.Item(5).Caption = "Func Sequence"
            Toolbar1.Buttons.Item(7).Caption = "Func Series"
            Toolbar1.Buttons.Item(9).Caption = "Fourier Series"
            Toolbar1.Buttons.Item(11).Caption = "Weieres Func"
            Toolbar1.Visible = True
        Case "About"
            mnuHelpAbout_Click
    End Select
End Sub

Private Sub mnuHelpAbout_Click()
    MsgBox "Written by Mohsen Ali Momeni" & vbCrLf & "m.alimomeni@gmail.com" & _
    vbCrLf & vbCr & "www.momeni.us.tc"
End Sub

Private Sub mnuHelpSearchForHelpOn_Click()
    Dim nRet As Integer


    'if there is no helpfile for this project display a message to the user
    'you can set the HelpFile for your application in the
    'Project Properties dialog
    If Len(App.HelpFile) = 0 Then
        MsgBox "Unable to display Help Contents. There is no Help associated with this project.", vbInformation, Me.Caption
    Else
        On Error Resume Next
        'nRet = OSWinHelp(Me.hwnd, App.HelpFile, 261, 0)
        If Err Then
            MsgBox Err.Description
        End If
    End If

End Sub

Private Sub mnuHelpContents_Click()
    Dim nRet As Integer


    'if there is no helpfile for this project display a message to the user
    'you can set the HelpFile for your application in the
    'Project Properties dialog
    If Len(App.HelpFile) = 0 Then
        MsgBox "Unable to display Help Contents. There is no Help associated with this project.", vbInformation, Me.Caption
    Else
        On Error Resume Next
        'nRet = OSWinHelp(Me.hwnd, App.HelpFile, 3, 0)
        If Err Then
            MsgBox Err.Description
        End If
    End If

End Sub


Private Sub mnuWindowArrangeIcons_Click()
    Me.Arrange vbArrangeIcons
End Sub

Private Sub mnuWindowTileVertical_Click()
    Me.Arrange vbTileVertical
End Sub

Private Sub mnuWindowTileHorizontal_Click()
    Me.Arrange vbTileHorizontal
End Sub

Private Sub mnuWindowCascade_Click()
    Me.Arrange vbCascade
End Sub

'Private Sub mnuWindowNewWindow_Click()
'    LoadNewDoc
'End Sub
'
'Private Sub mnuViewWebBrowser_Click()
'    'ToDo: Add 'mnuViewWebBrowser_Click' code.
'    MsgBox "Add 'mnuViewWebBrowser_Click' code."
'End Sub
'
'Private Sub mnuViewOptions_Click()
'    frmOptions.Show vbModal, Me
'End Sub
'
'Private Sub mnuViewRefresh_Click()
'    'ToDo: Add 'mnuViewRefresh_Click' code.
'    MsgBox "Add 'mnuViewRefresh_Click' code."
'End Sub

Private Sub mnuViewStatusBar_Click()
    mnuViewStatusBar.Checked = Not mnuViewStatusBar.Checked
    sbStatusBar.Visible = mnuViewStatusBar.Checked
End Sub

Private Sub mnuViewToolbar_Click()
    mnuViewToolbar.Checked = Not mnuViewToolbar.Checked
    tbToolBar.Visible = mnuViewToolbar.Checked
End Sub
'
'Private Sub mnuEditPasteSpecial_Click()
'    'ToDo: Add 'mnuEditPasteSpecial_Click' code.
'    MsgBox "Add 'mnuEditPasteSpecial_Click' code."
'End Sub
'
'Private Sub mnuEditPaste_Click()
'    On Error Resume Next
'    ActiveForm.rtfText.SelRTF = Clipboard.GetText
'
'End Sub
'
'Private Sub mnuEditCopy_Click()
'    On Error Resume Next
'    Clipboard.SetText ActiveForm.rtfText.SelRTF
'
'End Sub
'
'Private Sub mnuEditCut_Click()
'    On Error Resume Next
'    Clipboard.SetText ActiveForm.rtfText.SelRTF
'    ActiveForm.rtfText.SelText = vbNullString
'
'End Sub
'
'Private Sub mnuEditUndo_Click()
'    'ToDo: Add 'mnuEditUndo_Click' code.
'    MsgBox "Add 'mnuEditUndo_Click' code."
'End Sub


Private Sub mnuFileExit_Click()
    'unload the form
    Unload Me

End Sub

'Private Sub mnuFileSend_Click()
'    'ToDo: Add 'mnuFileSend_Click' code.
'    MsgBox "Add 'mnuFileSend_Click' code."
'End Sub

'Private Sub mnuFilePrint_Click()
'    On Error Resume Next
'    If ActiveForm Is Nothing Then Exit Sub
'
'
'    With dlgCommonDialog
'        .DialogTitle = "Print"
'        .CancelError = True
'        .Flags = cdlPDReturnDC + cdlPDNoPageNums
'        If ActiveForm.rtfText.SelLength = 0 Then
'            .Flags = .Flags + cdlPDAllPages
'        Else
'            .Flags = .Flags + cdlPDSelection
'        End If
'        .ShowPrinter
'        If Err <> MSComDlg.cdlCancel Then
'            ActiveForm.rtfText.SelPrint .hDC
'        End If
'    End With
'
'End Sub
'
'Private Sub mnuFilePrintPreview_Click()
'    'ToDo: Add 'mnuFilePrintPreview_Click' code.
'    MsgBox "Add 'mnuFilePrintPreview_Click' code."
'End Sub
'
'Private Sub mnuFilePageSetup_Click()
'    On Error Resume Next
'    With dlgCommonDialog
'        .DialogTitle = "Page Setup"
'        .CancelError = True
'        .ShowPrinter
'    End With
'
'End Sub
'
'Private Sub mnuFileProperties_Click()
'    'ToDo: Add 'mnuFileProperties_Click' code.
'    MsgBox "Add 'mnuFileProperties_Click' code."
'End Sub
'
'Private Sub mnuFileSaveAll_Click()
'    'ToDo: Add 'mnuFileSaveAll_Click' code.
'    MsgBox "Add 'mnuFileSaveAll_Click' code."
'End Sub
'
'Private Sub mnuFileSaveAs_Click()
'    Dim sFile As String
'
'
'    If ActiveForm Is Nothing Then Exit Sub
'
'
'    With dlgCommonDialog
'        .DialogTitle = "Save As"
'        .CancelError = False
'        'ToDo: set the flags and attributes of the common dialog control
'        .Filter = "All Files (*.*)|*.*"
'        .ShowSave
'        If Len(.FileName) = 0 Then
'            Exit Sub
'        End If
'        sFile = .FileName
'    End With
'    ActiveForm.Caption = sFile
'    ActiveForm.rtfText.SaveFile sFile
'
'End Sub
'
'Private Sub mnuFileSave_Click()
'    Dim sFile As String
'    If Left$(ActiveForm.Caption, 8) = "Document" Then
'        With dlgCommonDialog
'            .DialogTitle = "Save"
'            .CancelError = False
'            'ToDo: set the flags and attributes of the common dialog control
'            .Filter = "All Files (*.*)|*.*"
'            .ShowSave
'            If Len(.FileName) = 0 Then
'                Exit Sub
'            End If
'            sFile = .FileName
'        End With
'        ActiveForm.rtfText.SaveFile sFile
'    Else
'        sFile = ActiveForm.Caption
'        ActiveForm.rtfText.SaveFile sFile
'    End If
'
'End Sub
'
'Private Sub mnuFileClose_Click()
'    'ToDo: Add 'mnuFileClose_Click' code.
'    MsgBox "Add 'mnuFileClose_Click' code."
'End Sub
'
'Private Sub mnuFileOpen_Click()
'    Dim sFile As String
'
'
'    If ActiveForm Is Nothing Then LoadNewDoc
'
'
'    With dlgCommonDialog
'        .DialogTitle = "Open"
'        .CancelError = False
'        'ToDo: set the flags and attributes of the common dialog control
'        .Filter = "All Files (*.*)|*.*"
'        .ShowOpen
'        If Len(.FileName) = 0 Then
'            Exit Sub
'        End If
'        sFile = .FileName
'    End With
'    ActiveForm.rtfText.LoadFile sFile
'    ActiveForm.Caption = sFile
'
'End Sub
'
'Private Sub mnuFileNew_Click()
'    LoadNewDoc
'End Sub
'
Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)
Select Case Button.Key
        Case "ind1"
          If Button.Caption Like "2D*" Then
            Dim Fr1 As New frmGraph
            Fr1.Show
          Else
            Dim Fr2 As New frmEqSolv
            Fr2.Show
          End If
        Case "ind2"
          If Button.Caption Like "3D*" Then
            Dim Fr3 As New frmGraph3D
            Fr3.Show
          Else
            Dim Fr4 As New frmEqdg2
            Fr4.Show
          End If
        Case "ind3"
          If Button.Caption <> "" Then
            Dim Fr5 As New frmGraphSeq
            Fr5.Show
          Else
          End If
        Case "ind4"
          If Button.Caption <> "" Then
            Dim Fr6 As New frmGraphFuncF
            Fr6.Show
          End If
        Case "ind5"
          If Button.Caption <> "" Then
            Dim Fr7 As New frmGraphFunc
            Fr7.Show
          End If
        Case "ind6"
          If Button.Caption <> "" Then
            Dim Fr8 As New frmGraphWeie
            Fr8.Show
          End If
End Select
Toolbar1.Visible = False
End Sub
