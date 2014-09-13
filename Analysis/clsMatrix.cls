VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsMatrix"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Option Base 1
Dim Row As Integer, Col As Integer
Public Function Deteminent(ByRef Mat() As Single) As Single
    Dim i As Integer, j As Integer, f As Integer, s As Integer, g As Integer, n As Integer
    n = UBound(Mat, 1)
    Dim Diam As Single
    Dim t As Single, e As Double
    Dim mul As Double: mul = 1
    
    f = 1
    While (f <= n)
        'change the rows if Mat(f)(f)=0
        s = 1
        While (Mat(f, f) = 0)
            For i = 1 To n
                t = Mat(f, i)
                Mat(f, i) = Mat(f + s, i)
                Mat(f + s, i) = t
            Next i
            'because when we change position of 2 rows ,multiply determinan in -1
            For j = 1 To n
                Mat(f + s, j) = -Mat(f + s, j)
            Next j
            s = s + 1
        Wend

        'b(f) = Mat(f, f)
        Diam = Mat(f, f)
        'Mat(f)(f)=1
        For j = 1 To n
            Mat(f, j) = Mat(f, j) / Diam
        Next j
        mul = mul * Diam
        
        g = f
        While (g < n)
            Dim Temp As Double
            Temp = -Mat(g + 1, f)
            For i = 1 To n
                Mat(g + 1, i) = Temp * Mat(f, i) + Mat(g + 1, i)
            Next i
            g = g + 1
        Wend
        f = f + 1
    Wend
    
    mul = mul * Mat(n - 1, n - 1)
    Deteminent = mul
End Function
Public Function MatInverse(ByRef Mat() As Single, InvMat() As Single)

End Function
Public Function MatTranspose(ByRef Mat() As Single) As Long

End Function
Public Function NxN_Equation(Mat() As Single, B() As Single, ByRef X() As Single) As Long
    Dim i As Integer, j As Integer, f As Integer, s As Integer, g As Integer, n As Integer
    n = UBound(Mat, 1)
    Dim Diam As Single
    Dim t As Single
    Dim Seq As Double: Seq = 0
    
    f = 1
    While (f <= n)
        'change the rows if Mat(f)(f)=0
        s = 1
        While (Mat(f, f) = 0)
            For i = 1 To n
                t = Mat(f, i)
                Mat(f, i) = Mat(f + s, i)
                Mat(f + s, i) = t
                t = B(f)
                B(f) = B(f + s)
                B(f + s) = t
            Next i
            'because when we change position of 2 rows ,multiply determinan in -1
            For j = 1 To n
                Mat(f + s, j) = -Mat(f + s, j)
                B(f + s) = -B(f + s)
            Next j
            s = s + 1
        Wend

        'b(f) = Mat(f, f)
        Diam = Mat(f, f)
        'Mat(f)(f)=1
        For j = 1 To n
            Mat(f, j) = Mat(f, j) / Diam
            B(f) = B(f) / Diam
        Next j
'        mul = mul * Diam
        
        g = f
        While (g < n)
            Dim Temp As Double
            Temp = -Mat(g + 1, f)
            For i = 1 To n
                Mat(g + 1, i) = Temp * Mat(f, i) + Mat(g + 1, i)
                B(g + 1) = Temp * B(f) + B(g + 1)
            Next i
            g = g + 1
        Wend
        f = f + 1
    Wend
    
    ReDim X(1 To n)
    X(n) = B(n) / Mat(n, n)
    
    For i = n - 1 To 1 Step -1
        For j = n To i Step -1
            Seq = Seq + X(j) * Mat(i, j)
        Next j
        X(i) = (B(i) - Seq) / Mat(i, i)
    Next i
End Function
Public Function MatMultip(ByRef Mat1() As Single, ByRef Mat2() As Single, ByRef ReMat() As Single) As Long
Dim Sum As Single
Dim i As Integer, j As Integer, k As Integer
Dim r As Integer, C As Integer, M As Integer

M = UBound(Mat1, 2)
If M = UBound(Mat2, 1) Then
    r = UBound(Mat1, 1)
    C = UBound(Mat2, 2)
Else
    Exit Function
End If
ReDim ReMat(1 To r, 1 To C)
 ''''''''''''''''''''writing the answer'''''''''''''''''''''
For i = 1 To r
  For j = 1 To C
    Sum = 0
    For k = 1 To M
      Sum = Sum + Mat1(i, k) * Mat2(k, j)
    Next k
    ReMat(i, j) = Sum
  Next j
Next i
End Function
Public Function MatAddition(ByRef Mat1() As Single, ByRef Mat2() As Single, ByRef ReMat() As Single) As Long
Dim Sum As Single
Dim i As Integer, j As Integer, k As Integer
Dim r As Integer, C As Integer

r = UBound(Mat1, 1)
If r <> UBound(Mat2, 1) Then Exit Function
C = UBound(Mat1, 2)
If C <> UBound(Mat2, 2) Then Exit Function

ReDim ReMat(1 To r, 1 To C)
 ''''''''''''''''''''writing the answer'''''''''''''''''''''
For i = 1 To r
  For j = 1 To C
       ReMat(i, j) = Mat1(i, j) + Mat2(i, j)
  Next j
Next i
End Function
Public Function ToString(ByRef Mat() As Single) As String
Dim Ret As String
Dim i As Integer, j As Integer

On Error GoTo Err
For i = 1 To UBound(Mat, 1)
    For j = 1 To UBound(Mat, 2)
        If j <> 1 Then Ret = Ret & ","
        Ret = Ret & Mat(i, j)
    Next j
    Ret = Ret & "/"
Next i
ToString = "[" & Left$(Ret, Len(Ret) - 1) & "]"
On Error GoTo 0
Exit Function
Err:
For i = 1 To UBound(Mat, 1)
    If i <> 1 Then Ret = Ret & ","
    Ret = Ret & Mat(i)
Next i
ToString = "[" & Left$(Ret, Len(Ret) - 1) & "]"
End Function
Public Function VecToString(ByRef X() As Single) As String
Dim Ret As String
Dim i As Integer, j As Integer

For i = 1 To UBound(X)
        If i <> 1 Then Ret = Ret & ","
        Ret = Ret & X(i)
Next i
VecToString = "[" & Left$(Ret, Len(Ret) - 1) & "]"
End Function
Private Sub GetDim(ByRef M As String)
    Dim ArrayRow() As String, ArrayCol() As String, curCol As Integer
    Dim First As Boolean, i As Integer
    First = True
    ArrayRow = Split(M, "/")
    
    Row = UBound(ArrayRow)
    For i = 0 To Row
        ArrayCol = Split(ArrayRow(i), ",")
        If First Then
            curCol = UBound(ArrayCol)
            First = False
        Else
            If curCol <> UBound(ArrayCol) Then
                'error
            End If
        End If
        Erase ArrayCol
    Next i
    Erase ArrayRow
    Col = curCol + 1
    Row = Row + 1
End Sub
Private Sub FormatStr(ByRef M As String)
    M = Trim$(M)
    M = Replace$(M, "  ", " ")
    M = Replace$(M, "\", "/")
    M = Replace$(M, ";", "/")
    M = Replace$(M, "/ ", "/")
    M = Replace$(M, " /", "/")
    M = Replace$(M, " ]", "]")
    M = Replace$(M, "[ ", "[")
    M = Replace$(M, " [", "[")
    M = Replace$(M, " ", ",")
    M = Replace$(M, ",,", ",")
End Sub
Public Function StrToMatrix(strMat As String, ByRef Matrix() As Single) As Long
'    If Right$(strMat, 1) <> "]" Then GoTo errorhandler
'    If Left$(strMat, 1) <> "[" Then GoTo errorhandler
    Dim Mat As String
    Mat = strMat
    Call FormatStr(Mat)
    Call GetDim(Mat)
    ReDim Matrix(1 To Row, 1 To Col)
    
    ''''''''''''''''''''''Puting Numbers in variables'''''''''''''''
    Dim byti As Integer, bytj As Integer, i As Long
    Dim intholder As Long
    intholder = 1: byti = 1: bytj = 1
    
    For i = 1 To Len(Mat)
  
        Select Case Mid$(Mat, i, 1)
          Case ",":
              Matrix(byti, bytj) = CSng(Val(Mid(Mat, 1 + intholder, i - intholder)))
              bytj = bytj + 1: intholder = i
           
         Case "/":
              Matrix(byti, bytj) = CSng(Val(Mid(Mat, 1 + intholder, i - intholder - 1)))
              bytj = bytj + 1: intholder = i: byti = byti + 1: bytj = 1
            
          Case "]":
               Matrix(byti, bytj) = CSng(Val(Mid(Mat, 1 + intholder, i - intholder - 1)))
               bytj = bytj + 1: intholder = i: Exit For
            
        End Select
    Next i
End Function
Public Function StrToVector(strMat As String, ByRef Vect() As Single) As Long
'    If Right$(strMat, 1) <> "]" Then GoTo errorhandler
'    If Left$(strMat, 1) <> "[" Then GoTo errorhandler
    Dim Mat As String
    Mat = Mid$(strMat, 2, Len(strMat) - 2)
    Call FormatStr(Mat)
    Dim r As Integer, i As Integer
    Dim B As Variant
    B = Split(Mat, ",")
    r = UBound(B) + 1
    ReDim Vect(1 To r)
    
    For i = 1 To r
        Vect(i) = Val(B(i - 1))
    Next i
End Function
'Public Function Det(Mat() As Single) As Double
'    Dim n As Integer, Coef As Integer
'    Dim i As Integer, j As Integer, f As Integer, s As Integer, g As Integer
'    Coef = 1
'
'    n = UBound(Mat, 1)
'    If n <> UBound(Mat, 2) Then Exit Function
'
'    For i = 1 To n
'        If Mat(i, i) = 0 Then
'            Coef = -Coef
'            ChangeRows Mat(), i, i + 1
'        End If
'    Next i
'
'    For j = 1 To n - 1
'        For i = j + 1 To n
'            RowManip Mat(), i, 1, -Mat(i, j) / Mat(1, j)
'        Next i
'    Next j
'
'    Det = 1
'    For i = 1 To n
'        Det = Det * Mat(i, i)
'    Next i
'
'    Det = Coef * Det
'End Function
Private Sub ChangeRows(ByRef Mat() As Single, Rowi As Integer, Rowj As Integer)
Dim n As Integer, i As Integer, Temp As Single
n = UBound(Mat, 1)
Rowj = Rowj Mod n

For i = 1 To n
    Temp = Mat(Rowi, i)
    Mat(Rowi, i) = Mat(Rowj, i)
    Mat(Rowj, i) = Temp
Next i

End Sub
Private Sub RowManip(ByRef Mat() As Single, Rowi As Integer, Rowj As Integer, CoefJ As Single)
Dim i As Integer
For i = 1 To UBound(Mat, 1)
    Mat(Rowj, i) = CoefJ * Mat(Rowj, i)
    Mat(Rowi, i) = Mat(Rowi, i) + Mat(Rowj, i)
Next i
End Sub
Private Sub RowScalerMultip(ByRef Mat() As Single, Rowi As Integer, CoefJ As Single)
Dim i As Integer
For i = 1 To UBound(Mat, 1)
    Mat(Rowi, i) = CoefJ * Mat(Rowi, i)
Next i
End Sub
'    Dim i As Integer, j As Integer, f As Integer, s As Integer, g As Integer, n As Integer
'    n = UBound(Mat, 1)
'    Dim b() As Single
'    ReDim b(1 To n)
'    Dim t As Single
'    Dim e As Double
'    f = 1
'    While (f <= n)
'        'change the rows if Mat(f)(f)=0
'        s = 1
'        While (Mat(f, f) = 0)
'            For i = 1 To n
'                t = Mat(f, i)
'                Mat(f, i) = Mat(f + s, i)
'                Mat(f + s, i) = t
'            Next i
'            'because when we change position of 2 rows ,multiply determinan in -1
'            For j = 1 To n
'                Mat(f + s, j) = -Mat(f + s, j)
'            Next j
'            s = s + 1
'        Wend
'
'        b(f) = Mat(f, f)
'        'Mat(f)(f)=1
'        For j = 1 To n
'            Mat(f, j) = Mat(f, j) / b(f)
'        Next j
'
'        g = f
'        While (g < n)
'            Dim Temp As Double
'            Temp = -Mat(g + 1, f)
'            For i = 1 To n
'                Mat(g + 1, i) = Temp * Mat(f, i) + Mat(g + 1, i)
'            Next i
'            g = g + 1
'        Wend
'        f = f + 1
'    Wend


