find_path(liblzf_INCLUDE_DIR NAMES lzf.h)
find_library(liblzf_LIBRARY NAMES lzf)

if(liblzf_INCLUDE_DIR AND liblzf_LIBRARY)
    add_library(liblzf::liblzf UNKNOWN IMPORTED)
    set_target_properties(
        liblzf::liblzf
        PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${liblzf_INCLUDE_DIR}"
            IMPORTED_LOCATION "${liblzf_LIBRARY}"
    )
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
    liblzf
    DEFAULT_MSG
    liblzf_LIBRARY
    liblzf_INCLUDE_DIR
)
