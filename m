Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA20165
	for <parisc-linux@puffin.external.hp.com>; Fri, 16 Jun 2000 12:10:44 -0600
Message-ID: <2FF13E24F61AD41193130008C791A76031F109@boca215a.boca.ssc.siemens.com>
From: "D'Angelo, James" <James.D'Angelo@icn.siemens.com>
To: "'Helge Deller'" <deller@gmx.de>, jdangelo@techie.com
Cc: parisc-linux@thepuffingroup.com
Subject: RE: [parisc-linux] Booting vmlinux.
Date: Fri, 16 Jun 2000 14:09:24 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

I'm using a 712/80.  I'll switch to the sercon.  What would the default
speed/parity be?  I did have some more success with sti, but I don't appear
to have a complete shell (ie -ls -mv) and I don't seem to have anyway to
mount or transfer files over.  I would think I would use palo again to make
the disk bootable so I don't have to use bootp.

Thanks a lot for your help.  I am new at this and appreciate all the
help/hints I get.

jdangelo@techie.com


 -----Original Message-----
From: 	Helge Deller [mailto:deller@gmx.de] 
Sent:	Friday, June 16, 2000 1:45 PM
To:	jdangelo@techie.com
Cc:	parisc-linux@thepuffingroup.com
Subject:	Re: [parisc-linux] Booting vmlinux.

Hi James,
[cc'ed to parisc-linux]

- Please use the serial-console for now, because the keyboard-support is 
currently very limited with STI-console (=Graphics-console).

All following suggestions are meant for serial console:
------------------------------------------
- do you use ramdisk-20000530-sercon.tgz (gunziped in /linux-2.3) ?
- the best solution is to delete your /linux-2.3/.config-file and do a fresh

"make menuconfig".
- do you have "block_devices/inital ramdisk support" enabled ?
- you need to have "character_devices/serial_support/console on serial port"

enabled and "console_drivers/STI_Console" disabled.
- major/minor of /dev/console in your ramdisk or nfs-exported tree needs to 
be 5/1  (4/1 for STI-Console!)  [That's the only difference between 
ramdisk20000530-[sercon|sticon].tgz]
- take a look at the comments in palo/Makefile prior building the kernel
with 
"make palo".
- which machine are you using ?

That's all for now :-)

Helge.

Am Fri, 16 Jun 2000 schrieben Sie:
> Yes, I figured that out.  Except some of the recipes and config
> documentation says to put vmlinux in the bootptab for tftp (which does
> appear to be wrong).  I'm getting the kernel to boot with networking, but
> am still having an issue getting a login either on a serial console or
> preferably the graphics console.
>
> Any ideas?
>
> Jay
>
>
>  -----Original Message-----
> From: 	Helge Deller [mailto:deller@gmx.de]
> Sent:	Thursday, June 15, 2000 9:41 PM
> To:	jdangelo@techie.com
> Subject:	Fwd: Re: [parisc-linux] Booting vmlinux.
>
>
>
> ----------  Weitergeleitete Nachricht  ----------
> Subject: Re: [parisc-linux] Booting vmlinux.
> Date: Fri, 16 Jun 2000 03:38:39 +0200
> From: Helge Deller <deller@gmx.de>
> To: "D'Angelo, James" <James.D'Angelo@icn.siemens.com>
>
>
> Hi James,
>
> Am Fri, 16 Jun 2000 schrieb D'Angelo, James:
> > I've successfully done "make palo" and have followed the directions. 
> > From a 712/80, I am doing a boot lan from the PDC.  My TFTP seems
> > configured fine, but the only thing I see in my syslog is:
> >
> > Jun 15 19:28:49 boca08 bootpd[2595]: bootsize=2288612
>
> hp->bootsize=2288612
>
> > Jun 15 19:29:15 boca08 tftpd[3765]: Transfer timed out
> >
> > The 712/PDC just says: Selecting a system to boot.
> > Any ideas?
>
> Maybe a stupid question, but you are trying to boot palo/lifimage and not
> the
> vmlinux-file (which is wrong!) ?
>
> Greetings,
> Helge.
>
> > Jay D'Angelo
> > jdangelo@techie.com <mailto:jdangelo@techie.com>
>
> -------------------------------------------------------
