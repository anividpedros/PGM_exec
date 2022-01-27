import ctypes
import numpy as np
import os

class GravityInterface:
    def __init__(self, filepath):
        self.interface = ctypes.cdll.LoadLibrary('bin/GravityInterface.so')
        self.interface.initGravityFile.restype = ctypes.c_void_p
        self.updateGravityFile(filepath)

    def updateGravityFile(self, filepath):
        self.polygon = ctypes.c_void_p( self.interface.initGravityFile( ctypes.c_char_p(filepath.encode('utf-8')) ) )

    def computeGravity(self, pos): # pos must be np.array with dtype='float64'
        acc = np.empty(3, dtype='float64')
        self.interface.computeGravity( self.polygon, pos.ctypes.data_as(ctypes.POINTER(ctypes.c_double)), acc.ctypes.data_as(ctypes.POINTER(ctypes.c_double)) )
        return acc

    def __del__(self):
        self.interface.deletePolygon(self.polygon)

filepath = "/Users/anivid/Documents/Research/PGM_exec/GravityFile.txt" # os.path.join() 

interf = GravityInterface(filepath)

pos = np.array([0.0280, 0., 0.2631], dtype='float64') # make sure it's doubles == dtype('float64')

acc = interf.computeGravity(pos)

print(acc)
