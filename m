Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (lightning.swansea.linux.org.uk [194.168.151.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 54CA9482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Sep 2001 17:28:49 -0600 (MDT)
Subject: Re: [parisc-linux] documented Oops running big-endian reiserfs on parisc architecture
To: willy@debian.org (Matthew Wilcox)
Date: Mon, 3 Sep 2001 00:31:10 +0100 (BST)
Cc: davem@redhat.com (David S. Miller), willy@debian.org,
	thunder7@xs4all.nl, parisc-linux@lists.parisc-linux.org,
	linux-kernel@vger.kernel.org
In-Reply-To: <20010903002514.X5126@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Sep 03, 2001 12:25:14 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E15dghq-0000bZ-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> > Is it impossible to handle unaligned access traps properly on
> > parisc?  If so, well you have some problems...
> 
> No, we just haven't bothered to implement it yet.  Not many people
> use IPX these days.

You also need unaligned trap fixups for

AX.25, NetROM, LAPB, X.25, Appletalk, PPP, Anything over 802.2LLC, Linus
NFS code for some NFS mount options (although not the -ac NFS code)

Alan
