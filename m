Return-Path: <carlos@baldric.uwo.ca>
Received: from fep04-mail.bloor.is.net.cable.rogers.com
	(fep04-mail.bloor.is.net.cable.rogers.com [66.185.86.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6C94D4854
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 30 Jan 2004 14:23:26 -0700 (MST)
Date: Fri, 30 Jan 2004 16:23:36 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Message-ID: <20040130212336.GS19840@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Constructor not run in 3.3.3, but does run in 3.0.4
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


jda,

I'm playing with a new glibc, it has the new port to generic function
descriptors...

I have a test application whose 'init' is not being run. The application
has a number of DSO it depends on, and as each DSO loads it prints a
number from its 'init', and as it unloads it prints a number from its
'fini'. The main executable doesn't run its 'init', but does run the
'fini'.

In glibc during dl-init() the loader skips running lt_type == lt_executable
'init' functions. The comment notes that it doesn't have to do that job.
Is this the job of the compiler?

---
#include <unistd.h>

void init (void) __attribute__ ((constructor));
void
__attribute__ ((constructor))
init (void)
{
  write (1, "4", 1);
}

void fini (void) __attribute__ ((destructor));
void
__attribute__ ((destructor))
fini (void)
{
  write (1, "5", 1);
}

extern int dep1 (void); 

int
main (void)
{
  return dep1 () != 42;
}
---

An example of the DSO that is loaded...
---
#include <unistd.h>

extern int dep3 (void); 

static void
__attribute__ ((constructor))
init (void)
{
  write (1, "0", 1);
}

static void
__attribute__ ((destructor))
fini (void)
{
  write (1, "9\n", 2);
}

int
dep3 (void)
{
  return 42;
}
---


When all is said and done it should print '0123456789', but right now it
prints '012356789', skipping '4'. If I compile with gcc-3.0.4 it
complains about:
/home/carlos/src/glibc-work/src/libc/include/unistd.h:71: warning:
`visibility' attribute directive ignored

69 char *__canonicalize_directory_name_internal (__const char *__thisdir,
70                                               char *__buf,
71                                               size_t __size) attribute_hidden;

Seems like a red-herring. However, with gcc-3.0.4 everything works just
fine. The order of the initializers is back to normal.

Is there any fragile system by which the linker finds and labels the
executables 'init'?

c.
