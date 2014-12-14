from libcpp.string cimport string
from libcpp.vector cimport vector

cdef extern from "tango.h" namespace "Tango":

    cdef cppclass cDeviceProxy "Tango::DeviceProxy":
        cDeviceProxy(string &) nogil except +

        string status() nogil except +
        string name() nogil except +

	# Local methods
        string dev_name()

