Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id A37BB482A
	for <parisc-linux@parisc-linux.org>; Fri, 14 Feb 2003 02:57:17 -0700 (MST)
Date: Fri, 14 Feb 2003 10:57:15 +0100
Message-ID: <3E484410000014A0@ocpmta7.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: parisc-linux@parisc-linux.org
Cc: "Bad Max" <badmax@club-internet.fr>,
	"Randolph Chung" <tausq@debian.org>,
	"John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	"Carlos O'Donell" <carlos@baldric.uwo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] glibc mallopt() pb with squid [was: Squid freeze]
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi all,

I come back to you with squid problem and glibc-2.3.

For recall, "Bax Max" asks help concerning squid hanging.

As in first reading, the Max's problem sounds similar to the one I encountered
before it works on my hppa testing (sarge) Debian, I suggest him to verify
some details (specially ulimits).
Well, it did not help.

Curious, I so installed squid testing dpkg on an unstable Debian  and effectively
it hang (very earlier because even simply query version do not work)?

Then I grab sources and try first to recompile the package with gcc-3.2 and
glibc-2.3.1-11 without optimisation (in mind the problem encountered in kernel
build): didn't help.

I ran so ddd to have a rough idea of the locking point; it appeared that
squid hangs at the first mallopt() in the following code:
[snip]
int
main(int argc, char **argv)
{
    int errcount = 0;
    int n;			/* # of GC'd objects */
    time_t loop_delay;
    mode_t oldmask;
#if defined(_SQUID_MSWIN_) || defined(_SQUID_CYGWIN_)
    int WIN32_init_err;
#endif

    debug_log = stderr;
    if (FD_SETSIZE < Squid_MaxFD)
	Squid_MaxFD = FD_SETSIZE;

#if defined(_SQUID_MSWIN_) || defined(_SQUID_CYGWIN_)
    if ((WIN32_init_err = WIN32_Subsystem_Init()))
	return WIN32_init_err;
#endif

    /* call mallopt() before anything else */
#ifdef HAVE_MALLOPT
#ifdef M_GRAIN
    /* Round up all sizes to a multiple of this */
    mallopt(M_GRAIN, 16);   <!<!<!<!<!<!<!<!<!<!<!<!< hanging here?
#endif
#ifdef M_MXFAST
    /* biggest size that is considered a small block */
    mallopt(M_MXFAST, 256);
#endif
#ifdef M_NBLKS
    /* allocate this many small blocks at once */
    mallopt(M_NLBLKS, 32);
#endif
#endif /* HAVE_MALLOPT */

To be sure, I just added some fprintf() [as in below testcase] and it confirmed
that it hangs well at this point.

On its side, Max nuke this part (not actually required) then squid works
fine.

In the hoppe to help more, I so build the following test case:
/*
 * $Id: main.c,v 1.345.2.4 2002/07/14 17:20:49 hno Exp $
 *
 * DEBUG: section 1     Startup and Main Loop
 * AUTHOR: Harvest Derived
 *
 * SQUID Web Proxy Cache          http://www.squid-cache.org/
 * ----------------------------------------------------------
 *
 *  Squid is the result of efforts by numerous individuals from
 *  the Internet community; see the CONTRIBUTORS file for full
 *  details.   Many organizations have provided support for Squid's
 *  development; see the SPONSORS file for full details.  Squid is
 *  Copyrighted (C) 2001 by the Regents of the University of
 *  California; see the COPYRIGHT file for full details.  Squid
 *  incorporates software developed and/or copyrighted by other
 *  sources; see the CREDITS file for full details.
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *  
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *  
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111, USA.
 *
 */

/*
#include "squid.h"
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

/* getpid(), geteuid()  */
#include <sys/types.h>
#include <unistd.h>

/* setgroups() */
#include <grp.h>

/* mkdir() */
#include <sys/stat.h>
#define MAXPATHLEN 256

/* waitpid() */
#include <sys/wait.h>

/* mallopt() */
#include <malloc.h>

#define SQUID_MAXFD 4096

/* autoconf.h */
/* Define if you have the mallopt function.  */
#define HAVE_MALLOPT 1

/* dlmalloc.c */
#define M_GRAIN   3    /* UNUSED in this malloc */
#define M_MXFAST  1    /* UNUSED in this malloc */

int Squid_MaxFD;		/* SQUID_MAXFD */

FILE *debug_log = NULL;

int
main(int argc, char **argv)
{
    int errcount = 0;

    debug_log = stderr;
    if (FD_SETSIZE < Squid_MaxFD)
	Squid_MaxFD = FD_SETSIZE;

    fprintf(stderr, "nb_err: %d\n", errcount);
    /* call mallopt() before anything else */

#ifdef HAVE_MALLOPT
    fprintf(stderr, "  HAVE_MALLOPT \n");
#ifdef M_GRAIN
    /* Round up all sizes to a multiple of this */
    fprintf(stderr, " M_GRAIN set: %d\n", M_GRAIN);
    mallopt(M_GRAIN, 16);
#endif
#ifdef M_MXFAST
    /* biggest size that is considered a small block */
    fprintf(stderr, " M_MXFAST set: %d\n", M_MXFAST);
    mallopt(M_MXFAST, 256);
#endif
#ifdef M_NBLKS
    /* allocate this many small blocks at once */
    fprintf(stderr, " M_NBLKS set: %d\n", M_NBLKS);
    mallopt(M_NLBLKS, 32);
#endif
#endif /* HAVE_MALLOPT */

    return 0;
}

which I compile as near as possible as the original code:
gcc -DHAVE_CONFIG_H -DDEFAULT_CONFIG_FILE=\"/etc/squid.conf\" -I. -I. -I../include
-I. -I. -I../include -I../include    -g -Wall -D_REENTRANT -c foo.c
gcc -g -Wall -D_REENTRANT  -g -o tst foo.o 

Unforunately, tst run fine.

I finally check the precompile text of the original main.c sources in which
I just encountered:
 1) # 187 "/usr/include/malloc.h" 3
    extern int mallopt (int __param, int __val)

 2) [snip]
     mallopt(3.16);
     mallopt(1,256);
    ...

Why so squid hang on this mallopt() and not tst?

Is some gcc, libc gurus (Carlos, Dave, Randolph?) could help us more to understand
this pb (squid bug or gcc - glibc bug?)

Thanks in advance,
	Joel

PS: I try to find more details in the pre-assemble (-S) test of the original
sources but I not yet able to read this kind of stuff and understand what
is done, sorry?

---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
