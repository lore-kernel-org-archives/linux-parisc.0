Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA00585
	for <parisc-linux@puffin.external.hp.com>; Sun, 26 Mar 2000 16:18:21 -0700
From: willy@thepuffingroup.com
Date: Sun, 26 Mar 2000 18:52:56 -0500
To: "M. Grabert" <xam@ngi.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] some questions
Message-ID: <20000326185256.A29700@thepuffingroup.com>
References: <38DE84DB.9E9875F6@ngi.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <38DE84DB.9E9875F6@ngi.de>; from M. Grabert on Sun, Mar 26, 2000 at 11:44:59PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Mar 26, 2000 at 11:44:59PM +0200, M. Grabert wrote:
> Hi there,
> some questions for you ...
> 
> - what will be the minimum memory requirements for
> linux/HPPA on a 735/99 ? (with and w/o X)

difficult to say.  8MB without X and 16MB with X, at a guess.

> - IMHO there is no usable free X server for linux/HPPA,
> (for my 735) but i think a have working binary of XFree for 
> hpux10.10 laying around here. If this is true, and the source
> code is available, is this going to be difficult to port it to
> linux/HPPA ? (perhaps i'll try it out, some time in future)

cool, I didn't know XFree had been ported to hpux 10.10.  In fact,
I can't see any mention of it on the XFree site, so this intrigues me
quite a lot.

> - AFAIK is the (first) main target the HP9000/7xx series.
> I have also a HP9000/800/F10 (8MB) laying around here,
> which i don't need anymore, so if you want it ...
> .. there is just the problem of transport

There's quite a few people seem to want support for their Nova servers.
They're not _as_ interesting as some of the other machines we have,
and will be quite a lot of work to support.  There's no documentation
currently released on any of the peripherals.

> - what filesystems are supported ?

we currently use ext2 out of a ramdisk and nfs.  other filesystems should
work, including the UFS variant which is in use on some HP drives.  the
problem is that we don't have any scsi adapters supported yet.

> PS:
> i'm a (poor ;) student of computer science in ratisbon,
> germany, a i just have 16MB for my 735. Addidional 64MB would
> cost about 350$ i think. Some sponsors *grin* ?
> Or some ideas where i can get some memory real cheap ?

oh, I have some ideas... :-)  BTW, where's Ratisbon?  None of my german
acquaintances know where that is and mapquest has never heard of it.

> PPS: great work you're doing!
> 
