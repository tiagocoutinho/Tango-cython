from setuptools import setup, Extension
from Cython.Build import cythonize

TANGO_ROOT = '/home/coutinho/miniconda3/envs/pytango-cython'
TANGO_INCLUDE_DIR = TANGO_ROOT + '/include/tango'
TANGO_LIB_DIR = TANGO_ROOT + '/lib'

tango = Extension("tango._tango", sources=["tango/deviceproxy.pyx"],
                  include_dirs=[TANGO_INCLUDE_DIR],
                  library_dirs=[TANGO_LIB_DIR],
                  libraries=['tango'])


setup(name='tango',
      ext_modules=cythonize(tango))


