Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lxorguk.ukuu.org.uk (pc2-cwma1-4-cust86.swan.cable.ntl.com [213.105.254.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 06167482A
	for <parisc-linux@parisc-linux.org>; Fri, 11 Jul 2003 09:05:33 -0600 (MDT)
Received: from dhcp22.swansea.linux.org.uk (dhcp22.swansea.linux.org.uk [127.0.0.1])
	by lxorguk.ukuu.org.uk (8.12.8/8.12.5) with ESMTP id h6BF2rKd020899;
	Fri, 11 Jul 2003 16:02:54 +0100
Received: (from alan@localhost)
	by dhcp22.swansea.linux.org.uk (8.12.8/8.12.8/Submit) id h6BF2pCj020897;
	Fri, 11 Jul 2003 16:02:51 +0100
Subject: Re: [parisc-linux] [2.5] ns87415 irq
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Matthew Wilcox <willy@debian.org>
Cc: Bartlomiej Zolnierkiewicz <B.Zolnierkiewicz@elka.pw.edu.pl>,
	HPPA List <parisc-linux@parisc-linux.org>
In-Reply-To: <20030711140732.GA20424@parcelfarce.linux.theplanet.co.uk>
References: <20030711140732.GA20424@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain
Message-Id: <1057935770.20636.22.camel@dhcp22.swansea.linux.org.uk>
Mime-Version: 1.0
Date: 11 Jul 2003 16:02:50 +0100
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

On Gwe, 2003-07-11 at 15:07, Matthew Wilcox wrote:
> Would this patch make sense for 2.5?  I have to confess not testing it
> on any hardware, but it seems to be the Right Thing (and I'm sure Alan
> remembers the mess we had in the 2.4 parisc tree for this ...)

Yes, it makes sense to do this generally. However can you also pass
hwif to the ide_default_irq function because that lets the arch code
work out what pci bus the device is nailed to
