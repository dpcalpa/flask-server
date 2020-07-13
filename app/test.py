import unittest
from app import *

class MyTests(unittest.TestCase):

    ##Unit test for index()
    def test_index(self):
        self.assertEqual(index(), """
    <h1>Python Flask in K8s!</h1>
    """)

    ##Unit test for health()
    def test_health(self):
        self.assertEqual(health(), """
    UP
    """)
    ##your playground ends

if __name__=="__main__":
    unittest.main()