From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: [patch] spinlock consolidation, v2
Date: Mon, 6 Jun 2005 00:05:12 -0600
Message-ID: <20050606060512.GB30857@colo.lackof.org>
References: <20050603173132.GX14929@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Ingo Molnar <mingo@elte.hu>,
 parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050603173132.GX14929@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jun 03, 2005 at 06:31:32PM +0100, Matthew Wilcox wrote:
> 
> Anyone have time to test this out?
> 
> ----- Forwarded message from Ingo Molnar <mingo@elte.hu> -----
> 
> Date:	Fri, 3 Jun 2005 17:40:29 +0200
> From:	Ingo Molnar <mingo@elte.hu>
> Subject: [patch] spinlock consolidation, v2
> 
> the latest version of the spinlock consolidation patch can be found at:
> 
>   http://redhat.com/~mingo/spinlock-patches/consolidate-spinlocks.patch

I've adapted parisc-linux to this patch and put my changes into
a patch that goes on top of Ingo's.
The patch is parked here:
	ftp://ftp.parisc-linux.org/patches/consolidate-spinlocks-parisc.patch

 arch/parisc/kernel/processor.c  |    3 ++-
 arch/parisc/kernel/smp.c        |   12 ++++++++----
 arch/parisc/lib/bitops.c        |    5 +++--
 include/asm-parisc/atomic.h     |   13 +++++++------
 include/asm-parisc/bitops.h     |    2 +-
 include/asm-parisc/cacheflush.h |    1 +
 include/asm-parisc/processor.h  |    3 ++-
 include/asm-parisc/spinlock.h   |    2 ++

More notes in the patch file.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
