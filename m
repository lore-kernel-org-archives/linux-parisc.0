Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA19550
	for <parisc-linux@puffin.external.hp.com>; Fri, 16 Jun 2000 11:45:04 -0600
From: Helge Deller <deller@gmx.de>
To: jdangelo@techie.com
Subject: Re: [parisc-linux] Booting vmlinux.
Date: Fri, 16 Jun 2000 19:45:27 +0200
Content-Type: text/plain
References: <2FF13E24F61AD41193130008C791A76031F107@boca215a.boca.ssc.siemens.com>
In-Reply-To: <2FF13E24F61AD41193130008C791A76031F107@boca215a.boca.ssc.siemens.com>
Cc: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Message-Id: <00061619452700.11665@P100>
List-ID: <linux-parisc.vger.kernel.org>

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
- take a look at the comments in palo/Makefile prior building the kernel with 
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
