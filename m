Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA22760
	for <parisc-linux@puffin.external.hp.com>; Wed, 18 Oct 2000 15:03:13 -0600
Received: from videotron.ca ([216.113.0.11]) by
          VL-MS-MR003.sc1.videotron.ca (Netscape Messaging Server 4.15)
          with ESMTP id G2N97700.5EF for
          <parisc-linux@thepuffingroup.com>; Wed, 18 Oct 2000 17:04:19 -0400
Sender: fleet@mailserv2.iuinc.com
Message-ID: <39EE1051.A7E29945@videotron.ca>
Date: Wed, 18 Oct 2000 17:04:17 -0400
From: James Waterhouse <james.waterhouse@videotron.ca>
MIME-Version: 1.0
To: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Subject: [Fwd: Re: [parisc-linux] booting on 712/60]
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hello,
Is the ramdisk at 
ftp://puffin.external.hp.com/pub/parisc/binaries/ramdisks/ramdisk.bin-20000803
useable? I'm just wondering cause in the recipe we are told to use the
older ramdisks. Also this ramdisk doe not say wether it is for serial or
graphics console. But since I read Grants reply it would seem that it
does not matter. Is this true? Is this a useable ramdisk? What can
anyone tell me about it?

thanks,
James


Grant Grundler wrote:
> 
> James Waterhouse wrote:
> > Hello,
> >       I just compiled a ramdisk using mondays cvs src for everything. I'm
> > using the graphics console ramdisk file off the puffin.external.hp.com
> > (ramdisk20000530-sticon.tgz) to make the ramdisk. Now when I got to boot
> > it boots up until the point where the kernel says...
> 
> iirc, ramdisk20000530-sticon.tgz uses a "kluge" /dev/tty major/minor number.
> I was reading old mail on this and the kluge to use a different
> major/minor confused me. I was told this was no longer needed.
> So you can use a newer/regular ramdisk.
> 
> Mathew Wilcox posted the "how-to" on ramdisk:
>     http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/01-Jan/0078.html
> 
> grant
> 
> Grant Grundler
> Unix Systems Enablement Lab
> +1.408.447.7253

-- 
Can you discern the signs of the times? || www.danielrevelation.com
Do you see the storm fast approaching?  || www.sundaylaw.com
Is your future built on "The Rock"?     ||
www.bibleinfo.com/sc/toc_sc.html
