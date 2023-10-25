
# ============================================================================
# ------------------------------ Compiler Flags ------------------------------
# set_source_files_properties( ${OF_SOURCE_FILES} PROPERTIES COMPILE_FLAGS " -Wall -fPIC " )
set_source_files_properties( ${OF_SOURCE_FILES} PROPERTIES COMPILE_FLAGS " -w -fPIC  " )

# ============================================================================
# ------------------------------ Compile and Link ----------------------------
if (OF_BUILD_AS_LIBRARY)
  add_library( ${APP_NAME} OBJECT ${${APP_NAME}_SOURCE_FILES})
  set_target_properties( ${APP_NAME} PROPERTIES POSITION_INDEPENDENT_CODE TRUE )
else()
  add_executable( ${APP_NAME} ${${APP_NAME}_SOURCE_FILES} )
endif()

target_include_directories( ${APP_NAME}
  PUBLIC
  ${OF_APP_INCLUDE_DIR}
)

set_target_properties( of_shared PROPERTIES POSITION_INDEPENDENT_CODE TRUE )
target_link_libraries( ${APP_NAME} PRIVATE
                        $<TARGET_FILE:of_shared>
                        ${opengl_lib}
                        ${OF_CORE_FRAMEWORKS}
                        ${OFX_ADDONS_ACTIVE}
                    )
# target_link_libraries(${APP_NAME} ${OF_CORE_LIBS})  # OF_CORE_STATIC_LIBS includes OF_CORE_LIBS

if(OF_BUILD_AS_LIBRARY)
  set_target_properties(${APP_NAME} PROPERTIES LINKER_LANGUAGE C)
  target_link_libraries(${APP_NAME} PRIVATE
    ${OF_CORE_STATIC_LIBS})
  install(DIRECTORY ${OF_APP_INCLUDE_DIR} DESTINATION include/${APP_NAME})
else()
  target_link_libraries(${APP_NAME} PRIVATE ${OF_CORE_STATIC_LIBS})
endif()
