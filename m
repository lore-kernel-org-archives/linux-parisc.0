Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lxorguk.ukuu.org.uk (pc2-cwma1-4-cust86.swan.cable.ntl.com [213.105.254.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id B6761482A
	for <parisc-linux@parisc-linux.org>; Fri, 11 Jul 2003 11:16:23 -0600 (MDT)
Received: from dhcp22.swansea.linux.org.uk (dhcp22.swansea.linux.org.uk [127.0.0.1])
	by lxorguk.ukuu.org.uk (8.12.8/8.12.5) with ESMTP id h6BHDgKd021009;
	Fri, 11 Jul 2003 18:13:43 +0100
Received: (from alan@localhost)
	by dhcp22.swansea.linux.org.uk (8.12.8/8.12.8/Submit) id h6BHDdeF021007;
	Fri, 11 Jul 2003 18:13:39 +0100
Subject: Re: [parisc-linux] [2.5] ns87415 irq
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Bartlomiej Zolnierkiewicz <B.Zolnierkiewicz@elka.pw.edu.pl>
Cc: Matthew Wilcox <willy@debian.org>,
	HPPA List <parisc-linux@parisc-linux.org>
In-Reply-To: <Pine.SOL.4.30.0307111726350.7550-100000@mion.elka.pw.edu.pl>
References: <Pine.SOL.4.30.0307111726350.7550-100000@mion.elka.pw.edu.pl>
Content-Type: text/plain
Message-Id: <1057943615.20629.32.camel@dhcp22.swansea.linux.org.uk>
Mime-Version: 1.0
Date: 11 Jul 2003 18:13:38 +0100
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

On Gwe, 2003-07-11 at 16:32, Bartlomiej Zolnierkiewicz wrote:
> > Erm, that seems like more work than I should be doing.  That would touch
> > 36 files, including a lot of mips/ppc ide files.  Or did you want Bart
> > to make that change?
> 
> Alan, are there any benefits of doing this?

The normal process is just to break the non x86 ports 8)

> > BTW, Bart, seems like sparc64 does _have_ the ide_default_irq() function,
> > it just returns 0.  So I think this patch shouldn't break anything.
> 
> Yes, but 0 != 14 && 0 != 15. I am just paranoid. :-)

One of the things it cleans up is the 14/15 IRQ assumption.
