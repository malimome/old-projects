try:
    import cipher
    from matplotlib.pylab import *
    import pylab
    import matplotlib.mlab as mlab
except:
    print
    print "A package not found!"
    print
    raise

def plotDist(subplot, X, Y, label):
    pylab.grid()
    pylab.subplot(subplot)
    pylab.bar(X, Y, 0.05)
    pylab.ylabel(label)
    pylab.xticks(arange(len(X)), X)
    pylab.yticks(arange(0,1,0.1))

def testGenT(c):
    c.X = [0,1,2,3]
    c.K = [0,1,2,3]
    c.generateTable("self.xor")
    print c.ENC

def testRndDist(c, n =5, h8=2):
    dist = c.genRandomDist(n, h8)
    plotDist(111, range(n-1), dist, "SUM = %d" % sum(dist)) 
    pylab.show()

def testGenT(c):
    c.X = [i for i in range(4)]
    c.K = c.X
    dist = [1./2, 1./4, 3./16, 1./16]
    c.PK = [1./16, 3./16, 1./4, 1./2]
    c.PX = dist
    c.generateTableByFunc("self.xor")
    print dist#, c.X, c.ENC
    print "min entropy of message \t %s" % (c.H8(c.PX))
    #print "min entropy of key \t %s" % (c.H8(c.PK))
    print "entropy of message \t %s" % (c.H(c.PX))
    #print "entropy of key \t\t %s" % (c.H(c.PK))
    if (c.checkDists()==1):
        print "Conditional min-entropy \t %s" % (c.H8XlY())
        print "Conditional entropy \t %s" % (c.HXlY())
    else:
        print "Problem in distributions"

    for i in range(4):
        print "min cons in y", c.H8Xly(i)
        print "cons in y", c.HXly(i)

    plotDist(231, c.X, c.PX, "X")
    plotDist(232, c.X, c.PY(), "Y")
    for i in range(4):
        plotDist(233+i, c.X, c.PXly(i), "Y = %d" % i)

    pylab.show()
"""
class findDist:
    def __init__(self): # Constructor
        self.keyCoef = -1
        self.encFunc = "self.xor"
        self.XminEntCoef = -1
        self.epsilon = 0
        self.compareFunc = "self.compareH8"
        self.Xrange = range(6,12)
        self.distNum = 1000
    
     def compareH8(self, c, epsilon):
        H8X = c.H8(c.PX)
        H8XlY = c.H8XlY()
        if (abs(H8X - H8XlY) <= epsilon):
            print "Found %s" % i, c.PX, "keysize = %d\n" % keysize
            print "H8XlY = %s, H8X = %s" % (H8XlY, H8X)
            exit(0)
   
    def findDist(self, keyCoef, encFunc, XminEntCoef, epsilon, compareFunc):
        c = cipher.cipher()
        for i in self.Xrange:
            c.X = [t for t in range(i)]
            if (self.keyCoef > 0):
                keysize = int(self.keyCoef*i)
            else:
                keysize = i-self.keyCoef
            c.K = [t for t in range(keysize)]
            c.PK = [1./keysize for t in range(keysize)]
            c.generateTable(self.encFunc)
            print "i = %d \n" % i
            for j in range(self.distNum):
                if (self.XminEntCoef > 0):
                    minEnt = i*self.XminEntCoef
                elif (self.XminEntCoef == 0):
                    minEnt = 0
                else:
                    minEnt = i - self.XminEntCoef
                c.PX = c.genRandomDist(i+1, minEnt)
                if (c.checkDists()!=1):
                    continue
                eval(self.compareFunc)(c, self.epsilon)

c = cipher.cipher()
c.X = [0,1,2, 3]
c.K = [0,1,2, 3]
c.PX = [1./4, 1./4, 1./4, 1./4]
c.PK = c.PX
c.ENC = [[1, 2, 3, 0], [2,3,0,1], [1,0,3,2], [2,3,0,1]]
print "PY"
print c.PY() 
print "PXlY"
print c.PXlY()
print "HX"
print c.H(c.X)
print "HXlY" 
print c.HXlY()

c = cipher.cipher()
testGenT(c)
exit(0)

c.X = [0,1,2, 3]
c.K = c.X
c.PX = [1./2, 1./4, 1./8, 1./8]
c.PK = [1./8, 1./8, 1./4, 1./2]
c.generateTableByFunc("self.xor")
H8X = c.H8(c.PX)
H8XlY = c.H8XlY()
if (abs(H8X - H8XlY) <= 0.00001):
    print H8X, H8XlY, c.H(c.PX), c.HXlY()
print "OK"
exit(0)

c = cipher.cipher()
c.X = [0,1,2]
c.K = [0,1,2]
c.PX = c.genRandomDist(4)
print c.PX
c.PK = [1./3, 1./3, 1./3]
c.generateAllTables(3, "self.maxProb")
exit(0)



fd = findDist()
fd.Xrange = range(6,12)
fd.distNum = 1000
fd.compareFunc = "self.compareH8"
fd.epsilon = 0
fd.keyCoef = 1./4
fd.XminEntCoef = 0
#fd.findDist()
c = cipher.cipher()
testGenT(c)
"""
