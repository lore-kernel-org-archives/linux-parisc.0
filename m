Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA07523
	for <parisc-linux@puffin.external.hp.com>; Tue, 12 Dec 2000 00:17:50 -0700
To: Marko.T.Niskanen@nokia.com
Cc: parisc-linux@thepuffingroup.com, adevries@linuxcare.com
Subject: Re: [parisc-linux] 712/60 booting problem 
In-Reply-To: Message from Marko.T.Niskanen@nokia.com
   of "Tue, 12 Dec 2000 08:05:00 +0200." <13F0486DB51CD311A0AE0008C7C561380453D431@eseis11nok>
References: <13F0486DB51CD311A0AE0008C7C561380453D431@eseis11nok> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Dec 2000 00:22:29 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001212072229.2719137CA1@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Marko.T.Niskanen@nokia.com writes...

> Sorry I have no boot log, because linux doesn't start and I have no idea how
> to get it an another way.  after text on console "switching from PDC
> console", I can read from serial port: 

If you set your 712 to serial console you can capture it, but I don't know if 
I'd recommend doing that since STI will be better long term.

> kmem_create: Forcing size word alignment - nfs_fh VFS: Mounted root (ext2
> filesystem) readonly. !!die_if_kernel: init(1): Illegal instruction 8
> 
> and after that starts that "loop" 

I get the same loop here but with a newer kernel and libc. Did you update your 
kernel or libc at all? I think the 0.5 CD should work fine on a 712/60.

-- 
Matt Taggart
taggart@fc.hp.com
