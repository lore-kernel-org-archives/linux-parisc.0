Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id D13804837
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 09:38:02 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscali)
	id 18vJu5-0006Q5-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 17:25:29 +0100
Date: Tue, 18 Mar 2003 17:25:28 +0100
Message-ID: <3E68A39600002063@ocpmta7.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] squid pb with glibc-2.3.1 and pthread (pb reproduced now)
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

Sorry in advance if am annoying but remember this test case:

(the very begining of squid main())

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
    mode_t oldmask;

    debug_log = stderr;
    if (FD_SETSIZE < Squid_MaxFD)
	Squid_MaxFD = FD_SETSIZE;

    fprintf(stderr, "nb_err: %d\n", errcount);
    /* call mallopt() before anything else */

#ifdef HAVE_MALLOPT
    fprintf(stderr, "  HAVE_MALLOPT \n");
#ifdef M_GRAIN
    /* Round up all sizes to a multiple of this */
    fprintf(stderr, " M_GRAIN seti: %d\n", M_GRAIN);
    mallopt(M_GRAIN, 16);
#endif
#ifdef M_MXFAST
    /* biggest size that is considered a small block */
    fprintf(stderr, " M_MXFAST seti: %d\n", M_MXFAST);
    mallopt(M_MXFAST, 256);
#endif
#ifdef M_NBLKS
    /* allocate this many small blocks at once */
    fprintf(stderr, " M_NBLKS set: %d\n", M_NBLKS);
    mallopt(M_NLBLKS, 32);
#endif
#endif /* HAVE_MALLOPT */

/*
    oldmask = umask(S_IRWXO);
 */

    return 0;
}

At this time I compiled it simply:
gcc -o foo foo.c

run it ./foo and no problem :_((  [very very bad it didn't reproduced the
pb]

Now recompile it with pthread lib (useless for this test case never the less
here usefull):

gcc -o foo -l pthread foo.c

run it ./foo and now it loop :)

(hmm squid can work without maollopt but not pthread afaik)

Joel




---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
