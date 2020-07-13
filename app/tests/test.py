import unittest
# some_file.py
import sys
# insert at 1, 0 is the script path (or '' in REPL)
sys.path.insert(1, '../prueba-k8/app')
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