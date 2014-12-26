from libcpp.string cimport string
from libcpp.vector cimport vector


cdef extern from "tango.h" namespace "Tango":

    cdef cppclass cDeviceProxy "Tango::DeviceProxy":

        # network methods

        cDeviceProxy(string &) nogil except +

        string status() nogil except +
        string name() nogil except +

        vector[string]* get_attribute_list() nogil except +

	# local methods

        string dev_name()


