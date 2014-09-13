#!/usr/bin/python
from flatsrc import *
import unittest

class testSS(unittest.TestCase):
  def setUp(self):
    pass

  def testShTog2ShSep(self):
    config = [
           [[1,2], [3,4], [5,6]],
           [[7,8], [9,10],[11,12]],
         ]
    M = [0,1]
    nbyn = 2
    newrep = [
           [[1,3,5], [7,9,11]],
           [[2,4,6], [8,10,12]],
          ]
    stb = SSSolutionTogBase(M, None, nbyn, None)
    config2 = stb.ShTog2ShSep(config)
    self.assertEqual(config2, newrep) 

  def testCheckSecurityShSep(self):
    #checkSecurityShSep(M, K, nbyn, newrep, src)
    pass

  def testCheckSecurityShTog(self):
    M = [0,1]
    K = [0,1,2,3,4,5]
    src = [[0,1],[2,3],[0,2,4],[0,3,5]]
    nbyn = 2
    config = [
              [[3,102], [1,104], [2,101], [4,103], [1,103], [1,101]],
              [[1,102], [3,104], [2,103], [4,101], [3,101], [3,103]],
             ]
    stb = SSSolutionTogBase(M, K, nbyn, src)
    self.assertTrue(stb.checkSecurity(config))

  def testCheckSecurityShTogFalse(self):
    M = [0,1]
    K = [0,1,2,3,4,5]
    src = [[0,1],[2,3],[0,2,4],[0,3,5]]
    nbyn = 2
    config = [
              [[3,102], [1,104], [2,101], [4,103], [1,103], [1,101]],
              [[1,102], [3,104], [2,103], [4,101], [3,101], [2,103]],
             ]
    stb = SSSolutionTogBase(M, K, nbyn, src)
    ret = {"sh":0, "m0":0, "m1":0, "dist":0}
    self.assertFalse(stb.checkSecurity(config, ret))
    self.assertEqual(ret["sh"],0)
    self.assertEqual(ret["m0"],0)
    self.assertEqual(ret["m1"],1)
    self.assertEqual(ret["dist"], [0,3,5])

  def testCheckCorrectnessShSep(self):
    #checkCorrectness(M, K, nbyn, config)
    pass

  def testCheckCorrectnessShTogTrue(self):
    M = [0,1]
    config = [
              [[3,102], [1,104], [2,101], [4,103], [1,103], [1,101]],
              [[1,102], [3,104], [2,103], [4,101], [3,101], [3,103]],
             ]
    stb = SSSolutionTogBase(M, None, None, None)
    self.assertTrue(stb.checkCorrectness(config))

  def testCheckCorrectnessShTogFalse(self):
    M = [0,1]
    config = [
              [[3,102], [1,104], [2,101], [4,103], [1,103], [1,101]],
              [[1,102], [3,104], [2,103], [4,101], [3,101], [3,102]],
             ]
    ret = {"sh":0, "rep":0}
    stb = SSSolutionTogBase(M, None, None, None)
    self.assertFalse(stb.checkCorrectness(config, ret))
    self.assertEqual(ret["sh"], [3,102])
    self.assertEqual(ret["rep"], 2)

if __name__ == '__main__':
  unittest.main()
