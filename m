Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA03003
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 13:45:22 -0700
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel1.hp.com (Postfix) with ESMTP id BB5AF9EF
	for <parisc-linux@thepuffingroup.com>; Wed, 15 Nov 2000 15:47:26 -0500 (EST)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id D806E37CA7
	for <parisc-linux@thepuffingroup.com>; Wed, 15 Nov 2000 13:49:18 -0700 (MST)
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Palinux on a 712/60 
In-Reply-To: Message from Andrew Shugg <andrew@neep.com.au>
   of "Wed, 15 Nov 2000 18:10:13 +0800." <20001115181010.W22138@neep.com.au>
References: <C12531D038D1D011B1DB0000F8036C28071AB6FB@eosm5.oecd.org>  
 <20001115181010.W22138@neep.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 15 Nov 2000 13:49:18 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001115204918.D806E37CA7@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Andrew Shugg writes...

> Arnaud.ATOCH@oecd.org said:
> > Hi,
> > 
> > I got a couple of 715 and I'd love having access to an ISO image with STI
> > console kernel too.
> 
> I've never made an El Torito CDROM, is it possible to have multiple boot
> images and a boot loader on a single disc?

El Torito is a PC thing. It makes the front of a CDROM look like a floppy to 
the PC BIOS. For hppa you put a lifimage on the front of the CDROM(or tape or 
HDD, etc).

> ie could the actual boot
> image be a boot loader (PALO) which then points at one or more kernels
> on the CDROM?

Maybe. Paul Bame is the expert though. I think he had to do some work to get 
palo to be able to see a kernel on an ISO9660 filesystem. I don't know if it 
can currently be interruped and pointed at a different kernel. Paul?

-- 
Matt Taggart
taggart@fc.hp.com
