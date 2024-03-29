cmake_minimum_required(VERSION 3.1)
project(libedit)

INCLUDE (CheckFunctionExists)
INCLUDE (CheckLibraryExists)
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
CHECK_INCLUDE_FILE(minix/config.h HAVE_MINIX_CONFIG_H)

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


SET(CMAKE_EXTRA_INCLUDE_FILES stdlib.h)
CHECK_FUNCTION_EXISTS(reallocarr HAVE_REALLOCARR)
SET(CMAKE_EXTRA_INCLUDE_FILES)

CHECK_LIBRARY_EXISTS(ncurses tgetent "" HAVE_LIBNCURSES)
if (NOT HAVE_LIBNCURSES)
	CHECK_LIBRARY_EXISTS(curses tgetent "" HAVE_LIBCURSES)
	if (NOT HAVE_LIBCURSES)
		CHECK_LIBRARY_EXISTS(termcap tgetent "" HAVE_LIBTERMCAP)
		if (NOT HAVE_LIBTERMCAP)
			CHECK_LIBRARY_EXISTS(tinfo tgetent "" HAVE_LIBTINFO)
		endif()
	endif()
endif()

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


CHECK_C_SOURCE_COMPILES("
#include <wchar.h>
mbstate_t x;
int main (void) {
  return 0;
}
"
NO_XOPEN_SOURCE)
if (NOT NO_XOPEN_SOURCE)
	CHECK_C_SOURCE_COMPILES("
	#define _XOPEN_SOURCE 500
	#include <wchar.h>
	mbstate_t x;
	int main (void) {
	  return 0;
	}
	"
	_XOPEN_SOURCE)
endif()

set(VERSION "3.1")
set(PACKAGE_NAME "libedit")
set(PACKAGE_STRING "libedit 3.1")

set(_ALL_SOURCE 1)
set(_DARWIN_C_SOURCE 1)
set(__EXTENSIONS__ 1)
set(_GNU_SOURCE 1)
set(_HPUX_ALT_XOPEN_SOCKET_API 1)
set(_NETBSD_SOURCE 1)
set(_OPENBSD_SOURCE 1)
set(_POSIX_PTHREAD_SEMANTICS 1)
set(__STDC_WANT_IEC_60559_ATTRIBS_EXT__ 1)
set(__STDC_WANT_IEC_60559_BFP_EXT__ 1)
set(__STDC_WANT_IEC_60559_DFP_EXT__ 1)
set(__STDC_WANT_IEC_60559_FUNCS_EXT__ 1)
set(__STDC_WANT_IEC_60559_TYPES_EXT__ 1)
set(__STDC_WANT_LIB_EXT2__ 1)
set(__STDC_WANT_MATH_SPEC_FUNCS__ 1)
set(_TANDEM_SOURCE 1)

if (HAVE_MINIX_CONFIG_H)
	set(_MINIX 1)
	set(_POSIX_SOURCE 1)
	set(_POSIX_1_SOURCE 2)
endif()

# TODO -- __EXTENSIONS__

configure_file(config.h.cmake config.h)

# copy header files to the build dir.
# these copy everytime cmake runs.
file(COPY src/histedit.h DESTINATION include)
file(COPY src/editline/readline.h DESTINATION include)

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
	src/literal.c
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

	$<$<NOT:$<BOOL:${HAVE_STRLCAT}>>:src/strlcat.c>
	$<$<NOT:$<BOOL:${HAVE_STRLCPY}>>:src/strlcpy.c>
	$<$<NOT:$<BOOL:${HAVE_VIS}>>:src/vis.c>
	$<$<NOT:$<BOOL:${HAVE_UNVIS}>>:src/unvis.c>
	$<$<NOT:$<BOOL:${HAVE_WCSDUP}>>:src/wcsdup.c>
	$<$<NOT:$<BOOL:${HAVE_GETLINE}>>:src/getline.c>
	$<$<NOT:$<BOOL:${HAVE_REALLOCARR}>>:src/reallocarr.c>

)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
include_directories(src)

# generated headers
set(GHDR
	${CMAKE_CURRENT_BINARY_DIR}/common.h
	${CMAKE_CURRENT_BINARY_DIR}/emacs.h
	${CMAKE_CURRENT_BINARY_DIR}/vi.h
	${CMAKE_CURRENT_BINARY_DIR}/fcns.h
	${CMAKE_CURRENT_BINARY_DIR}/func.h
	${CMAKE_CURRENT_BINARY_DIR}/help.h
)

# headers for other people to use.
set(GINCLUDES
	${CMAKE_CURRENT_BINARY_DIR}/include/readline.h
	${CMAKE_CURRENT_BINARY_DIR}/include/histedit.h
)

add_library(LIBEDIT ${LIBEDIT_SRC} ${GHDR} ${GINCLUDES})
target_link_libraries(LIBEDIT INTERFACE
	$<$<BOOL:${HAVE_LIBNCURSES}>:ncurses>
	$<$<BOOL:${HAVE_LIBCURSES}>:curses>
	$<$<BOOL:${HAVE_LIBTERMCAP}>:termcap>
	$<$<BOOL:${HAVE_LIBTINFO}>:tinfo>
)

target_compile_options(LIBEDIT PRIVATE -g)

target_include_directories(LIBEDIT INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/include)

set(SRC ${CMAKE_CURRENT_SOURCE_DIR}/src)
set(AHDR vi.h emacs.h common.h)
set(ASRC ${SRC}/vi.c ${SRC}/emacs.c ${SRC}/common.c)
add_custom_command(
	OUTPUT ${GHDR}
	COMMAND sh ${SRC}/makelist -h ${SRC}/common.c > common.h
	COMMAND sh ${SRC}/makelist -h ${SRC}/emacs.c > emacs.h
	COMMAND sh ${SRC}/makelist -h ${SRC}/vi.c > vi.h
	COMMAND sh ${SRC}/makelist -fh ${AHDR} > fcns.h
	COMMAND sh ${SRC}/makelist -fc ${AHDR} > func.h
	COMMAND sh ${SRC}/makelist -bh ${ASRC} > help.h
	DEPENDS ${ASRC}
	# WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

# copy header files to the build dir.
# these should only copy if they actually change.
# add_custom_command(
# 	OUTPUT include/readline.h include/histedit.h
# 	COMMAND ${CMAKE_COMMAND} -E copy_if_different ${SRC}/editline/readline.h ${SRC}/histedit.h include
# 	DEPENDS ${SRC}/editline/readline.h ${SRC}/histedit.h
# )

add_custom_command(
	OUTPUT include/readline.h
	COMMAND ${CMAKE_COMMAND} -E copy ${SRC}/editline/readline.h include
	DEPENDS ${SRC}/editline/readline.h
)

add_custom_command(
	OUTPUT include/histedit.h
	COMMAND ${CMAKE_COMMAND} -E copy ${SRC}/histedit.h include
	DEPENDS ${SRC}/histedit.h
)

# example programs
add_executable(tc1 examples/tc1.c)
target_link_libraries(tc1 LIBEDIT)

add_executable(wtc1 examples/wtc1.c)
target_link_libraries(wtc1 LIBEDIT)

add_executable(fileman examples/fileman.c)
target_link_libraries(fileman LIBEDIT)
