/* config.h.cmake  */

/* Define to 1 if you have the <curses.h> header file. */
#cmakedefine HAVE_CURSES_H

/* Define to 1 if you have the <ncurses.h> header file. */
#cmakedefine HAVE_NCURSES_H

/* Define to 1 if you have the <sys/cdefs.h> header file. */
#cmakedefine HAVE_SYS_CDEFS_H

/* Define to 1 if you have the <sys/types.h> header file. */
#cmakedefine HAVE_SYS_TYPES_H

/* Define to 1 if you have the <termcap.h> header file. */
#cmakedefine HAVE_TERMCAP_H

/* Define to 1 if you have the <term.h> header file. */
#cmakedefine HAVE_TERM_H

/* Define to 1 if you have the <stdint.h> header file. */
#cmakedefine HAVE_STDINT_H

/* Define to 1 if you have the `getline' function. */
#cmakedefine HAVE_GETLINE

/* Define to 1 if you have getpwnam_r and getpwuid_r that are draft POSIX.1
   versions. */
#cmakedefine HAVE_GETPW_R_DRAFT

/* Define to 1 if you have getpwnam_r and getpwuid_r that are POSIX.1
   compatible. */
#cmakedefine HAVE_GETPW_R_POSIX

/* Define to 1 if you have the `issetugid' function. */
#cmakedefine HAVE_ISSETUGID

/* Define to 1 if you have the `secure_getenv' function. */
#cmakedefine HAVE_SECURE_GETENV

/* Define to 1 if you have the `__secure_getenv' function. */
#cmakedefine HAVE___SECURE_GETENV

/* Define to 1 if you have the `strlcat' function. */
#cmakedefine HAVE_STRLCAT

/* Define to 1 if you have the `strlcpy' function. */
#cmakedefine HAVE_STRLCPY

/* Define to 1 if the system has the type `u_int32_t'. */
#cmakedefine HAVE_U_INT32_T

/* Define to 1 if you have the `vis' function. */
#cmakedefine HAVE_VIS

/* Define to 1 if you have the `unvis' function. */
#cmakedefine HAVE_UNVIS

/* Define to 1 if you have the `wcsdup' function. */
#cmakedefine HAVE_WCSDUP

/* Define to 1 if you have the `reallocarr' function. */
#cmakedefine HAVE_REALLOCARR

/* Name of package */
#cmakedefine PACKAGE "@PACKAGE@"

/* Define to the address where bug reports for this package should be sent. */
#cmakedefine PACKAGE_BUGREPORT "@PACKAGE_BUGREPORT@"

/* Define to the full name of this package. */
#cmakedefine PACKAGE_NAME "@PACKAGE_NAME@"

/* Define to the full name and version of this package. */
#cmakedefine PACKAGE_STRING "@PACKAGE_STRING@"

/* Define to the one symbol short name of this package. */
#cmakedefine PACKAGE_TARNAME "@PACKAGE_TARNAME@"

/* Define to the home page for this package. */
#cmakedefine PACKAGE_URL "@PACKAGE_URL@"

/* Define to the version of this package. */
#cmakedefine PACKAGE_VERSION "@PACKAGE_VERSION@"



/* Enable extensions on AIX 3, Interix.  */
#ifndef _ALL_SOURCE
# undef _ALL_SOURCE
#endif
/* Enable GNU extensions on systems that have them.  */
#ifndef _GNU_SOURCE
# undef _GNU_SOURCE
#endif
/* Enable threading extensions on Solaris.  */
#ifndef _POSIX_PTHREAD_SEMANTICS
# undef _POSIX_PTHREAD_SEMANTICS
#endif
/* Enable extensions on HP NonStop.  */
#ifndef _TANDEM_SOURCE
# undef _TANDEM_SOURCE
#endif
/* Enable general extensions on Solaris.  */
#ifndef __EXTENSIONS__
# undef __EXTENSIONS__
#endif


/* Version number of package */
#cmakedefine VERSION "@VERSION@"



#include "sys.h"
#define SCCSID
#undef LIBC_SCCS
#define lint

