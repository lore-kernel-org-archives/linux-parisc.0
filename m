Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1E8314840
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Nov 2003 22:29:17 -0700 (MST)
Date: Fri, 21 Nov 2003 22:29:15 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] strace locks up 2.4.22-pa14
Message-ID: <20031122052915.GB29917@colo.lackof.org>
References: <20031121005003.GB13007@colo.lackof.org> <3FB265250000556F@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FB265250000556F@ocpmta2.freegates.net>
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

On Fri, Nov 21, 2003 at 01:39:49PM +0100, Joel Soete wrote:
> Hi Grant,
> 
> I am tring to track a lpr pb on my b2k and so try:
> # strace -f /usr/bin/lpr foo.doc
> 
> that works;

ok

> I read your post and try so now:
> # strace -f -o /var/tmp/Strace.doc /usr/bin/lpr foo.doc
> 
> and system also hang (same behaviour as)
> and so I toc it (which seems to failled ; apparently because of ide-cdrom???)

hrm. I doubt the ide-cdrom is causing the TOC to fail. 
It's likely the CD-ROM drive is getting reset when TOC occurs
and that's the noise you hear.
Something else might be causing problems.

> I took the opportunity to unplug ide-cable's cdrom (to test various).
> 
> Then to try to obtain a relevant toc, I re-launch:
> # strace -f -o /var/tmp/Strace.doc /usr/bin/lpr foo.doc
> 
> This time it works??
> Is it the same for you after the reboot?

I haven't retried because I need that to actaully work on that system.
I'm building a new kernel and will try at home tonight.


> (sorry, I tried severall time strace but no more means to reproduce)

bummer. Makes me wonder if this is CPU cache related too. 

> PS: btw the end of my strace is:
> [...]
> 24801 write(3, "\1lp\n", 4)             = 4
> 24801 read(3, "\0", 1)                  = 1
> 24801 close(3)                          = 0
> 24801 SYS_222(0, 0, 0x1, 0x2f, 0)       = -1 ENOSYS (Function not implemented)
> 24801 exit(0)                           = ?
> 
> And at the same time, at the serial console I got:
> + set -v
> + exec
> 
> Have you any advise about what I miss?

include/asm/unistd.h says:
#define __NR_exit_group         (__NR_Linux + 222)

No architecture implements that syscall.
("find -name '*.[S]' | xargs fgrep exit_group")
I have no clue what it's supposed to do and looks like
I don't need to care either.

Perhaps just recompiling the application or linked lib that uses
that syscall might get rid of it.

grant
