#!/usr/bin/python
try:
#  from sympy import *
#  from numpy import *
  import math
  import random
  import itertools as itert
  from copy import deepcopy
  from cnf import *
  import pdb
  import sys
  import traceback
  import inspect
  from pprint import pprint
  import multiprocessing as multip
except:
  print "package not found"
  raise

class SSSolutionBase():
  def __init__(self, M, K, nbyn, src):
    self.M = M
    self.K = K
    self.nbyn = nbyn
    self.src = src
    self.shareSet = None
    if K:
      self.k = len(K)
    if M:
      self.m = len(M)
    self.kton = 0
    self.config = None
    self.getShareSets()

  def getShareSets(self):
    self.shareSet = range(MAX_SHARE_NO)
    for j in range(MAX_SHARE_NO):
      self.shareSet[j] = [i for i in range(j*MAX_SHARE_LEN, (j+1)*MAX_SHARE_LEN)]

  def column(self, matrix, rowindex):
    return [row[rowindex] for row in matrix]

  def getElems(self, arr, indices):
    return [arr[i] for i in indices]

  def initConfig(self, ret = False):
    pass

  def checkSecurity(self, config):
    pass

  def checkCorrectness(self, config):
    pass

  def printConfig(self, config):
    print config

class SSSolutionTogBase(SSSolutionBase):
  def __init__(self, M, K, nbyn, src):
    SSSolutionBase.__init__(self ,M, K, nbyn, src)

  def initConfig(self, ret = False):
    if ret:
      return [[[self.shareSet[n][0] for n in range(self.nbyn)] 
               for i in self.K] for j in self.M]
    else:
      self.config = [[[self.shareSet[n][0] for n in range(self.nbyn)] 
               for i in self.K] for j in self.M]
    
  def checkConfig(self, configShTog):
    if len(configShTog) != self.m:
      print "# message neq # in config"
      return True
    for m in self.M:
      if len(configShTog[m]) != len(self.K):
        print "# key neq # in config"
        return False
      for k in self.K:
        if len(configShTog[m][k]) != self.nbyn:
          print "# shares neq # in config"
          return False

  def ShTog2ShSep(self, configShTog):
    newrep = [[[] for m in self.M] for i in range(self.nbyn)]
    for n in range(self.nbyn):
      for m in self.M:
        newrep[n][m] = self.column(configShTog[m], n)
    return newrep

  def checkSecurity(self, configShTog, ret= None):
    newrep = self.ShTog2ShSep(configShTog)
    ssep = SSSolutionSepBase(self.M, self.K, self.nbyn, self.src)
    return ssep.checkSecurity(newrep, ret)

  def checkCorrectness(self, configShTog, ret = None):
    allsh = []
    for m in self.M:
      allsh += configShTog[m]
    for share in allsh:
      num = allsh.count(share)
      if num > 1:
        if ret:
          ret["sh"] = share
          ret["rep"] = num
        return False
    return True

  def printConfig(self, configShTog):
    print "_" * 70
    for m in self.M:
      print str(m) + "| ",
      print configShTog[m]

class SSSolutionSepBase(SSSolutionBase):
  def __init__(self, M, K, nbyn, src):
    SSSolutionBase.__init__(self ,M, K, nbyn, src)

  def initConfig(self):
    self.config = [[[self.shareSet[n][0] for k in self.K] 
          for m in self.M] for n in range(self.nbyn)]
    
  def checkSecurity(self, newrep, ret = None):
    for n in range(self.nbyn):
      for m in self.M:
        for dist in self.src:
          sortedlst = sorted(self.getElems(newrep[n][m], dist))
          for m1 in self.M:
            sortedlst2 = sorted(self.getElems(newrep[n][m1], dist))
            if sortedlst != sortedlst2:
              if ret:
                ret["sh"] = n
                ret["m0"] = m
                ret["m1"] = m1
                ret["dist"] = dist
              return False
    return True  

  def checkCorrectness(self, configShSep):
    M0 = list(self.M)
    M0.pop(0)
    for k in self.K:
      nextk = False
      for n in range(self.nbyn): #{
        sh = configShSep[n][0][k]
        for m in M0:
          if sh != configShSep[n][m][k]:
            nextk = True
            break
        if nextk:
          break
      #}
      if nextk:
        return True
      else:
        return False

class SSSolutionAllTog(SSSolutionTogBase):
  def __init__(self, M, K, nbyn, src):
    SSSolutionTogBase.__init__(self ,M, K, nbyn, src)
 
  def runEnum(self):
    self.initConfig()
    for rawconfig in itert.product(self.K, repeat= self.k*len(self.M)*self.nbyn):
      j = 0
      for k in self.K:
        for m in self.M:
          for n in range(self.nbyn):
            self.config[m][k][n] = rawconfig[j]
            j += 1
      if self.checkCorrectness(self.config):
        if self.checkSecurity(self.config):
          self.printConfig(self.config)
          return
   
class SSSolutionAllSep(SSSolutionSepBase):
  def __init__(self, M, K, nbyn, src):
    SSSolutionSepBase.__init__(self ,M, K, nbyn, src)
    self.initConfig()

  def runEnum(self):
    self.initConfig()
    for i in itert.product(self.K, repeat= self.k*len(self.M)*self.nbyn):
      continue
      j = 0
      for n in range(self.nbyn):
        for m in self.M:
          self.config[n][m] = list(i[j:j+k])
          j += k
      if checkCorrectness(self.config):
        if checkSecurity(self.config):
          self.printConfig(self.config)
          return
    print "Nothing found"


class SSSolutionRndTog(SSSolutionTogBase):
  def __init__(self, M, K, nbyn, src):
    SSSolutionTogBase.__init__(self ,M, K, nbyn, src)

  def runEnum(self):
    self.initConfig()
    rndTableLookup = "tableofall value"
    for i in range(self.m*self.k):
      for k in self.K:
        for m in self.M:
          for n in range(self.nbyn):
            random.seed()
            rnd = random.randint(0, self.k-1)
            self.config[m][k][n] = rnd
      if checkCorrectness(self.config):
        if checkSecurity(self.config):
          self.printConfig(self.config)

class SSSolutionPairTog(SSSolutionTogBase):
  def __init__(self, M, K, nbyn, src):
    SSSolutionTogBase.__init__(self ,M, K, nbyn, src)
    self.kton = int(math.pow(self.k, self.nbyn))
    self.mk1 = self.k * self.m -1
    self.pairset = []

  def initConfig(self, ret = False, elem = []):
    if ret:
      return  [[elem for i in self.K] for j in self.M]
    else:
      self.config = [[elem for i in self.K] for j in self.M]

  def getTupleSet(self):
    shset = range(self.nbyn) # A times B times C (gets A,B,C)
    for i in range(self.nbyn):
      shset[i] = self.shareSet[i][:self.k]

    self.pairset = range(self.kton) # gets all possible [a,b,c,..] which is k to n
    j = 0
    for i in itert.product(*shset):
      self.pairset[j] = i
      j += 1

  def runEnum(self):
    self.getTupleSet()
    self.initConfig()

    self.config[0][0] = self.pairset[0]
    #configset is all possible k*m-1 permutation of number of pairsets
    print "perm of 1 to " + str(self.kton-1) + " in " + str(self.mk1) + " set"
    print "# perms:" + str(factorial(self.kton)/factorial(self.kton - self.mk1))
    j = 0
    print "pairset " + str(self.pairset)
    for configset in itert.permutations(range(1,self.kton), self.mk1):
      t = 0
      for m in self.M:
        for k in self.K:
          if m+k != 0:
            self.config[m][k] = self.pairset[configset[t]]
            t += 1
      if self.checkSecurity(self.config):
        print "Table:"
        self.printConfig(self.config)
        return

class SSSolutionEnumPair(SSSolutionPairTog):
  def __init__(self, M, K, nbyn, src):
    SSSolutionPairTog.__init__(self ,M, K, nbyn, src)
    self.possible = {}
    self.binded_Ks = [[] for k in self.K]
    self.itercount = 0
    self.kdist = None

  def recursePairset(self, configTog, m, k):
    k += 1
    if (k < self.k):
      lst = []
      for k in self.binded_Ks[k]:   # k in the same dist
        lst.append(configTog[m][k])
      possibleSet = self.possIntersection(lst)
    else:
      m += 1
      if m == self.m:
        yield configTog
        return
      k = 0
      possibleSet = self.pairset
      if len(possibleSet) == 0:
        return

    for tup in possibleSet:
      configTog[m][k] = tup
      for candid in self.recursePairset(configTog, m, k):
        if candid:
          yield candid

  def iterateConfig(self, configTog):
    m = 0
    k = 0
    currentConfigSet = [[] for m1 in self.M]
    currentConfigSet.append([])
    configTog[m][k] = self.pairset[0]
    currentConfigSet[m+1] = [configTog[m][k]]
    direction = FORWARD
    STACK = []
    allpairs = list(self.pairset)
    ret = {"sh":0, "m0":0, "m1":0, "dist":0}
    self.itercount = 0

    while (1):
    #{
      self.itercount += 1
      if direction == STAY:
        configTog[m][k] = [-1, -1]
        currentConfigSet[m+1].pop()
        if len(possibleSet) != 0:
          possibleSet.pop()
        else:
          direction = BACKWARD
          k -= 2

      if direction == BACKWARD:
        k += 1
        if len(STACK) == 0:
          print "STACK EMPTY"
          return None
        possibleSet = STACK.pop()
        
      if direction == FORWARD:
      #{
        k += 1
        if k < self.k:
          allpairs = set(self.pairset) - set(currentConfigSet[m])
          possibleSet = self.getPossSet(m, k, configTog, allpairs)    
          #possibleSet should be copied
        else:
          k = 0
          m += 1
          if m < self.m:
            allpairs = set(self.pairset) - set(currentConfigSet[m])
            possibleSet = allpairs
          elif m == self.m:
            if self.checkSecurity(configTog, ret):
              return configTog
            else:
              direction = BACKWARD
              k = self.k - 2
              m -= 1
              continue
      #}

      if len(possibleSet) == 0:
        if direction != STAY:
          if len(currentConfigSet[m+1]) != 0:
            currentConfigSet[m+1].pop()
        direction = BACKWARD
        if k == 0:
          m -= 1
          k = self.k -2
        else:
          k -= 2
        continue
      configTog[m][k] = possibleSet.pop()
      STACK.append(possibleSet) 
      currentConfigSet[m+1].append(configTog[m][k])
      direction = FORWARD
      continue
#####    NEEDS CHANGE
      if m > 0:
        if self.checkSecurity(configTog, ret):
          return configTog
        else:
          print ret  #"dist", "sh", "m1", "m0"
          self.printConfig(configTog)
          if configTog[ret["m1"]][max(ret["dist"])][0] != -1:
            direction = STAY
            continue
#####
    #}
 
  def genNotList(self):
    for tup in self.pairset: # The main 
      self.possible[str(tup)] = self.getposs(tup)
    for k in self.K:
      self.binded_Ks[k] = self.binded_to_k(k)

  def binded_to_k(self, k):
    iset = set()
    for dist in self.src:
      if k in dist:
        for i in dist:
          if i != k:
            iset.add(i)
    return iset
      
  def getposs(self, item):
    iset = set()
    for tup in self.pairset:
      poss = True
      for n in range(self.nbyn):
        if tup[n] == item[n]:
          poss = False
          break
      if poss:
        iset.add(tup)
    return iset

  def possIntersection(self, lst, allpairs):
    ret = set(allpairs)
    for item in lst:
      if str(item) in self.possible:   #remove this
        ret = ret & self.possible[str(item)]    #intersection
    return ret

  def getPossSet(self, m, k, config, allpairs):
    lst = []
    for k1 in self.binded_Ks[k]:   # k in the same dist
      if config[m][k1][0] != -1:
        lst.append(config[m][k1])
    return self.possIntersection(lst, allpairs)    #possibleSet should be copied
    
  def localSecurityDist(self, configTog, dist, ret):
    shares_dist = [[-1 for k in dist] for n in range(nbyn)]
    for n in range(self.nbyn):
      for m in self.M:
        for k in dist:
          shares_dist[n][m][k]

    newrep = self.ShTog2ShSep(configShTog)
    pass
 
  def getDistForKey(self):
    self.kdist = [[] for k in self.K]
    for dist in self.src:
      self.kdist[max(dist)].append(dist) #change to number

  def iterateConfigwork(self, configTog):
    m = 0
    k = 0
    self.getDistForKey()
    currentConfigSet = [[] for m1 in self.M]
    currentConfigSet.append([])
    configTog[m][k] = self.pairset[0]
    currentConfigSet[m+1] = [configTog[m][k]]
    direction = FORWARD
    STACK = []
    allpairsK = set(self.pairset)
    allpairs = set(self.pairset)
    ret = {"sh":0, "m0":0, "m1":0, "dist":0}
    self.itercount = 0

    while (1):
    #{
      self.itercount += 1
      
      if direction == FORWARD:
      #{
        k += 1
        if k < self.k:
          #DO we need to set these everytime?
          #allpairsK = allpairsK - set(currentConfigSet[m])
          possibleSet = self.getPossSet(m, k, configTog, allpairs)    
          #possibleSet should be copied
        else:
          k = 0
          m += 1
          allpairs = allpairs - set(currentConfigSet[m])
          if m < self.m:
            possibleSet = allpairs
          elif m == self.m:
            if self.checkSecurity(configTog, ret):
              return configTog
            else:
              direction = BACKWARD
              k = self.k - 1
              m -= 1
              continue
      #}

      if direction == STAY:
        configTog[m][k] = [-1, -1]
        currentConfigSet[m+1].pop()
        if len(possibleSet) != 0:
          possibleSet.pop()
        else:
          direction = BACKWARD
          k -= 1

      if direction == BACKWARD:
        if len(STACK) == 0:
          print "STACK EMPTY"
          return None
        possibleSet = STACK.pop()
        
      if len(possibleSet) == 0:
        if direction != STAY:
          if len(currentConfigSet[m+1]) != 0:
            currentConfigSet[m+1].pop()
        direction = BACKWARD
        if k == 0:
          m -= 1
          k = self.k -1
        else:
          k -= 1
        continue
      configTog[m][k] = possibleSet.pop()
      self.printConfig(configTog)
      direction = FORWARD
      # Sort distributions, more from beginning and smaller
      # FIND Ks and the corresponding dist that should be checked
      # Keep the dist in another stack
      # Check security against a dist not src
      # GET a list of dists for each key that should be checked with no
      # repitition of previ ones
      while(True):
        if m > 0: #should I check every time
          if len(self.kdist[k]) == 0:
            break
          direction = STAY
          for dist in self.kdist[k]:
            if self.checkSecurity(configTog, ret):
              direction = FORWARD
              continue
            if len(possibleSet) == 0:
              direction = BACKWARD
              configTog[m][k] = [-1, -1]
              k -= 1
            else:
              configTog[m][k] = possibleSet.pop()
              break
        if direction != STAY:
          break
              #here is stay
      if direction == FORWARD:
        STACK.append(possibleSet) 
        currentConfigSet[m+1].append(configTog[m][k])
      continue
#####    NEEDS CHANGE
      if m > 0:
        if self.checkSecurity(configTog, ret):
          return configTog
        else:
          print ret  #"dist", "sh", "m1", "m0"
          self.printConfig(configTog)
          if configTog[ret["m1"]][max(ret["dist"])][0] != -1:
            direction = STAY
            continue
#####
    #}


  def runEnum(self):
    self.getTupleSet()
    configTog = self.initConfig(True, [-1, -1])
    self.genNotList()
    configTog[0][0] = self.pairset[0]
    config1 = self.initConfig(True)
    config2 = self.initConfig(True)
    try:
      config2 = self.iterateConfig(list(configTog)) 
      if config2:
        print "SECURE CONFIG in %s count" % self.itercount
        self.printConfig(config2)
      configTog = self.initConfig(True, [-1, -1])
      configTog[0][0] = self.pairset[0]
      config1 = self.iterateConfigwork(list(configTog)) 
      if config1:
        print "SECURE CONFIG WORK in %s count" % self.itercount
        self.printConfig(config1)
    except Exception as e:
      print "ERROR:" + str(e)
      for frame in traceback.extract_tb(sys.exc_info()[2]):
        fname,lineno,fn,text = frame
        print "Error in %s on line %d" % (fname, lineno)
        print "function:", fn, " text: ", text
      pprint(inspect.trace()[-1][0].f_locals)
 
if __name__ == '__main__':
  ind = 0
  args = sys.argv
  if len(args) > 1:
    ind = int(sys.argv[1])
    if ind < 0:
      ind = 0

  print "Source:" + str(source[ind])
  sep = SSSolutionEnumPair(Msg[ind], Key[ind], noutn[ind], source[ind])
  sep.runEnum()
  exit(0)
  spt = SSSolutionPairTog(Msg[ind], Key[ind], noutn[ind], source[ind])
  spt.runEnum()
  sat = SSSolutionAllTog(Msg[ind], Key[ind], noutn[ind], source[ind])
  sat.runEnum()
  sas = SSSolutionAllSep(Msg[ind], Key[ind], noutn[ind], source[ind])
  sas.runEnum()

