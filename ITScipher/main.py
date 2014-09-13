from cipher import *

c = cipher()
c.X = [0,1,2,3]
c.K = c.X
c.Y = c.X
c.PX = [1./2, 1./4, 1./8, 1./8]
c.PK = [1./8, 1./8, 1./4, 1./2]
c.ENC = [[0, 1, 2, 3], \
         [1, 2, 3, 0], \
         [3, 0, 2, 1], \
         [2, 3, 0, 1]  \
        ] 
#c.printCipher()
#c.printGuess()

c.generateTableByFunc("self.xor")
c.PK = [1./8, 1./8-1./32, 1./4, 1./2+1./32]
c.printCipher()
c.printGuess()

#c.PK = [1./4-1./9, 1./4+1./9, 1./4-1./9, 1./4+1./9]
#c.printCipher()
#c.printGuess()

c.PK = [1./4+1./16, 1./4+1./16, 1./4-1./16, 1./4-1./16]
c.printCipher()
c.printGuess()

#c.PX=[3./8,1./4,1./4,1./8]
#c.printCipher()
#c.printGuess()

c.PX=[0.8,0.1,0.05,0.05]
c.PK = [0.4,0.3,0.2,0.1]
c.printCipher()
c.printGuess()

c.PX=[0.7,0.1,0.1,0.1]
c.PK=[0.3,0.3,0.3,0.1]
c.printCipher()
c.printGuess()

#c.PX=[3.5/8,1./4,1.5/8,1./8]
#c.printCipher()
#c.printGuess()

#c.K = [i for i in range(6)]
#c.PX = [1./2, 1./4, 1./8, 1./8]
#c.PK = [1./4, 1./8, 1./8, 1./6, 1.5/12, 2.5/12]
#c.generateTableByFunc("self.mod", 6);
#c.printCipher()
#c.printGuess()
#c.printGuess()

