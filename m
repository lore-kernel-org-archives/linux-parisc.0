From: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] libseccomp: Add parisc architecture support (v2)
Date: Thu, 14 Apr 2016 19:14:14 -0400
Message-ID: <CAHC9VhSseu8kLg0W+Ee0bnOiPSKHfGq-zsq-xmrOfMFozohmZA@mail.gmail.com>
References: <20160213200731.GA18161@ls3530.box>
	<3673666.V2ZqGazvLY@sifl>
	<56C24911.8000200@gmx.de>
	<1907254.cBdVSxntFv@sifl>
	<20160409070549.GA5442@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	John David Anglin <dave.anglin@bell.net>, libseccomp@googlegroups.com,
	Mike Frysinger <vapier@gentoo.org>
To: Helge Deller <deller@gmx.de>
Return-path: <libseccomp+bncBD4NPLXYE4IMNSGAXACRUBCUS2Y7A@googlegroups.com>
In-Reply-To: <20160409070549.GA5442@ls3530.box>
List-Post: <https://groups.google.com/group/libseccomp/post>, <mailto:libseccomp@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:libseccomp+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/libseccomp
List-Subscribe: <https://groups.google.com/group/libseccomp/subscribe>, <mailto:libseccomp+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+473669215327+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/libseccomp/subscribe>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Apr 9, 2016 at 3:05 AM, Helge Deller <deller@gmx.de> wrote:
> This patch (v2) adds support for the parisc and parisc64 architectures
> to libseccomp.

Great!

> I didn't split up the patch, because it's pretty trivial.
> Those parisc-specific files gets added:
>  src/arch-parisc-syscalls.c
>  src/arch-parisc.c
>  src/arch-parisc.h
>  src/arch-parisc64.c
>
> All other changes are trivial because they simply add parisc-specific
> case statements in variouse switch statements.
>
> I noticed that when valgrind is not going to be used (e.g. because it's not
> installed), the test testsuite will issue no information about that. With this
> patch you will get informed if a testcase was SKIPPED because valgrind is not
> installed. This additional info is useful for architectures which aren't as
> fast as x86_64. On parisc it seemed that the whole testcase was hanging, now
> people know what's actually happening.

Would you mind separating out the valgrind portion of the patch into a
separate patch?  That is something we can merge regardless, as it
isn't pa-risc specific, and would be a nice addition.

> I did ran a "make check" sucessfully on x86_64 and parisc.
> The x86_64 didn't showed any issues, while on the parisc architecture
> the 29-sim-pseudo_syscall testcase failed. But it seems this testcase
> failure is not caused by this patch, instead it seems that it will fail
> on most other architectures beside x86_64 as well.

There should be no test failures on any of the arch/ABIs that
libseccomp supports.  Can you elaborate on the failure you are seeing
with 29-sim-pseudo_syscall?  Are you using a current libseccomp from
the master branch?

Also, it would be good to ensure that 'cd tests; ./regression -T live'
worked correctly; these tests aren't run automatically because they
are the live tests, but they need to pass before we merge the new
architecture.

> It would be nice if you could add this patch to the libseccomp git tree.
> The patch applies cleanly to current git head.
>
> Changes compared to v1 of this patch:
> - Enabled seccomp mode 2 regression tests on parisc. Kernel support for hppa
> was added in kernel 4.6-rc1 and backported into the kernel stable series.

So all necessary kernel support is now part of the 4.6-rcX kernels?

-- 
paul moore
www.paul-moore.com

-- 
You received this message because you are subscribed to the Google Groups "libseccomp" group.
To unsubscribe from this group and stop receiving emails from it, send an email to libseccomp+unsubscribe@googlegroups.com.
To post to this group, send email to libseccomp@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
