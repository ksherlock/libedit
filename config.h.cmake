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


/* Define to 1 if all of the C90 standard headers exist (not just the ones
   required in a freestanding environment). This macro is provided for
   backward compatibility; new code need not use it. */
#define STDC_HEADERS 1

/* Enable extensions on AIX 3, Interix.  */
#ifndef _ALL_SOURCE
#cmakedefine _ALL_SOURCE 1
#endif
/* Enable general extensions on macOS.  */
#ifndef _DARWIN_C_SOURCE
#cmakedefine _DARWIN_C_SOURCE 1
#endif
/* Enable general extensions on Solaris.  */
#ifndef __EXTENSIONS__
#cmakedefine __EXTENSIONS__ 1
#endif
/* Enable GNU extensions on systems that have them.  */
#ifndef _GNU_SOURCE
#cmakedefine _GNU_SOURCE 1
#endif
/* Enable X/Open compliant socket functions that do not require linking
   with -lxnet on HP-UX 11.11.  */
#ifndef _HPUX_ALT_XOPEN_SOCKET_API
#cmakedefine _HPUX_ALT_XOPEN_SOCKET_API 1
#endif
/* Identify the host operating system as Minix.
   This macro does not affect the system headers' behavior.
   A future release of Autoconf may stop defining this macro.  */
#ifndef _MINIX
#cmakedefine _MINIX 1
#endif
/* Enable general extensions on NetBSD.
   Enable NetBSD compatibility extensions on Minix.  */
#ifndef _NETBSD_SOURCE
#cmakedefine _NETBSD_SOURCE 1
#endif
/* Enable OpenBSD compatibility extensions on NetBSD.
   Oddly enough, this does nothing on OpenBSD.  */
#ifndef _OPENBSD_SOURCE
#cmakedefine _OPENBSD_SOURCE 1
#endif
/* Define to 1 if needed for POSIX-compatible behavior.  */
#ifndef _POSIX_SOURCE
#cmakedefine _POSIX_SOURCE 1
#endif
/* Define to 2 if needed for POSIX-compatible behavior.  */
#ifndef _POSIX_1_SOURCE
#cmakedefine _POSIX_1_SOURCE 2
#endif
/* Enable POSIX-compatible threading on Solaris.  */
#ifndef _POSIX_PTHREAD_SEMANTICS
#cmakedefine _POSIX_PTHREAD_SEMANTICS 1
#endif
/* Enable extensions specified by ISO/IEC TS 18661-5:2014.  */
#ifndef __STDC_WANT_IEC_60559_ATTRIBS_EXT__
#cmakedefine __STDC_WANT_IEC_60559_ATTRIBS_EXT__ 1
#endif
/* Enable extensions specified by ISO/IEC TS 18661-1:2014.  */
#ifndef __STDC_WANT_IEC_60559_BFP_EXT__
#cmakedefine __STDC_WANT_IEC_60559_BFP_EXT__ 1
#endif
/* Enable extensions specified by ISO/IEC TS 18661-2:2015.  */
#ifndef __STDC_WANT_IEC_60559_DFP_EXT__
#cmakedefine __STDC_WANT_IEC_60559_DFP_EXT__ 1
#endif
/* Enable extensions specified by ISO/IEC TS 18661-4:2015.  */
#ifndef __STDC_WANT_IEC_60559_FUNCS_EXT__
#cmakedefine __STDC_WANT_IEC_60559_FUNCS_EXT__ 1
#endif
/* Enable extensions specified by ISO/IEC TS 18661-3:2015.  */
#ifndef __STDC_WANT_IEC_60559_TYPES_EXT__
#cmakedefine __STDC_WANT_IEC_60559_TYPES_EXT__ 1
#endif
/* Enable extensions specified by ISO/IEC TR 24731-2:2010.  */
#ifndef __STDC_WANT_LIB_EXT2__
#cmakedefine __STDC_WANT_LIB_EXT2__ 1
#endif
/* Enable extensions specified by ISO/IEC 24747:2009.  */
#ifndef __STDC_WANT_MATH_SPEC_FUNCS__
#cmakedefine __STDC_WANT_MATH_SPEC_FUNCS__ 1
#endif
/* Enable extensions on HP NonStop.  */
#ifndef _TANDEM_SOURCE
#cmakedefine _TANDEM_SOURCE 1
#endif
/* Enable X/Open extensions.  Define to 500 only if necessary
   to make mbstate_t available.  */
#ifndef _XOPEN_SOURCE
#cmakedefine _XOPEN_SOURCE 500
#endif

/* Version number of package */
#cmakedefine VERSION "@VERSION@"



#include "sys.h"
#define SCCSID
#undef LIBC_SCCS
#define lint

