from libcpp.string cimport string
from libcpp.vector cimport vector


cdef extern from "tango.h" namespace "Tango" nogil:

    cdef cppclass cDeviceProxy "Tango::DeviceProxy":

        # network methods

        cDeviceProxy(string &name) except +

        string status() except +
        string name() except +

        vector[string]* get_attribute_list() except +
        vector[string]* get_command_list() except +

	# local methods

        string dev_name()


