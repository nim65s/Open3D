find_path(filament_INCLUDE_DIR NAMES filament/FilamentAPI.h)
find_library(filament_LIBRARY NAMES filament PATH_SUFFIXES x86_64)

if(filament_INCLUDE_DIR AND filament_LIBRARY)
    add_library(filament::filament INTERFACE IMPORTED)
    target_include_directories(filament::filament INTERFACE ${filament_INCLUDE_DIR})
    target_link_libraries(filament::filament INTERFACE ${filament_LIBRARY})

    find_library(filament_utils NAMES utils PATH_SUFFIXES x86_64)
    find_library(filament_filabridge NAMES filabridge PATH_SUFFIXES x86_64)
    find_library(filament_backend NAMES backend PATH_SUFFIXES x86_64)
    find_library(filament_geometry NAMES geometry PATH_SUFFIXES x86_64)
    find_library(filament_bluegl NAMES bluegl PATH_SUFFIXES x86_64)
    find_library(filament_bluevk NAMES bluevk PATH_SUFFIXES x86_64)
    find_library(filament_filaflat NAMES filaflat PATH_SUFFIXES x86_64)
    find_library(filament_ibl NAMES ibl PATH_SUFFIXES x86_64)
    find_library(filament_image NAMES image PATH_SUFFIXES x86_64)
    find_library(filament_ktxreader NAMES ktxreader PATH_SUFFIXES x86_64)
    target_link_libraries(filament::filament INTERFACE
        ${filament_utils}
        ${filament_filabridge}
        ${filament_backend}
        ${filament_geometry}
        ${filament_bluegl}
        ${filament_bluevk}
        ${filament_filaflat}
        ${filament_ibl}
        ${filament_image}
        ${filament_ktxreader}
    )
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
    filament
    DEFAULT_MSG
    filament_LIBRARY
    filament_INCLUDE_DIR
)
