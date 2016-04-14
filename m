From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [GIT PULL] parisc fixes for 4.6-rc2
Date: Thu, 14 Apr 2016 09:31:23 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.1604140930220.13532@file01.intranet.prod.int.rdu2.redhat.com>
References: <20160409055746.GA3305@ls3530.box>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20160409055746.GA3305@ls3530.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Sat, 9 Apr 2016, Helge Deller wrote:

> Hi Linus,
> 
> please pull some important fixes for the parisc architecture from:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.6-3
> 
> Since commit 0de7985 (parisc: Use generic extable search and sort routines)
> module loading is boken on parisc, because the parisc module loader wasn't
> prepared for the new R_PARISC_PCREL32 relocations.
> 
> In addition, due to that breakage, Mikulas Patocka noticed that handling
> exceptions from modules probably never worked on parisc. It was just masked by
> the fact that exceptions from modules don't happen during normal use.
> 
> This patch series fixes those issues and survives the tests of the
> lib/test_user_copy kernel module test.  Some patches are tagged for stable.
> 
> Thanks,
> Helge
> 
> ----------------------------------------------------------------
> Helge Deller (5):
>       parisc: Handle R_PARISC_PCREL32 relocations in kernel modules
>       parisc: Avoid function pointers for kernel exception routines
>       parisc: Fix kernel crash with reversed copy_from_user()
>       parisc: Unbreak handling exceptions from kernel modules
>       parisc: Update comment regarding relative extable support
> 
>  arch/parisc/include/asm/uaccess.h | 11 +++++------
>  arch/parisc/kernel/asm-offsets.c  |  1 +
>  arch/parisc/kernel/module.c       |  8 ++++++++
>  arch/parisc/kernel/parisc_ksyms.c | 10 +++++-----
>  arch/parisc/kernel/traps.c        |  3 +++
>  arch/parisc/lib/fixup.S           |  6 ++++++
>  arch/parisc/mm/fault.c            |  1 +
>  7 files changed, 29 insertions(+), 11 deletions(-)

Hi

I confirm that the kernel 4.6-rc3 fixes exception handling from modules.

Mikulas
