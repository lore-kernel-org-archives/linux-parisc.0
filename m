From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [dave@hiauly1.hia.nrc.ca: Re: [parisc-linux] Why gas kills the
	hppa-linux kernel and what you can]
Date: Fri, 01 Jul 2005 14:07:24 -0400
Message-ID: <1120241244.5046.16.camel@mulgrave>
References: <20050701175316.GS5269@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Randolph Chung <tausq@debian.org>,
 PARISC list <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050701175316.GS5269@systemhalted.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, 2005-07-01 at 13:53 -0400, Carlos O'Donell wrote:
> journal_alloc_journal_head() can return a null pointer causing
> the kernel to die in memset.  I think the fix is to skip calling
> memset when new_jh is null.  The rest of the code looks ok except
> for possibly

That's true (and needs fixing), but isn't what happened in this case.
Look at the traceback:

> Kernel Fault: Code=15 regs=3249c840 (Addr=73c9d7ba)

The address wasn't NULL, it was something really strange above the
addressable virtual memory in the system.

This fault is consistent with a class of faults we've been seeing since
2.6.11-rc1-pa0 where kmem_cache_alloc() is returning memory that can't
be written to (usually just slightly above the end of virtual memory).

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
