Received: from rhirst.linuxcare.com (sleepie.demon.co.uk [194.222.23.208])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id FAA05963
	for <parisc-linux@puffin.external.hp.com>; Mon, 13 Nov 2000 05:14:07 -0700
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id A5F40B007; Mon, 13 Nov 2000 12:13:49 +0000 (GMT)
Date: Mon, 13 Nov 2000 12:13:49 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: bame@riverrock.org
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] kernel merge
Message-ID: <20001113121349.Q32715@linuxcare.com>
References: <E13twjn-0004fw-00@noam.fc.hp.com> <m13uLiv-001Vp3C@chalet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <m13uLiv-001Vp3C@chalet>; from bame@riverrock.org on Fri, Nov 10, 2000 at 02:28:33PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Nov 10, 2000 at 02:28:33PM -0700, bame@riverrock.org wrote:
> drivers/scsi sym53c8xx_comm.h #ifdef doesn't work on parisc -- eliminates
>                 unmap_pci_mem() causing link error (TODO - rhirst)

Fixed.  This relates to NVRAM that some PCI scsi cards have to hold
config settings over reboot.  CONFIG_SCSI_NCR53C8XX_NVRAM_DETECT
is normally defined in sym53c8xx_defs.h to turn that code on.  When
I implemented Zalon (FWD) support I guessed that the 53c720 h/w
wouldn't have NVRAM implemented the same way, and turned off
NVRAM detect.

I've also replaced a chunk of Zalon specific code that got lost in
the merge, so Zalon/FWD/53c720 support works again.

There is a problem remaining when using the driver as a module;
it looks like something is trying to printk() from a string in
the module after the module has been removed.  Havn't tracked
that down yet.

Richard
