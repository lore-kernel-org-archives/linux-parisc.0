Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id F19E648D2
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Apr 2004 05:59:19 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1BI4la-0008Uo-Ks; Mon, 26 Apr 2004 12:59:18 +0100
Date: Mon, 26 Apr 2004 12:59:18 +0100
From: Matthew Wilcox <willy@debian.org>
To: Randolph Chung <tausq@debian.org>
Message-ID: <20040426115918.GO22558@parcelfarce.linux.theplanet.co.uk>
References: <20040419223250.7E3CE494572@palinux.hppa>
	<20040419223444.GB18329@parcelfarce.linux.theplanet.co.uk>
	<20040426014111.GC3965@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040426014111.GC3965@tausq.org>
Sender: <willy@www.linux.org.uk>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Re: [parisc-linux-cvs] 7300LC
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Apr 25, 2004 at 06:41:11PM -0700, Randolph Chung wrote:
> willy, kyle found out that this doesn't work:
> 
> > > Split out 7300LC from 7100LC and PREFETCH from PA20.
> 
> extern inline void prefetchw(const void *addr)
> {
>         __asm__("ldd 0(%0), %%r0" : : "r" (addr));
> }
> 
> on pa11 gas won't assemble the ldd insn.
> 
> is this supposed to work for pa7300lc? if so we might have to rewrite
> prefetchw to use a .word or something...

It is supposed to work, yes.  I gleaned this information from
http://cpus.hp.com/technical_references/b7300lc.shtml section 2.2.4
The 7300LC ERS (http://ftp.parisc-linux.org/docs/chips/pcxl2_ers.pdf)
is of no help in this matter.  In section 14.5, it says:

  Because the processor does not necessarily stall even with two cache
  misses pending, software prefetching can lead to better performance
  increases than on the PA7100LC. This is because a software prefetch,
  initiated by a load to general register 0, is not treated like a
  load miss by the data cache and therefore can be completed in the
  ``background'' by the hardware and is less likely to cause processor
  stalls.

But, thinking about it, PA7300LC isn't SMP-capable.  Is there any
difference between prefetch-for-read and prefetch-for-write on a
uniprocessor system?  I don't think so.  So possibly we should just
define prefetchw to be the same as prefetch for CONFIG_PA7300LC and
different for CONFIG_PA20.  Makes sense?

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
