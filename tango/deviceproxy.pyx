# coding: utf-8
# distutils: language=c++
# cython: c_string_type=unicode, c_string_encoding=latin-1

from libcpp.string cimport string
from libcpp.vector cimport vector

cimport deviceproxy

GARBAGE = "just to avoid import error"

from util import ensure_binary

cdef class DeviceProxy:
    cdef deviceproxy.cDeviceProxy* __this

    def __cinit__(self, name):
        cdef string s = ensure_binary(name)
        with nogil:
            proxy = new deviceproxy.cDeviceProxy(s)
        if proxy is NULL:
            raise MemoryError('Cannot allocate memory for DeviceProxy')
        self.__this = proxy

    def __dealloc__(self):
        del self.__this

    # network calls

    def status(self):
        cdef string s
        with nogil:
            s = self.__this.status()
        return s

    def name(self):
        cdef string s
        with nogil:
            s = self.__this.name()
        return s

    def get_attribute_list(self):
        cdef vector[string]* s
        with nogil:
            s = self.__this.get_attribute_list()
        try:
            return s[0]
        finally:
            del s

    def get_command_list(self):
        cdef vector[string]* s
        with nogil:
            s = self.__this.get_command_list()
        try:
            return s[0]
        finally:
            del s

    # local calls

    def dev_name(self):
        return self.__this.dev_name()
