Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA23335
	for <parisc-linux@puffin.external.hp.com>; Tue, 17 Oct 2000 10:02:15 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 17 Oct 2000 16:02:39 -0000
To: "Thomas Marteau" <marteaut@esiee.fr>
Cc: <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Trouble with new STI
References: <001201c050b7$b737d260$a832d793@esiee.fr>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 17 Oct 2000 12:02:35 -0400
In-Reply-To: "Thomas Marteau"'s message of "Fri, 17 Nov 2000 17:59:14 +0100"
Message-ID: <87snpv4fs4.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

"Thomas Marteau" <marteaut@esiee.fr> writes:

> We've tried the new STI driver and our 712 dies with this message:
> Kernel Panic: VFS: Unable to mount root fs on 01:00
> We tried with Ramdisk, nfs and hard disk support and always the same end.

That has nothing to do with the STI drivers, and I'm afraid I can't
help you unless you give more detail.  Like your kernel .config file
for instance.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
