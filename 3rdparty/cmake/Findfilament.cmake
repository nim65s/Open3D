find_path(filament_INCLUDE_DIR NAMES filament/FilamentAPI.h)
find_library(filament_LIBRARY NAMES filament PATH_SUFFIXES x86_64)

if(filament_INCLUDE_DIR AND filament_LIBRARY)
    add_library(filament::filament UNKNOWN IMPORTED)
    set_target_properties(
        filament::filament
        PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${filament_INCLUDE_DIR}"
            IMPORTED_LOCATION "${filament_LIBRARY}"
    )
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
    filament
    DEFAULT_MSG
    filament_LIBRARY
    filament_INCLUDE_DIR
)
