From: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Subject: Re: [PATCH] Don't mlock guardpage if the stack is growing up
Date: Mon, 9 May 2011 13:12:24 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1105091307570.32299@artax.karlin.mff.cuni.cz>
References: <alpine.DEB.2.00.1105082045250.15552@artax.karlin.mff.cuni.cz> <alpine.LSU.2.00.1105081303540.16151@sister.anvils>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Michel Lespinasse <walken@google.com>,
	Oleg Nesterov <oleg@redhat.com>
To: Hugh Dickins <hughd@google.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.00.1105081303540.16151@sister.anvils>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 8 May 2011, Hugh Dickins wrote:

> On Sun, 8 May 2011, Mikulas Patocka wrote:
> 
> > Don't mlock guardpage if the stack is growing up
> > 
> > Linux kernel excludes guard page when performing mlock on a VMA with 
> > down-growing stack. However, some architectures have up-growing stack and 
> > locking the guard page should be excluded in this case too.
> > 
> > This patch fixes lvm2 on PA-RISC (and possibly other architectures with 
> > up-growing stack). lvm2 calculates the number of used pages when locking 
> > and when unlocking and reports an internal error if the numbers mismatch. 
> > On PA-RISC, the kernel would incorrectly attempt to mlock the stack guard 
> > page, this causes allocation of one more page and internal error in lvm2.
> > 
> > Signed-off-by: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
> 
> Interesting, I'd convinced myself that the growsup case was safe,
> because of how we always approach the vma from its bottom end.
> 
> I've added Michel to the Cc, he's the one with the best grasp here.
> 
> Could you point us to where lvm2 is making these calculations?
> I don't understand quite what it's doing.
> 
> Thanks,
> Hugh

See ./lib/mm/memlock.c in LVM2. It reads /proc/self/maps, parses the file 
and locks each map with mlock, except for glibc locale file.

It calculates how much memory it took when locking and unlocking and 
prints an internal error if the numbers differ. The internal error 
normally means that there was some memory allocated while it was locked 
(that is wrong).

However, on up-growing stack, the internal error is always triggered, 
because mlock() of the stack touches the guard page and allocates one more 
page.

Mikulas
