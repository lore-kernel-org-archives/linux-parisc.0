Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2DF0A4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Feb 2003 08:26:36 -0700 (MST)
Date: Wed, 29 Jan 2003 14:58:20 +0100
Message-ID: <3E35DBDA000004E3@ocpmta8.freegates.net>
In-Reply-To: <1042386569.3329.4.camel@luigi>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] Issues with seteuid()?
To: "Luigi Gangitano" <luigi@debian.org>,
	parisc-linux@lists.parisc-linux.org
Cc: "Randolph Chung" <tausq@debian.org>
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

Hi all,

Here is a 'small' test case which reproduce the problem on a sarge (ie testing)
debian (gcc-3.0_3.0.4-12; libc6_2.2.5-14.3) running very last kernel 2.4.20-pa23:

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

(rebuild from simplified parts of squid-2.5 src)

compile with: gcc -O 2 -Wall -D_REENTRANT file.c -o ct

[create a user and a group named proxy with id 13 both]

compile as it is it, it will failled immediately with 'Segmentation fault'

edit sources to comment out '#undef HAVE_SETRESUID' line, recompile with
same option and it would fork without problem (even thought it will failled
to actually create dir)

hth,
    Joel

PS: this test case doesn't present the same pb on an unstable debian (ie
compile with gcc-3.2_3.2.2-0pre6 & libc6_2.3.1-10). I try this on the same
kernel running each the two different install.



>-- Original Message --
>From: Luigi Gangitano <luigi@debian.org>
>To: parisc-linux@lists.parisc-linux.org
>Subject: [parisc-linux] Issues with seteuid()?
>Date: 12 Jan 2003 16:49:29 +0100
>
>
>
>Hi all,
>I'm the Debian package maintainer for Squid (HTTP Proxy). I received the
>forwarded bug report describing issues in seteuid() on palinux. While
>using seteuid(), forked processes terminate with SEGV.
>
>Is it a known problem?
>
>Thanks.
>
>L
>
>Please CC: me, I'm not subscribed to this list.
>
>-----Forwarded Message-----
>> This small mail to mentionned that I reach to make squid operational on
>> a linux-2.4.20-pa17 thanks to the following tips:
>> 
>> in debian rules replace statement
>>     ac_cv_func_setresuid=no \
>> by
>>     ac_cv_func_setresuid=yes \
>> 
>> so that function leave_suid() [into src/tools.c] will use setresuid()
in
>> place of seteuid() before launch fork().
>> 
>> Is it a know problem on palinux?
>> 
>> Greetings,
>>     Joel
>> 
>> PS: Luigi, I also test it on 2.5.1 and it works also for parisc linux
(testing
>> config). HTH
>
>-- 
> Luigi Gangitano -- <luigi@debian.org> -- <gangitano@lugroma3.org>
> GPG: 1024D/924C0C26: 12F8 9C03 89D3 DB4A 9972  C24A F19B A618 924C 0C26
>
>Attachment: signature.asc
>


*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be
