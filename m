Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA02389
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 12:05:26 -0600
Sender: adevries@feather.thepuffingroup.com
Message-ID: <3761504A.BF1480CA@thepuffingroup.com>
Date: Fri, 11 Jun 1999 14:07:06 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] partitioning on HPUX
References: <199906111742.KAA16333@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:

> Having once supported HP-UX SCSI disk drivers, I can only second the
> reccomendation already made to only support "whole disk" file systems.
> The whole hard partioning thing was a mess. Eventually, if someone
> really needs to partition a disk, some support for LVM could be added
> (and hopefully with a better user interface).

Most Linux distributions really expect some sort of partitioning, so
it's easier to just inherit an existing one. 

Usually there's a native partitioning format to follow, but by not
having one we're forced to choose one.  The obvious one is DOS, because
it's been done many times over.  I'd be happier doing something a little
more sane like SGI though.

Oh, and at some point we'll do LVM, but that'll mean merging it in with
the existing Linux LVM tools.

- Alex
