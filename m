Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA25684
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 15:32:13 -0700
To: Greg Ingram <ingram@symsys.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] C100 Boots! (Mostly) 
In-Reply-To: Message from Greg Ingram <ingram@symsys.com>
   of "Mon, 15 Jan 2001 16:11:19 CST." <Pine.LNX.4.21.0101151559150.23803-100000@maestro.symsys.com>
References: <Pine.LNX.4.21.0101151559150.23803-100000@maestro.symsys.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 15 Jan 2001 15:37:46 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010115223746.AF97438C60@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Greg Ingram writes...

> root filesystem before losing console output.  A log follows.  The machine
> accepts telnet connections but telnet session won't start.  I get:
> 
> 	telnetd: getpty: permission denied
> 
> I'm hoping that's just something to do with how I installed the root
> filesystem.  Maybe it hasn't been remounted as writable?  I'm so close to
> a shell! 

Yes, that is exactly the same error that I have seen when the root wasn't 
mounted rw. Until you fix your console problem you can probably add something 
like,

10.0.0.1:/tftpboot/nfsroot      /       nfs    defaults,errors=remount-ro

to /tftpboot/nfsroot/etc/fstab

replace with your IP/nfsroot path. That should let it remount rw after it's 
booted.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
