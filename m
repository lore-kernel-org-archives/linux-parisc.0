Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 54ED64830
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 Jan 2003 10:01:32 -0700 (MST)
Date: Wed, 29 Jan 2003 18:01:26 +0100
Message-ID: <3E35CAE7000006D8@ocpmta7.freegates.net>
In-Reply-To: <20030113031109.GI1177@tausq.org>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Issues with seteuid()?
To: "Randolph Chung" <tausq@debian.org>,
	"Matthew Wilcox" <willy@debian.org>
Cc: "Luigi Gangitano" <luigi@debian.org>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi Randolph,

As per your request, I do spent some time to compose this 'small' test case
bases on simplified parts of squid:

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


char *effectiveUser="proxy";
uid_t effectiveUserID=13;
gid_t effectiveGroupID=13;

/* Define if you have the setgroups function.  */
#define HAVE_SETGROUPS 1

/*
 * Yay! Another Linux brokenness.  Its not good enough to know that
 * setresuid() exists, because RedHat 5.0 declare setresuid() but
 * doesn't implement it.
 */
#define HAVE_SETRESUID 1

#undef HAVE_SETRESUID
/*
 */

/*
man setresuid NOTES:
       Under  HP-UX  and  FreeBSD the prototype is found in <unistd.h>. 
Under
       Linux there is so far no include file giving the prototype - this
is  a
       glibc bug. Programs using this system call must add the prototype
them-
       selves.
*/
#ifdef HAVE_SETRESUID
/* because man setresuid mentionned it as a lake of linux? */
int
setresuid(uid_t ruid, uid_t euid, uid_t suid);
#endif

/* Define if you have the seteuid function.  */
#define HAVE_SETEUID 1

/*
 * xstrerror() - strerror() wrapper
 */
const char *
xstrerror(void)
{
    static char xstrerror_buf[BUFSIZ];
    static char strerror_buf[BUFSIZ];

    snprintf(strerror_buf, BUFSIZ, "%s", strerror(errno));
   
    if (strerror_buf) 
	snprintf(xstrerror_buf, BUFSIZ, "(%d) %s", errno, strerror_buf);
    else
        snprintf(xstrerror_buf, BUFSIZ, "(%d) Unknown", errno); 
    return xstrerror_buf;
}

/* leave a privilegied section. (Give up any privilegies)
 * Routines that need privilegies can rap themselves in enter_suid()
 * and leave_suid()
 * To give upp all posibilites to gain privilegies use no_suid()
 */
void
leave_suid(void)
{
    fprintf(stderr, "leave_suid: PID %d called\n", (int) getpid());
    if (geteuid() != 0)
	return;
    /* Started as a root, check suid option */
    if (effectiveUser == NULL)
	return;
#if HAVE_SETGROUPS
    setgroups(1, &effectiveGroupID);
#endif
    if (setgid(effectiveGroupID) < 0)
	fprintf(stderr, "ALERT: setgid: %s\n", xstrerror());
    fprintf(stderr, "leave_suid: PID %d giving up root, becoming '%s'\n",
(int) getpid(), effectiveUser);
#if HAVE_SETRESUID
    if (setresuid(effectiveUserID, effectiveUserID, 0) < 0)
	fprintf(stderr, "ALERT: setresuid: %s\n", xstrerror());
#elif HAVE_SETEUID
    if (seteuid(effectiveUserID) < 0)
	fprintf(stderr, "ALERT: seteuid: %s\n", xstrerror());
#else
    if (setuid(effectiveUserID) < 0)
	fprintf(stderr, "ALERT: setuid: %s\n", xstrerror());
#endif
}

static void
setEffectiveUser(void)
{
    leave_suid();		/* Run as non privilegied user */
    if (geteuid() == 0) {
	fprintf(stderr, "Squid is not safe to run as root!  If you must\n");
	fprintf(stderr, "start Squid as root, then you must configure\n");
	fprintf(stderr, "it to run as a non-priveledged user with the\n");
	fprintf(stderr, "'cache_effective_user' option in the config file.\n");
	fprintf(stderr, "Don't run Squid as root, set 'cache_effective_user'!\n");
        abort();
    }
}

static int
storeUfsDirCreateDirectory(const char *path)
{
    int created = 0;

    if (0 != mkdir(path, 0755)) {
	fprintf(stderr,	"Failed to make swai directory %s: %s\n",
	    path, xstrerror());
    }
    return created;
}

static void
storeUfsDirCreateSwapSubDirs(char * Path)
{
    int i, k;
    static char name[MAXPATHLEN];
    for (i = 0; i < 16; i++) {
	snprintf(name, MAXPATHLEN, "%s/%02X", Path, i);
        storeUfsDirCreateDirectory(name);
	fprintf(stderr, "Making directories in %s\n", name);
	for (k = 0; k < 32; k++) {
	    snprintf(name, MAXPATHLEN, "%s/%02X/%02X", Path, i, k);
            storeUfsDirCreateDirectory(name);
	}
    }
}


static void
storeUfsDirNewfs(char * Path)
{
    fprintf(stderr, "Creating swap space in %s\n", Path);
    storeUfsDirCreateSwapSubDirs(Path);
}

void
storeCreateSwapDirectories(void)
{
    int i;
    pid_t pid;
    int status;
    for (i = 0; i < 1; i++) {
	if (fork())
	    continue;
        storeUfsDirNewfs("/var/spool/squid");
	exit(0);
    }
    do {
	pid = waitpid(-1, &status, 0);
    } while (pid > 0 || (pid < 0 && errno == EINTR));
}


int
main(int argc, char **argv)
{
    /* only opt_create_swap_dirs */

    setEffectiveUser();
    fprintf(stderr, "Creating Swap Directories\n");
    storeCreateSwapDirectories();

    return 0;
}

A. On a testing debian system (ie gcc-3.0 3.0.4-10 && libc6 2.2.5-14.3) and
the very last kernel 2.4.20-pa23:

Compile with gcc -O 2 -Wall -D_REENTRANT foo.c -o foo

[ Create a user and a group named proxy with id 13 for both ]

First as it is ./foo would failled to fork() immediately with 'Segmentation
fault'.

Secondly edit foo.c to comment out #undifined HAVE_SETRESUID; it would reach
to fork without problem (eventhough it did not reach to create dir)

B. On an unstable debian (ie gcc-3.2 3.2.2-0pre6 && libc6 2.3.1-10) running
the same kernel: this problem doesn't occure.

hth,
    Joel


>-- Original Message --
>From: Randolph Chung <tausq@debian.org>
>To: Matthew Wilcox <willy@debian.org>
>Cc: Luigi Gangitano <luigi@debian.org>,
>	parisc-linux@lists.parisc-linux.org
>Subject: Re: [parisc-linux] Issues with seteuid()?
>Reply-To: Randolph Chung <tausq@debian.org>
>Date: Sun, 12 Jan 2003 19:11:09 -0800
>
>
>> I wonder how it can be a problem at all.  The kernel implements only
>> sys_setresuid() and i would imagine that glibc implements both
>> seteuid() and setresuid() in terms of this system call.
>> 
>> Perhaps someone who's willing to touch glibc would care to comment?
>
>seteuid() works fine in simple tests. i don't think it's seteuid...
>something else is broken. can someone provide a simple test case for the
>segfault?
>
>randolph
>-- 
>Randolph Chung
>Debian GNU/Linux Developer, hppa/ia64 ports
>http://www.tausq.org/
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be
