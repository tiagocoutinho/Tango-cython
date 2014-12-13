cimport Tango	
	

cdef class Database:
    """Tango Database object"""

    cdef Tango.cDatabase *__this

    def __cinit__(self):
        with nogil:
            db = new Tango.cDatabase()
        self.__this = db

    def __dealloc__(self):
        del self.__this

    def get_info(self):
        with nogil:
            s = self.__this.get_info()
        return s



cdef class DeviceProxy:
    cdef Tango.cDeviceProxy *__this

    def __cinit__(self, string &name):
        with nogil:
            proxy = new Tango.cDeviceProxy(name)
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



