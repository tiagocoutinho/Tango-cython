import os

from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

ext_modules = [Extension("Tango",
                         ["Tango.pyx"],
                         language='c++',
                         include_dirs=[tango_include],
                         library_dirs=[tango_lib],
                         libraries=['tango'],
                         extra_compile_args=['-std=c++0x'])]

setup(
  name = 'Tango',
  cmdclass = {'build_ext': build_ext},
  ext_modules = ext_modules
)
