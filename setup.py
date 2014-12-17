import os
from functools import partial

from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

import pkgconfig

this_dir = os.path.dirname(os.path.realpath(__file__))
src_dir = os.path.join(this_dir, "tango")

__LIBTANGO_VERSION = ">=7.0"

def check_lib(name, version):
    lib_installed = pkgconfig.exists(name)
    if not lib_installed:
        raise RuntimeError("lib{0} not installed".format(name))

    lib_min = pkgconfig.installed(name, version)
    if not lib_min:
        raise RuntimeError("requires lib{0} {1} ".format(name, version))
    return pkgconfig.parse(name)

try:
    libtango = check_lib("tango", __LIBTANGO_VERSION)
except RuntimeError as e:
    print("Error: {0}.".format(e))
    libtango = dict(include_dirs=['/usr/include', '/usr/include/tango'],
                    library_dirs=['/usr/lib'])

TangoExtension = partial(Extension, language='c++',
                         include_dirs=list(libtango['include_dirs']),
                         library_dirs=list(libtango['library_dirs']),
                         libraries=['tango'],
                         extra_compile_args=['-std=c++0x'])

ext_modules = [TangoExtension("tango", [os.path.join(src_dir, "tango.pyx")])] 

setup(
  name = 'tango',
  cmdclass = {'build_ext': build_ext},
  ext_modules = ext_modules
)
