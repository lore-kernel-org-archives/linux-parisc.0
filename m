From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Fri, 9 Apr 2010 12:22:48 -0400
Message-ID: <20100409162247.GA24334@hiauly1.hia.nrc.ca>
References: <20100408215453.GA18445@hiauly1.hia.nrc.ca> <20100408224446.96F294FA3@hiauly1.hia.nrc.ca> <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com> <20100409151330.GA23889@hiauly1.hia.nrc.ca> <1270828136.8319.126.camel@mulgrave.site>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Carlos O'Donell <carlos@systemhalted.org>, deller@gmx.de,
	gniibe@fsij.org, linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1270828136.8319.126.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 09 Apr 2010, James Bottomley wrote:

> > I posted the change to not clobber r19 on fork/clone syscalls,
> > but there has been no response to it.
> 
> Theory looks fine to me ... although Helge sees no difference in
> behaviour, I'd be happy to apply on the principle of no harm and
> theoretically necessary.

Testcase is below.  Compile with `-static' to link with libc.a.
Testcase prints incorrect parent pid.

Carlos recently updated glibc so it saves/restores r19 across syscalls
in non-PIC code.  I thought Helge tested this update, so he wouldn't
see the problem unless he tested with an "old" version of glibc.

While there isn't a lot of code linked with -static (I mainly
use for debugging), there's no real reason that the kernel needs
to clobber r19 across fork/clone.

If we want to preserve pad0 for some future use, I think that it
should be possible to use another syscall clobbered register to
save the return pointer for the child.

> I'm fairly convinced we need the flush on kmap(_atomic) as well if the
> user had dirtied the page.  Right at the moment if the aliases are
> inequivalent (which they are about 99.9% of the time) we're in danger of
> using stale data in the kernel.  We also need a flush on kunmap if the
> kernel has dirtied the page.

This is presumably for PA8800/PA8900 processors?  I'm a bit surprised
that HP would change the cache coherency requirement for these processors
alone given the performance hit in maintaining coherency.  Is this an
issue for all systems with more than two processors?

I've wondered if checking the dirty bit in kunmap would help performance.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/types.h>
#include <unistd.h>

#define CALL_EXIT 0

int main (void)
{
  pid_t child;
  pid_t parent;
  char *cmd[] = { "bash", "-c", "echo In child $$;", (char *)0 };
  char *env[] = { "HOME=/tmp", (char *)0 };
  int ret;

  child = vfork();

  if (child == 0)
    {
      ret = execve("/bin/bash", cmd, env);
      // printf ("ret = %d\n", ret);
      _exit(1);
    }
  else
    {
      // printf("child != 0\n");
    }

  parent = getpid();
  printf("parent is %d\n", (unsigned int)parent);
  printf("child is %d\n", (unsigned int)child);

  return 0;
}
