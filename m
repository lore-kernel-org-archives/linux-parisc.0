Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id CAA30199
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 Jan 2000 02:01:53 -0700
Received: from [10.1.1.3] (helo=tele02.tunstall.co.uk)
	by gate-isdn.tunstall.co.uk with esmtp (Exim 2.12 #1)
	id 1268nY-0004jZ-00
	for parisc-linux@thepuffingroup.com; Thu, 6 Jan 2000 09:01:36 +0000
Message-ID: <51C39E66FF96D11194FCAA00040003048F3830@tele02.localnet>
From: Mark Wild <M_Wild@tunstall.co.uk>
To: parisc-linux@thepuffingroup.com
Subject: RE: [parisc-linux] Thanks...alot 
Date: Thu, 6 Jan 2000 09:03:19 -0000 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>



> -----Original Message-----
> From: eric@cirr.com [mailto:eric@cirr.com]
> Sent: Thursday, January 06, 2000 3:23 AM
> To: Mark Wild
> Cc: parisc-linux@thepuffingroup.com
> Subject: Re: [parisc-linux] Thanks...alot 
> 
> 
> 
> Mark Wild writes:
> - From: eric@cirr.com [mailto:eric@cirr.com]
> - > tom@piace.com writes:
> - > - 	Does anyone know if hp has a development 
> version of hpux like
> - > - sun has with solaris?  If not does anyone know of a way 
> to reset the
> - > - password from the console.
> - > 
> - > 	Depending upon the OS version and the settings, you
> - > should be able to boot the system to single user mode, and reset
> - > the password.  I'm a bit out of practice, but if you ``boot
> - > isl'', and then enter `/hp-ux -is' (for 9.0x) or `/stand/vmunix
> - > -is' (for 10.20), you should be get a single user prompt,
> - > without having to enter a password (later OS versions may
> - > require the root password to enter single user mode.)
> - 
> - <snip>
> - 
> - Being in a similar predicament with a 710 workstation I managed
> - to get to the ISL prompt but to boot into single user mode
> - I needed to enter 'HPUX -is /hp-ux'. However, after file system
> - checking I got a repeated message along the lines of:
> - 
> - INIT: SINGLE USER MODE
> - 
> - This just filled up my screen.
> 
> 	Do you get anything besides the above message??

No, it just repeatedly produces that message.

>  If not,
> I'd suggest that either /bin/sh is missing, or HP-UX doesn't
> agree with the hardware about where the console is, and the
> shell is always getting an EOF when it tries to read the
> console.

It manages to boot into multi-user mode OK.

> 	At this point, I'd be more towards a missing shell.

I inherited the machine from my University as it was surplus
to requirements due to upgrading. Could it be possible that
the sysadmins have deliberately done this to prevent inquisitive
students ?

> 	From your boot command line, it sounds like the box is
> running 9.0x.  Is this true?

Yes, 9.01.

> 
> 	FYI: 10.20 may still be available for free under HP's Y2K
> upgrade program.  I ordered the 10.20 Y2K OS kit on the 30th.  I
> haven't seen it yet, but that's another kettle..  Visit
> http://www.hp.com/visualize/programs/y2k/y2k_menu/y2k_upgr/oskit.html
> for more details.

I have the upgrade media (P/N B7989AA) but it doesn't seem to
contain anything for a cold install, just patches for 9.x to 10.20
although from previous posts I see some people claim to have done this.

Who did you contact regarding the above link?

> - Any suggestions as to what I can do to get root ?
> 
> 	At this point, you probably need to boot off of the
> installation media, and try to replace what appears to be a
> missing shell.

Hmm, looks like I'm snookered then ...

Thanks,

Mark Wild.
