Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5C664482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Jan 2002 12:13:09 -0700 (MST)
Date: Tue, 15 Jan 2002 20:12:45 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: Matthew Wilcox <willy@debian.org>
Cc: Randolph Chung <randolph@tausq.org>, <linux-tr@linuxtr.net>,
	HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] IBM TR patch
In-Reply-To: <20020115181841.G19567@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.43.0201152008360.11606-100000@alpha.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi Matthew,

> > How is ioremap broken? (Just curious). From what I understand ioremap is
> > currently a nop in the parisc-linux vm/io design.
> 
> it's not broken, the assumptions in ibmtr are.  after you've ioremapped
> a region, you can call readb/writeb on it.  ibmtr assumes you can just
> do direct memory accesses.  now, this is something we want to fix,
> but it's not a bug in the PA code.

Then maybe it's best to define the TR_CHECKSUM macro to 0 as default with 
an exception of architectures where the above assumption in true (i.e. 
alpha, i386 and maybe ppc, as well) to gain the extra performance boost of 
the IPv4 pre summarisation.

--jochen
