
INCLUDE (CheckFunctionExists)
INCLUDE (CheckLibraryExists)

set(LIBEDIT_SRC 
src/chared.c
src/chartype.c
src/common.c
src/el.c
src/eln.c
src/emacs.c
src/filecomplete.c
src/hist.c
src/history.c
src/historyn.c
src/keymacro.c
src/map.c
src/parse.c
src/prompt.c
src/read.c
src/readline.c
src/refresh.c
src/search.c
src/sig.c
src/strlcat.c
src/strlcpy.c
src/terminal.c
src/tokenizer.c
src/tokenizern.c
src/tty.c
src/unvis.c
src/vi.c
src/vis.c
src/wcsdup.c
)

configure_file(config.h.cmake ${CMAKE_CURRENT_SOURCE_DIR}/config.h)
add_library(LIBEDIT ${LIBEDIT_SRC})
