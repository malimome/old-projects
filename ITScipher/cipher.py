try:
    from sympy import *
    from numpy import *
    import math
    import itertools as itert
    from matplotlib.pylab import *
    import pylab
    import matplotlib.mlab as mlab
    import random
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

def log2(x):
    return log(x)/log(2)

def isprime(n):
    for x in range(2, int(n**0.5)+1):
        if n % x == 0:
            return False
    return True

class cipher:
    def __init__(self): # Constructor
        self.X = []
        self.K = []
        self.PX = []
        self.PK = []
        self.Y = []
        self.ENC = []
        
    def setX(self, pX):
        if (sum(pX)==1.0):
            self.PX=pX
            return 1;
        else:
            print "Not a distribution"
            return 0;
 
    def setX(self, pK):
        if (sum(pK)==1.0):
            self.PK=pK
            return 1;
        else:
            print "Not a distribution"
            return 0;

    def clear(self):
        self.X = []

    def genRandomDist(self, n, minEnt = 0):
        dist = []
        prev = 1
        if (minEnt != 0):
            pmax = pow(2, -minEnt)
            if (pmax*n<1):
                return [1.0/n for i in range(n)]
            dist.append(pmax)
            n = n-1
            prev = 1.0 -pmax 
        for i in range(n-2):
            if (minEnt == 0):
                elm = random.uniform(0, prev)
            else:
                lower = prev - pmax*(n-i-1)
                if lower<0:
                    lower =0;
                elm = random.uniform(lower, pmax)
            dist.append(elm)
            prev = 1.0 - sum(dist)

        dist.append(1.0 - sum(dist))
        return dist

    def generateTableByFunc(self, f, n=0):
        self.ENC = []
        r = 0
        Yset = set()
        for k in self.K:
            self.ENC.append([])
            for x in self.X:
                self.ENC[r].append(eval(f)(x,k,n))
                Yset = Yset.union(Yset, self.ENC[r])
            r = r+1
        self.Y = Yset
   
    def generateRndPerm(self, X):
        n = len(X)
        for i in range(1, n):
            rnd = range(i,n)
            swap(i, rnd)
        return 0

    def generateTableByPerm(self):
        self.ENC = []
        for k in self.K:
           self.ENC.append(self.generateRndPerm(self.X))
        self.Y = self.X

    def xor(self, x, k, n):
        return x ^ k

    def mod(self, x, k, n):
        return (x + k) % n 

    def modeq(self, x, k, n):
        return mod(x, k, len(self.X))

    def modx(self, x, k, p):
        if (isprime(p)):
            return (x * k) % p 
        else:
            return -1;

    def modxeq(self, x, k, n):
        return modx(x, k, len(self.X))

    def column(matrix, i):
        return [row[i] for row in matrix]
 
    def generateAllTables(self, k, func):
        permList = list(itert.permutations(self.X))
        i = 0
        for table in itert.combinations(permList, k):
            i = i +1 
            print i
            self.ENC = table
            if (eval(func)()):
                print table
  
    def maxProb(self):
        for y in self.X:
            Xly = self.PXly(y)
            X = self.PX
            if (abs(max(X) - max(Xly)) > 0.000001):
                return False
            print Xly
        return True
              
    def Pylx(self, y, x):
        res = 0
        for k in range(len(self.K)):
            if (self.ENC[k][x] == y):
                res += self.PK[k]
        return res

    def Py(self, y):
        res = 0
        for x in range(len(self.X)):
            for k in range(len(self.K)):
                if (self.ENC[k][x] == y):
                    res += self.PK[k] * self.PX[x]
        return res

    def PY(self):
        res = 0
        pDist = []
        for y in self.Y:
            pDist.append(self.Py(y))
        return pDist	
 
    def Pxly(self, x, y):
        if x in range(len(self.X)) and self.Py(y) != 0:
            return (self.PX[x] * self.Pylx(y, x) / self.Py(y))
        else:
            print "X %d not in range" % x
            return -1

    def PXly(self, y):
        pdist = []
        for x in range(len(self.X)):
            pdist.append(self.Pxly(x,y))
        return pdist
 
    def PXlY(self):
        pdist = []
        for y in self.Y:
            pdist.append(self.PXly(y))
        return pdist
              
    def PXlYave(self):
        pdist = []
        for x in self.X:
            ret = 0
            for y in self.Y:
                ret += self.Py(y) * self.PXly(y)[x]
            pdist.append(ret)
        return pdist
              
    def H(self, dist):
        res = 0
        for x in dist:
            res += x * log2(x)
        return -res

    def HXly(self, y):
        res = 0
        for x in range(len(self.X)):
            val = self.Pxly(x,y)
            if val==0:
                continue
            res += val * log2(val)
        return -res

    def HXlY(self):
        res = 0
        for y in self.Y:
            res += self.Py(y) * self.HXly(y)
        return res

    def G(self, dist):
        return max(dist)

    def H8(self, dist):
        return -log2(self.G(dist))

    def GXly(self, y):
        return self.G(self.PXly(y))

    def H8Xly(self, y):
        return -log2(self.GXly(y))

    def GXlY(self):
        res = 0
        for y in self.X:
            res += self.Py(y) * self.GXly(y)
        return res

    def H8XlY(self):
        return -log2(self.GXlY())

    def PXyX(self, y):
        dist = []
        for x in self.X:
            dist.append(self.PX[x] * self.Pylx(y,x))
        return max(dist)

    def GPXlY(self):
        res = 0
        for y in self.Y:
            res += self.PXyX(y)
        return res

    def C(self, dist):
        ret = 0
        for i in dist:
            ret += i*i
        return ret
    
    def H2(self, dist):
        return -log2(self.C(dist))

    def CXly(self, y):
        return self.C(self.PXly(y))

    def H2Xly(self, y):
        return -log2(self.CXly(y))

    def CXlY(self):
        res = 0
        for y in self.Y:
            res += self.Py(y) * self.CXly(y)
        return res
        
    def checkDists(self):
        if (sum(self.PX) != 1 or sum(self.PK)!= 1):
            return 0
        else:
            return 1

    def U(self, dist):
        return max(dist)/min(dist)

    def FS(self, dist):
        secmax = sorted(dist,reverse=True)[1]
        return max(dist)/secmax

    def printCipher(self, debug=0):
        if (debug):
            print "X: \t", self.X
            print "K: \t", self.K
            print "Y: \t", self.Y
        print "PX: \t", self.PX, "\t sum=", sum(self.PX), "\t FS(X)=", self.FS(self.PX)
        print "PK: \t", self.PK, "\t sum=", sum(self.PK), "\t U(K)=", self.U(self.PK)
        print "ENC: \t", self.ENC

    def printEntropy(self, debug=0):
        print "H8(K)     = {0}, \t H(K)   = {1}".format(self.H8(self.PK), self.H(self.PK))
        print "--H8(X)   = {0}, \t H(X)   = {1}".format(self.H8(self.PX), self.H(self.PX)) 
        print "--H8(XlY) = {0}, \t H(XlY) = {1}".format(self.H8XlY(), self.HXlY())
        if (self.checkDists()!=1):
            print "Problem in distributions"
            return 0

        for i in self.Y:
            print "H8(XlY={0}) = {1}, \t H(XlY={0}) = {2}"\
                   .format(i, self.H8Xly(i), self.HXly(i))
        print ""

    def printGuess(self, debug=0):
        print "G(K)     = {0}, \t H(K)   = {1} \t C(K) = {2}"\
            .format(self.G(self.PK), self.H(self.PK), self.C(self.PK))
        print "--G(X)   = {0}, \t H(X)   = {1} \t C(X) = {2}"\
            .format(self.G(self.PX), self.H(self.PX), self.C(self.PX)) 
        print "--G(XlY) = {0}, \t H(XlY) = {1} \t C(X|Y) = {2}"\
            .format(self.GXlY(), self.HXlY(), self.CXlY())
        #print "--GP(XlY) = {0}, \t H(XlY) = {1}".format(self.GPXlY(), self.HXlY())
        if (debug):
            print ""
            return 0

        if (self.checkDists()!=1):
            print "Problem in distributions"
            return 0

        for i in self.Y:
            print "G(XlY={0}) = {1}, \t H(XlY={0}) = {2} \t C(X|Y={0}) = {3} \t P({0}) = {4}"\
                   .format(i, self.GXly(i), self.HXly(i), self.CXly(i),self.Py(i))
        print ""

    def printProbs(self):
        for y in self.Y:
            print "PXly({0}) = ".format(y), self.PXly(y)

    def printall(self):
        self.printCipher(1)
        self.printEntropy(1)
        self.printGuess()
        self.printProbs()

    def plotResult(self, n=4):
        plotDist(231, self.X, self.PX, "X")
        plotDist(232, self.X, self.PY(), "Y")
        for i in self.Y:
            plotDist(233+i, self.X, self.PXly(i), "Y = %d" % i)

        pylab.show()

