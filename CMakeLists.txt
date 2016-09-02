cmake_minimum_required(VERSION 3.1)

INCLUDE (CheckFunctionExists)
INCLUDE (CheckTypeSize)
INCLUDE (CheckIncludeFile)
INCLUDE (CheckCSourceCompiles)



# sets HAVE_SYS_TYPES_H, HAVE_STDINT_H, and HAVE_STDDEF_H
CHECK_TYPE_SIZE(u_int32_t U_INT32_T)

CHECK_INCLUDE_FILE(curses.h HAVE_CURSES_H)
CHECK_INCLUDE_FILE(ncurses.h HAVE_NCURSES_H)
CHECK_INCLUDE_FILE(sys/cdefs.h HAVE_SYS_CDEFS_H)
CHECK_INCLUDE_FILE(termcap.h HAVE_TERMCAP_H)
CHECK_INCLUDE_FILE(term.h HAVE_TERM_H)

SET(CMAKE_EXTRA_INCLUDE_FILES stdio.h)
CHECK_FUNCTION_EXISTS(getline HAVE_GETLINE)
SET(CMAKE_EXTRA_INCLUDE_FILES)

SET(CMAKE_EXTRA_INCLUDE_FILES stdlib.h)
CHECK_FUNCTION_EXISTS(secure_getenv HAVE_SECURE_GETENV)
CHECK_FUNCTION_EXISTS(__secure_getenv HAVE___SECURE_GETENV)
SET(CMAKE_EXTRA_INCLUDE_FILES)


SET(CMAKE_EXTRA_INCLUDE_FILES unistd.h)
CHECK_FUNCTION_EXISTS(issetugid HAVE_ISSETUGID)
SET(CMAKE_EXTRA_INCLUDE_FILES)

SET(CMAKE_EXTRA_INCLUDE_FILES string.h)
CHECK_FUNCTION_EXISTS(strlcat HAVE_STRLCAT)
CHECK_FUNCTION_EXISTS(strlcpy HAVE_STRLCPY)
SET(CMAKE_EXTRA_INCLUDE_FILES)

SET(CMAKE_EXTRA_INCLUDE_FILES wchar.h)
CHECK_FUNCTION_EXISTS(wcsdup HAVE_WCSDUP)
SET(CMAKE_EXTRA_INCLUDE_FILES)

SET(CMAKE_EXTRA_INCLUDE_FILES vis.h)
CHECK_FUNCTION_EXISTS(vis HAVE_VIS)
CHECK_FUNCTION_EXISTS(unvis HAVE_UNVIS)
SET(CMAKE_EXTRA_INCLUDE_FILES)

CHECK_C_SOURCE_COMPILES("
#include <stdlib.h>
#include <sys/types.h>
#include <pwd.h>
void main(void) {
	getpwnam_r(NULL, NULL, NULL, (size_t)0, NULL);
	getpwuid_r((uid_t)0, NULL, NULL, (size_t)0, NULL);
}
"
HAVE_GETPW_R_POSIX)

CHECK_C_SOURCE_COMPILES("
#include <stdlib.h>
#include <sys/types.h>
#include <pwd.h>
void main(void) {
	getpwnam_r(NULL, NULL, NULL, (size_t)0);
	getpwuid_r((uid_t)0, NULL, NULL, (size_t)0);
}
"
HAVE_GETPW_R_DRAFT)

set(VERSION "3.1")
set(PACKAGE_NAME "libedit")
set(PACKAGE_STRING "libedit 3.1")

configure_file(config.h.cmake ${CMAKE_CURRENT_SOURCE_DIR}/config.h)

add_custom_command(
	OUTPUT src/common.h src/emacs.h src/vi.h src/fcns.h src/func.h src/help.h
	COMMAND sh src/makelist -h src/common.c > src/common.h
	COMMAND sh src/makelist -h src/emacs.c > src/emacs.h
	COMMAND sh src/makelist -h src/vi.c > src/vi.h
	COMMAND sh src/makelist -fh src/common.h src/emacs.h src/vi.h > src/fcns.h
	COMMAND sh src/makelist -fc src/common.h src/emacs.h src/vi.h > src/func.h
	COMMAND sh src/makelist -bh src/common.h src/emacs.h src/vi.h > src/help.h
	MAIN_DEPENDENCY src/common.c
	DEPENDS src/emacs.h src/vi.h
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)


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
src/terminal.c
src/tokenizer.c
src/tokenizern.c
src/tty.c
src/vi.c
$<$<NOT:$<BOOL:HAVE_STRLCAT>>:src/strlcat.c>
$<$<NOT:$<BOOL:HAVE_STRLCPY>>:src/strlcpy.c>
$<$<NOT:$<BOOL:HAVE_VIS>>:src/vis.c>
$<$<NOT:$<BOOL:HAVE_UNVIS>>:src/unvis.c>
$<$<NOT:$<BOOL:HAVE_WCSDUP>>:src/wcsdup.c>
)


set(CMAKE_INCLUDE_CURRENT_DIR ON)
include_directories(src)

add_library(LIBEDIT ${LIBEDIT_SRC})
