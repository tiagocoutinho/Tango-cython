from libcpp.string cimport string
from libcpp.vector cimport vector

cdef extern from "tango.h" namespace "Tango":

    cdef cppclass cDatabase "Tango::Database":
        cDatabase() nogil except +
        cDatabase(string &name, int port) nogil except +
        cDatabase(string &file) nogil except +

        string get_info() nogil except +


