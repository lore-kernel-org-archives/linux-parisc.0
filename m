Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA15953
	for <parisc-linux@puffin.external.hp.com>; Wed, 5 Jan 2000 01:58:35 -0700
Received: from [10.1.1.3] (helo=tele02.tunstall.co.uk)
	by gate-isdn.tunstall.co.uk with esmtp (Exim 2.12 #1)
	id 125mH6-0007D1-00
	for parisc-linux@thepuffingroup.com; Wed, 5 Jan 2000 08:58:37 +0000
Message-ID: <51C39E66FF96D11194FCAA00040003048F3640@tele02.localnet>
From: Mark Wild <M_Wild@tunstall.co.uk>
To: parisc-linux@thepuffingroup.com
Subject: RE: [parisc-linux] Thanks...alot 
Date: Wed, 5 Jan 2000 09:00:00 -0000 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>



> -----Original Message-----
> From: eric@cirr.com [mailto:eric@cirr.com]
> Sent: Thursday, December 30, 1999 4:54 PM
> To: tom@piace.com
> Cc: parisc-linux@thepuffingroup.com
> Subject: Re: [parisc-linux] Thanks...alot 
> 
> 
> 
> tom@piace.com writes:
> - 	Does anyone know if hp has a development version of hpux like
> - sun has with solaris?  If not does anyone know of a way to reset the
> - password from the console.
> 
> 	Depending upon the OS version and the settings, you
> should be able to boot the system to single user mode, and reset
> the password.  I'm a bit out of practice, but if you ``boot
> isl'', and then enter `/hp-ux -is' (for 9.0x) or `/stand/vmunix
> -is' (for 10.20), you should be get a single user prompt,
> without having to enter a password (later OS versions may
> require the root password to enter single user mode.)
> 

<snip>

Being in a similar predicament with a 710 workstation I managed
to get to the ISL prompt but to boot into single user mode
I needed to enter 'HPUX -is /hp-ux'. However, after file system
checking I got a repeated message along the lines of:

INIT: SINGLE USER MODE

This just filled up my screen.

Any suggestions as to what I can do to get root ?

Mark Wild.
