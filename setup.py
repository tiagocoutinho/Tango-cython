import os

from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

import pkgconfig

__LIBTANGO_VERSION = ">=7.0"

def check_lib(name, version):
    lib_installed = pkgconfig.exists(name)
    if not lib_installed:
        raise Runtimerror("lib{0} not installed".format(name))

    lib_min = pkgconfig.installed(name, version)
    if not lib_min:
        raise RuntimeError("requires lib{0} {1} ".format(name, version))
    return pkgconfig.parse(name)

libtango = check_lib("tango", __LIBTANGO_VERSION)

ext_modules = [Extension("Tango",
                         ["Tango.pyx"],
                         language='c++',
                         include_dirs=list(libtango['include_dirs']),
                         library_dirs=list(libtango['library_dirs']),
                         libraries=['tango'],
                         extra_compile_args=['-std=c++0x'])]

setup(
  name = 'Tango',
  cmdclass = {'build_ext': build_ext},
  ext_modules = ext_modules
)
