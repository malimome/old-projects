Attribute VB_Name = "Module1"
Public ErrorInfo As Integer
Public Function Parser(Code, X, Y)
  Dim p As Integer
  Dim Ch As String
  Dim m As Integer
  Dim BracketCounter As Integer
  Dim Length As Integer
  Dim Blength As Integer
  Dim Bstart As Integer
  Dim Bend As Integer
  Dim Operation As Integer
  ReDim B(1 To 100)
  ErrorInfo = 0

  Code = UCase("(" + Code + ")")
  
  m = 1
  p = 1
  Do

     Ch = Mid(Code, p, 1)
     Select Case Ch
      
         Case "A" To "Z"
            Do While Ch Like "[A-Z]"
               B(m) = B(m) + Ch
               p = p + 1
               Ch = Mid(Code, p, 1)
            Loop
            If B(m) = "X" Then B(m) = X
            If B(m) = "Y" Then B(m) = Y
            m = m + 1

         
         Case "0" To "9", "."
            Flag = 0
            Do While Ch Like "[0-9.]"
               If Ch = "." Then Flag = Flag + 1: If Flag > 1 Then ErrorInfo = -1: Exit Function
               B(m) = B(m) + Ch
               p = p + 1
               Ch = Mid(Code, p, 1)
            Loop
            B(m) = Val(B(m))
            m = m + 1

                 
         Case "^", "*", "/", "(", ")"
            B(m) = Ch
            If B(m) = "(" Then BracketCounter = BracketCounter + 1
            If B(m) = ")" Then BracketCounter = BracketCounter - 1
            p = p + 1
            m = m + 1
         
         
         Case "-"
            If B(m - 1) = "+" Or B(m - 1) = "-" Or B(m - 1) = "^" Or B(m - 1) = "*" Or B(m - 1) = "/" Or B(m - 1) = "(" Or B(m - 1) = "MOD" Then
               B(m) = "NEG"
            Else
               B(m) = "-"
            End If
            p = p + 1
            m = m + 1
                       
                       
         Case "+"
             If B(m - 1) <> "+" And B(m - 1) <> "-" And B(m - 1) <> "^" And B(m - 1) <> "*" And B(m - 1) <> "/" And B(m - 1) <> "(" And B(m - 1) <> "MOD" Then
                B(m) = "+"
                m = m + 1
             End If
             p = p + 1
        
         Case " "
             p = p + 1
            
         Case Else
             ErrorInfo = -1: Exit Function
        
     End Select

  Loop Until p > Len(Code)
  If BracketCounter <> 0 Then ErrorInfo = -1: Exit Function
  Blength = m - 1



  
  Do
      For p = 1 To Blength
         If B(p) = "(" Then Bstart = p
         If B(p) = ")" Then Bend = p: Exit For
      Next
    
      On Error Resume Next
      For Operation = 1 To 6
 
           m = Bstart
           Do
          
                 Length = 0
                 Select Case Operation
           
                      Case 1
                            If B(m) = "SIN" Then
                                If Check(B(m + 1)) Then ErrorInfo = -1: Exit Function
                                B(m) = Sin(B(m + 1))
                                Length = 1
                            End If
   
                            If B(m) = "COS" Then
                                If Check(B(m + 1)) Then ErrorInfo = -1: Exit Function
                                B(m) = Cos(B(m + 1))
                                Length = 1
                            End If
     
                            If B(m) = "TAN" Then
                                If Check(B(m + 1)) Then ErrorInfo = -1: Exit Function
                                B(m) = Tan(B(m + 1))
                                Length = 1
                            End If

                            If B(m) = "ATN" Then
                                If Check(B(m + 1)) Then ErrorInfo = -1: Exit Function
                                B(m) = Atn(B(m + 1))
                                Length = 1
                            End If
      
                            If B(m) = "EXP" Then
                                If Check(B(m + 1)) Then ErrorInfo = -1: Exit Function
                                B(m) = Exp(B(m + 1))
                                Length = 1
                            End If
     
                            If B(m) = "LOG" Then
                                If Check(B(m + 1)) Then ErrorInfo = -1: Exit Function
                                B(m) = Log(B(m + 1))
                                Length = 1
                            End If
      
                            If B(m) = "RND" Then
                                If Check(B(m + 1)) Then ErrorInfo = -1: Exit Function
                                B(m) = Rnd(B(m + 1))
                                Length = 1
                            End If
      
                            If B(m) = "SGN" Then
                                If Check(B(m + 1)) Then ErrorInfo = -1: Exit Function
                                B(m) = Sgn(B(m + 1))
                                Length = 1
                            End If
      
                            If B(m) = "SQR" Then
                                If Check(B(m + 1)) Then ErrorInfo = -1: Exit Function
                                B(m) = Sqr(B(m + 1))
                                Length = 1
                            End If
      
                            If B(m) = "INT" Then
                                If Check(B(m + 1)) Then ErrorInfo = -1: Exit Function
                                B(m) = Int(B(m + 1))
                                Length = 1
                            End If
      
                            If B(m) = "ABS" Then
                                If Check(B(m + 1)) Then ErrorInfo = -1: Exit Function
                                B(m) = Abs(B(m + 1))
                                Length = 1
                            End If
           
                      Case 2
                            If B(m) = "^" Then
                                If B(m + 1) = "NEG" Then
                                    If Check(B(m - 1)) Or Check(B(m + 2)) Then ErrorInfo = -1: Exit Function
                                    B(m - 1) = B(m - 1) ^ -B(m + 2)
                                    Length = 3
                                Else
                                    If Check(B(m - 1)) Or Check(B(m + 1)) Then ErrorInfo = -1: Exit Function
                                    B(m - 1) = B(m - 1) ^ B(m + 1)
                                    Length = 2
                                End If
                            End If
                            
                      Case 3
                            If B(m) = "NEG" Then
                                If Check(B(m + 1)) Then ErrorInfo = -1: Exit Function
                                B(m) = -(B(m + 1))
                                Length = 1
                            End If

                      Case 4
                            If B(m) = "*" Then
                                If Check(B(m - 1)) Or Check(B(m + 1)) Then ErrorInfo = -1: Exit Function
                                B(m - 1) = B(m - 1) * B(m + 1)
                                Length = 2
                            End If
            
                            If B(m) = "/" Then
                                If Check(B(m - 1)) Or Check(B(m + 1)) Then ErrorInfo = -1: Exit Function
                                B(m - 1) = B(m - 1) / B(m + 1)
                                Length = 2
                            End If

                      Case 5
                            If B(m) = "MOD" Then
                                If Check(B(m - 1)) Or Check(B(m + 1)) Then ErrorInfo = -1: Exit Function
                                B(m - 1) = B(m - 1) Mod B(m + 1)
                                Length = 2
                            End If

                      Case 6
                            If B(m) = "+" Then
                                If Check(B(m - 1)) Or Check(B(m + 1)) Then ErrorInfo = -1: Exit Function
                                B(m - 1) = B(m - 1) + B(m + 1)
                                Length = 2
                            End If
           
                            If B(m) = "-" Then
                                If Check(B(m - 1)) Or Check(B(m + 1)) Then ErrorInfo = -1: Exit Function
                                B(m - 1) = B(m - 1) - B(m + 1)
                                Length = 2
                            End If

                 End Select
       
                 If Length <> 0 Then
                     If Length = 1 Then Position = m + 1
                     If Length = 2 Or Length = 3 Then Position = m
                     For p = Position To Blength
                         B(p) = B(p + Length)
                     Next
                     Blength = Blength - Length
                     Bend = Bend - Length
                     m = m - Length
                 End If
       
                 m = m + 1

                 If Err.Number <> 0 Then
                     If Check(B(m)) Then B(m) = 0
                     ErrorInfo = Err.Number
                     Err.Clear
                 End If

           Loop While m <= Bend
      
      Next
      If Bend - Bstart > 2 Or Check(B(Bstart + 1)) Then ErrorInfo = -1: Exit Function
      B(Bstart) = B(Bstart + 1)
      For p = Bstart + 1 To Blength
         B(p) = B(p + 2)
      Next
      Blength = Blength - 2
      'Bend = Bend - 2
  
  Loop While Blength > 1
  Parser = B(1)

End Function
Function Check(TestData As Variant) As Boolean
 Check = True
 Select Case TypeName(TestData)
   Case "Integer", "Long", "Single", "Double", "Currency", "Decimal": Check = False
 End Select
End Function













