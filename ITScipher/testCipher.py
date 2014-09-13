import cipher 
import unittest

class testCipher(unittest.TestCase):
    def setUp(self):
        self.c = cipher.cipher()
        self.c.X = [0,1,2,3]
        self.c.K = self.c.X
        self.c.Y = self.c.X
        self.c.PX = [1./2, 1./4, 1./8, 1./8]
        self.c.PK = [1./8, 1./8, 1./4, 1./2]
        self.c.ENC = [[0, 1, 2, 3], \
                     [1, 2, 3, 0], \
                     [3, 0, 2, 1], \
                     [2, 3, 0, 1]  \
                    ] 

    def testgenRandomDist(self):
        dist = self.c.genRandomDist(10)
        self.assertAlmostEqual(sum(dist), 1.0)

    def testgenRandomDistWithMinEnt(self):
        dist = self.c.genRandomDist(10, 2)
        self.assertAlmostEqual(sum(dist), 1.0)
        self.assertAlmostEqual(max(dist), 0.25)
        """dist = self.c.genRandomDist(10, 2.5)
        self.assertAlmostEqual(max(dist), 2**-2.5) """

    def testpylx(self):
        self.assertEqual(self.c.Pylx(2,2), self.c.PK[0]+self.c.PK[2]) 
        self.assertEqual(self.c.Pylx(1,3), self.c.PK[2]+self.c.PK[3])
        self.assertEqual(self.c.Pylx(0,0), self.c.PK[0])

    def testPy(self):
        self.assertAlmostEqual(self.c.Py(0), 13./64)
        self.assertAlmostEqual(self.c.Py(1), 3./16)
        self.assertAlmostEqual(self.c.Py(2), 21./64)
        self.assertAlmostEqual(self.c.Py(3), 9./32)
        self.assertAlmostEqual(self.c.Py(0)+self.c.Py(1)+self.c.Py(2)+self.c.Py(3), 1)

    def testPY(self):
        self.assertAlmostEqual(sum(self.c.PY()), 1)

    def testPxly(self):
        self.assertAlmostEqual(self.c.Pxly(3,1), 1./2) 

if __name__ == '__main__':
      unittest.main()
