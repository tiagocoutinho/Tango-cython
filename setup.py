from setuptools import setup, Extension

TANGO_ROOT = '/home/coutinho/miniconda3/envs/pytango-cython'
TANGO_INCLUDE_DIR = TANGO_ROOT + '/include/tango'
TANGO_LIB_DIR = TANGO_ROOT + '/lib'

USE_CYTHON = True

ext = '.pyx' if USE_CYTHON else '.c'

extensions = Extension("tango._tango", sources=["tango/deviceproxy" + ext],
                       include_dirs=[TANGO_INCLUDE_DIR],
                       library_dirs=[TANGO_LIB_DIR],
                       libraries=['tango']),


if USE_CYTHON:
    from Cython.Build import cythonize
    ext_modules = cythonize(extensions, annotate=True)#, language_level=3)
else:
    ext_modules = extensions

setup(
    name='tango',
    ext_modules=ext_modules
)


