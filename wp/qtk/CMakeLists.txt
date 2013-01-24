set(QTK_FUNCTORS_1
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkImageLibBoot.oz")

set(QTK_FUNCTORS_2
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkDropdownbutton_bitmap.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkNumberentry_bitmap.oz")

set(QTK_FUNCTORS_3
    "${CMAKE_CURRENT_SOURCE_DIR}/PrintCanvas.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/Prototyper.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTk.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkBare.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkButton.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkCanvas.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkCheckbutton.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkDevel.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkDropdownlistbox.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkEntry.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkFrame.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkGrid.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkImage.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkLabel.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkListbox.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkMenu.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkNumberentry.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkPanel.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkPlaceholder.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkRadiobutton.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkRubberframe.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkScale.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkScrollbar.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkScrollframe.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkSpace.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkText.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/QTkToolbar.oz"
    "${CMAKE_CURRENT_SOURCE_DIR}/TkTranslator.oz")

set(QTK_FUNCTORS_OZF "")

set(QTK_FUNCTORS_OZF_0 "")

foreach(STAGE 1 2 3)
  set(QTK_FUNCTORS_OZF_${STAGE} "")

  math(EXPR PREV_STAGE "${STAGE} - 1")
  set(PREV_STAGE_OZF ${QTK_FUNCTORS_OZF_${PREV_STAGE}})

  foreach(FUNCTOR ${QTK_FUNCTORS_${STAGE}})
    get_filename_component(FUNCTOR_BASENAME ${FUNCTOR} NAME_WE)
    set(FUNCTOR_OZF "${CMAKE_CURRENT_BINARY_DIR}/${FUNCTOR_BASENAME}.ozf")

    set(QTK_FUNCTORS_OZF_${STAGE} ${QTK_FUNCTORS_OZF_${STAGE}} "${FUNCTOR_OZF}")
    set(QTK_FUNCTORS_OZF ${QTK_FUNCTORS_OZF} "${FUNCTOR_OZF}")

    add_custom_command(
      OUTPUT "${FUNCTOR_OZF}"
      COMMAND ozemulator
        --search-load "all=${CMAKE_CURRENT_BINARY_DIR}:cache=${MOZART_BUILD_DIR}/lib/cache"
        x-oz://system/Compile.ozf
        -c "${FUNCTOR}"
        -o "${FUNCTOR_OZF}"
      WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
      DEPENDS library "${FUNCTOR}" ${PREV_STAGE_OZF}
      COMMENT "(compiling) ${FUNCTOR_OZF}"
      VERBATIM)
  endforeach()
endforeach()

add_custom_target(
  qtklibrary ALL
  DEPENDS ${QTK_FUNCTORS_OZF})

# Install
install(FILES ${QTK_FUNCTORS_OZF} DESTINATION share/mozart/cache/x-oz/system/wp)
