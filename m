Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 69852482A
	for <parisc-linux@parisc-linux.org>; Fri, 11 Jul 2003 09:35:16 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19azvX-0007BQ-Mw; Fri, 11 Jul 2003 16:35:15 +0100
Date: Fri, 11 Jul 2003 16:35:15 +0100
From: Matthew Wilcox <willy@debian.org>
To: Bartlomiej Zolnierkiewicz <B.Zolnierkiewicz@elka.pw.edu.pl>
Cc: Matthew Wilcox <willy@debian.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>,
	HPPA List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] [2.5] ns87415 irq
Message-ID: <20030711153515.GE20424@parcelfarce.linux.theplanet.co.uk>
References: <20030711151640.GD20424@parcelfarce.linux.theplanet.co.uk> <Pine.SOL.4.30.0307111726350.7550-100000@mion.elka.pw.edu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.SOL.4.30.0307111726350.7550-100000@mion.elka.pw.edu.pl>
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

On Fri, Jul 11, 2003 at 05:32:12PM +0200, Bartlomiej Zolnierkiewicz wrote:
> > BTW, Bart, seems like sparc64 does _have_ the ide_default_irq() function,
> > it just returns 0.  So I think this patch shouldn't break anything.
> 
> Yes, but 0 != 14 && 0 != 15. I am just paranoid. :-)

Oh, 14 and 15 are not valid sparc64 irqs.  No problem.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
