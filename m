Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (lightning.swansea.linux.org.uk [194.168.151.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 463014899
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Mar 2002 06:23:38 -0700 (MST)
Subject: Re: [parisc-linux] 'foreign' PCI cards in an rp2430
To: willy@debian.org (Matthew Wilcox)
Date: Fri, 8 Mar 2002 13:38:24 +0000 (GMT)
Cc: duraid@fl.net.au (Duraid Madina),
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020308131509.D22831@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Mar 08, 2002 01:15:09 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E16jKZk-0006CC-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
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

> > 	And (no laughter, please) what's the maximum swap partition size
> > parisc linux supports? Can parisc linux swap over NFS?
> 
> Forget about swapping over NFS.  It's prone to deadlock under
> stress.  I think we support 2GB/file and up to 8 files, but I may be
> underestimating... John would know.

NFS swapping probably isnt the best of ideas - if you ensure your atomic
memory pool is big enough you can make it work though. Nbd will also work
subject to the same kind of constraints. There are some patches around to
make nfs/nbd swap reliable by putting some hacks into the network code
