Attribute VB_Name = "Misc"
Public Function Fact(n As Integer) As Long
Dim Ret As Long, i As Integer
Ret = 1
If n < 0 Then
    Exit Function
ElseIf n = 0 Then Exit Function
Else
    For i = 1 To n
        Ret = Ret * i
    Next i
End If
Fact = Ret
End Function
Public Function rFn1(n As Integer, r As Integer) As Long
    rFn1 = Fact(n) / (Fact(r) * Fact(n - r))
End Function
Public Function Minim(i As Integer, k As Integer) As Long
If (i > k) Then
  Minim = k
Else
  Minim = i
End If
End Function

Public Function rFn(n As Integer, r As Integer) As Long
  Dim i As Integer, j As Integer
  Dim B(n, k) As Long
  For i = 0 To n
    For j = 0 To Minim(i, k)
      If (j = 0 Or i = j) Then
        B(i, j) = 1
      Else
        B(i, j) = B(i - 1, j - 1) + B(i - 1, j)
      End If
    Next j
  Next i
  rFn = B(n, k)
End Function
