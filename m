Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7ED294829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 21 Oct 2002 09:26:29 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 183eRm-0000Vx-00; Mon, 21 Oct 2002 16:26:26 +0100
Date: Mon, 21 Oct 2002 16:26:26 +0100
From: Matthew Wilcox <willy@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] rp2470 hang...getting closer
Message-ID: <20021021162626.A1356@parcelfarce.linux.theplanet.co.uk>
References: <20021013044033.88A544829@dsl2.external.hp.com> <20021021155932.L5285@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021021155932.L5285@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Mon, Oct 21, 2002 at 03:59:32PM +0100
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

On Mon, Oct 21, 2002 at 03:59:32PM +0100, Matthew Wilcox wrote:
> so if we take, say, a page fault, we reenable interrupts on all CPUs.
> Who the hell put this code in there?!
> 
> Thanks to Thibaut for finding this particular excrescence during
> CONFIG_SMP frobbing on 2.5.  I'm not sure what this should be changed to.
> local_irq_enable?  Do we want interrupts enabled at this point?

ok, going back through the CVS logs finds the answer:

http://cvs.parisc-linux.org/obsolete/linux-2.3/arch/parisc/kernel/traps.c#rev1.9

Revision 1.9 / (as text) / (view) - annotate - [select for diffs] , Tue Feb 15 17:02:03 2000 UTC (2 years, 8 months ago) by jsm
Branch: MAIN
Changes since 1.8: +11 -2 lines
Diff to previous 1.8

Enable interrupts in fault path. Trap kernel space faults.

So I think we want to change the sti() call to local_irq_enable().

-- 
Revolutions do not require corporate support.
