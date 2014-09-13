Attribute VB_Name = "Mdl_XPDatePicker"
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
'* Mdl_XPDatePicker.bas : Defines some of the global variables used in project.
'* This file is part of the PDTPicker - Persian Date Picker.
'******************************************************************************

Option Explicit
Public Declare Function EnableWindow Lib "user32" (ByVal hwnd As Long, ByVal fEnable As Long) As Long

Public ResultDate As String
Public InitDate As String
Public Ftoday As String
Public CntHwnd As Long
Public Chosen As Boolean
Public Non_Modal As Boolean
Public YR As Integer
'Public DtFormat As String
Public FormBKC As OLE_COLOR
Public m_SFM As Boolean
Public m_FontB As Boolean

Public Const ErrorResume As Boolean = False

'if ErrorResume then on error resume next
'
'Private Declare Function Process32First Lib "kernel32" (ByVal hSnapShot As Long, lppe As PROCESSENTRY32) As Long
'Private Declare Function Process32Next Lib "kernel32" (ByVal hSnapShot As Long, lppe As PROCESSENTRY32) As Long
'Private Declare Function CloseHandle Lib "Kernel32.dll" (ByVal Handle As Long) As Long
'Private Declare Function OpenProcess Lib "Kernel32.dll" (ByVal dwDesiredAccessas As Long, ByVal bInheritHandle As Long, ByVal dwProcId As Long) As Long
'Private Declare Function CreateToolhelp32Snapshot Lib "kernel32" (ByVal lFlags As Long, ByVal lProcessID As Long) As Long
'Private Declare Function GetWindowThreadProcessId Lib "user32" (ByVal hWnd As Long, lpdwProcessId As Long) As Long
'
'Private Const WTS_CURRENT_SERVER_HANDLE = 0&
'
'Private Const PROCESS_QUERY_INFORMATION = 1024
'Private Const PROCESS_VM_READ = 16
'Private Const MAX_PATH = 260
'Private Const STANDARD_RIGHTS_REQUIRED = &HF0000
'Private Const SYNCHRONIZE = &H100000
'Private Const PROCESS_ALL_ACCESS = &H1F0FFF
'Private Const hNull = 0
'Private Const WIN95_System_Found = 1
'Private Const WINNT_System_Found = 2
'Private Const Default_Log_Size = 10000000
'Private Const Default_Log_Days = 0
'Private Const SPECIFIC_RIGHTS_ALL = &HFFFF
'Private Const STANDARD_RIGHTS_ALL = &H1F0000
'
'Private Const TH32CS_SNAPHEAPLIST = &H1
'Private Const TH32CS_SNAPPROCESS = &H2
'Private Const TH32CS_SNAPTHREAD = &H4
'Private Const TH32CS_SNAPMODULE = &H8
'Private Const TH32CS_SNAPALL = (TH32CS_SNAPHEAPLIST Or TH32CS_SNAPPROCESS Or TH32CS_SNAPTHREAD Or TH32CS_SNAPMODULE)
'Private Const TH32CS_INHERIT = &H80000000
'
'Private Type PROCESSENTRY32
'    dwSize As Long
'    cntUsage As Long
'    th32ProcessID As Long ' This process
'    th32DefaultHeapID As Long
'    th32ModuleID As Long ' Associated exe
'    cntThreads As Long
'    th32ParentProcessID As Long ' This process's parent process
'    pcPriClassBase As Long ' Base priority of process threads
'    dwFlags As Long
'    szExeFile As String * 260 ' MAX_PATH
'End Type
'Public Function ProcessIDhwnd(ByVal hWnd As Long) As Long
' Dim ThreadID As Long, ProcessID As Long  ' receive id to thread and process of Form1
'    ' Determine the thread which owns this window
' ThreadID = GetWindowThreadProcessId(hWnd, ProcessID)
' ProcessIDhwnd = ProcessID
'End Function
'Public Function GetExename(ProcID As Long) As String
'    Dim hSnapShot As Long, uProcess As PROCESSENTRY32, R As Long, Prc As String
'    'Takes a snapshot of the processes and the heaps, modules, and threads used by the processes
'    hSnapShot = CreateToolhelp32Snapshot(TH32CS_SNAPALL, 0&)
'    'set the length of our ProcessEntry-type
'    uProcess.dwSize = Len(uProcess)
'    'Retrieve information about the first process encountered in our system snapshot
'    R = Process32First(hSnapShot, uProcess)
'    'set graphics mode to persistent
'    Do While R
'        Prc = Left$(uProcess.szExeFile, IIf(InStr(1, uProcess.szExeFile, Chr$(0)) > 0, InStr(1, uProcess.szExeFile, Chr$(0)) - 1, 0))
'        'Retrieve information about the next process recorded in our system snapshot
'        '.th32ProcessID
'        If ProcID = uProcess.th32ProcessID Then GetExename = LCase$(Prc): Exit Function
'        R = Process32Next(hSnapShot, uProcess)
'    Loop
'    'close our snapshot handle
'    CloseHandle hSnapShot
'    GetExename = vbNullString
'End Function
'
'
'
''Public Function GetDateSys() As String
''    GetDateSys = DateSys(Date)
''End Function
''
''Public Function DateSys(StrDate As String) As String
'' On Error GoTo errsystems
''        DateSys = Format(StrDate, "yyyy") & "/" & Format(StrDate, "mm") & "/" & Format(StrDate, "dd")
''errsystems:
''End Function
'
''Sub main()
''    Load FrmCalender 'MyForm
''End Sub
