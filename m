Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA30193
	for <parisc-linux@puffin.external.hp.com>; Thu, 8 Jun 2000 04:28:09 -0600
From: Helge Deller <deller@gmx.de>
To: Tara Dear <tdear@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Unable to open console on a 712
Date: Thu, 8 Jun 2000 12:28:17 +0200
Content-Type: text/plain
References: <393E8B27.AE7ECEDB@linuxcare.com>
In-Reply-To: <393E8B27.AE7ECEDB@linuxcare.com>
MIME-Version: 1.0
Message-Id: <00060812281701.00347@P100>
List-ID: <linux-parisc.vger.kernel.org>

Hi Tara,

Am Wed, 07 Jun 2000 schrieb Tara Dear:
> I am trying to boot a 712/80.
>
> When built with ramdisk20000530-sticon.tgz and specifing sti console in
> menuconfig, make dep doesn't run clean

I will look into this later this evening. 
(did you disabled the serial-console in this configuration ?).

>
> When built with ramdisk2000530-sticon.tgx and NOT specifing sti console
> in menusconfig, make dep works but  booting stops after :
>
>         kmem_create: Forcing size work alignment -nfs_fh
>         VFS: Mounted root (ext2 filesystem)
>         request_irq(538, c01bb030, 0x4000000, serial, c0289794)

This seems to be correct. The kernel switches to the serial-console, so that 
all output goes to your serial port. You should check it again with 
ramdisk20000530-sercon.tgz or change the major/minor of /dev/console in the 
sticon-ramdisk to 5,1. 

>
> At this point certain key strokes create responses
>         keyb_at: K_NONE for 125                              //when
> pushing page up
> or
>         keyboard: unrecognized scancode (61) - ignored
> //when pushing ctrl

you get this output, because we do not disable the pdc-console completely for 
now.

>
> I can ping the 712 but I can't get the console.
>
> Any ideas??
>
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
