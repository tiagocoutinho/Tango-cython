cimport tango.database


cdef class Database:
    """Tango Database object"""

    cdef tango.database.cDatabase *__this

    def __cinit_default__(self):
        with nogil:
            db = new tango.database.cDatabase()
        self.__this = db

    def __cinit_host__(self, string &host, int port):
        with nogil:
            db = new tango.database.cDatabase(host, port)
        self.__this = db

    def __cinit_file__(self, string &file):
        with nogil:
            db = new tango.database.cDatabase(file)
        self.__this = db

    def __init__(self, name=None, port=None):
        if name is None:
            if port is None:
                self.__cinit_default__()
            else:
                raise ValueError("If port specified, must specify host")
        else:
            if port is None:
                self.__cinit_file__(name)
            else:
                self.__cinit_host__(name, port)

    def __dealloc__(self):
        del self.__this

    def get_info(self):
        with nogil:
            s = self.__this.get_info()
        return s

