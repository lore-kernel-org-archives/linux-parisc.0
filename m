Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 133964841
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Oct 2001 11:14:26 -0600 (MDT)
To: Matthew Wilcox <willy@debian.org>
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Mon, 08 Oct 2001 17:36:20 BST." <20011008173620.I3745@parcelfarce.linux.theplanet.co.uk>
References: <1002553729.3bc1c18187924@webmail.tiscalinet.be>
 <20011008162234.D28880@parcelfarce.linux.theplanet.co.uk>
 <1002556397.3bc1cbed99e0b@webmail.tiscalinet.be>  <20011008173620.I3745@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 08 Oct 2001 11:14:17 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20011008171417.9B70237CC0@carmen.fc.hp.com>
Subject: [parisc-linux] Re: LVM 1.0.1-rc4 on hppa
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox writes...

> On Mon, Oct 08, 2001 at 05:53:17PM +0200, joel.soete@freebel.net wrote:
> > About gdb for hppa, may I use the one into 
> > "pehc /pub/parisc/binaries/debian/unofficial-debs/".
> 
> Yes.  I don't know what the current status is of getting an official gdb
> for PA/Linux is... Matt?

Waiting for someone(Alan Modra?) to do a merge with upstream. Once that's done 
then the changes can be sent upstream as well as incorporated in the newly 
revived debian gdb package.

Alan's been too busy to do it but if there are any other gdb gods out there 
we'd love it if someone took this on.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
