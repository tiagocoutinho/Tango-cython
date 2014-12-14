cimport tango.deviceproxy	
	
cdef class DeviceProxy:
    cdef tango.deviceproxy.cDeviceProxy *__this

    def __cinit__(self, string &name):
        with nogil:
            proxy = new tango.deviceproxy.cDeviceProxy(name)
        self.__this = proxy

    def __dealloc__(self):
        del self.__this

    def status(self):
        with nogil:
            s = self.__this.status()
        return s

    def name(self):
        with nogil:
            s = self.__this.name()
        return s

    def dev_name(self):
        return self.__this.dev_name()



