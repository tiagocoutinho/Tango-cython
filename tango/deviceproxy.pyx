from libcpp.string cimport string
from libcpp.vector cimport vector

cimport deviceproxy

cdef class DeviceProxy:
    cdef deviceproxy.cDeviceProxy *__this

    def __cinit__(self, string &name):
        with nogil:
            proxy = new deviceproxy.cDeviceProxy(name)
        self.__this = proxy

    def __dealloc__(self):
        del self.__this

    def status(self):
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
        result = []
        for i in range(s.size()):
            result.append(s[i])
        return result

    def dev_name(self):
        return self.__this.dev_name()
