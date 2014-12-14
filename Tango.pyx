cimport Tango	
	

cdef class Database:
    """Tango Database object"""

    cdef Tango.cDatabase *__this

    def __cinit0__(self):
        with nogil:
            db = new Tango.cDatabase()
        self.__this = db

    def __cinit1__(self, string &name, int port):
        with nogil:
            db = new Tango.cDatabase(name, port)
        self.__this = db

    def __cinit2__(self, string &file):
        with nogil:
            db = new Tango.cDatabase(file)
        self.__this = db

    def __cinit__(self, string &name=None, int port=None):
        if name == None:
            self.__cinit0__()
        elif port == None:
            self.__cinit1__(name)
        else:
            self.__cinit2__(name, port)

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



