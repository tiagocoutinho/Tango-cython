from libcpp.string cimport string
from libcpp.vector cimport vector

cdef extern from "tango.h" namespace "Tango":

    cdef cppclass cDatabase "Tango::Database":
        cDatabase() nogil except +

        string get_info() nogil except +
	 

    cdef cppclass cDeviceProxy "Tango::DeviceProxy":
        cDeviceProxy(string &) nogil except +

        string status() nogil except +
        string name() nogil except +

	# Local methods
        string dev_name()
	