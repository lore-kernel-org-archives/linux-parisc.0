Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id CAA02033
	for <parisc-linux@puffin.external.hp.com>; Fri, 7 Jan 2000 02:38:03 -0700
Received: from [10.1.1.3] (helo=tele02.tunstall.co.uk)
	by gate-isdn.tunstall.co.uk with esmtp (Exim 2.12 #1)
	id 126VqM-0002HJ-00
	for parisc-linux@thepuffingroup.com; Fri, 7 Jan 2000 09:38:02 +0000
Message-ID: <51C39E66FF96D11194FCAA0004000304933A96@tele02.localnet>
From: Mark Wild <M_Wild@tunstall.co.uk>
To: parisc-linux@thepuffingroup.com
Subject: RE: [parisc-linux] Thanks...alot 
Date: Fri, 7 Jan 2000 09:39:52 -0000 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>



> -----Original Message-----
> From: eric@cirr.com [mailto:eric@cirr.com]
> Sent: Thursday, January 06, 2000 9:08 PM
> To: Mark Wild
> Cc: parisc-linux@thepuffingroup.com
> Subject: Re: [parisc-linux] Thanks...alot 
> 
> 
> 
> Mark Wild writes:
> - From: eric@cirr.com [mailto:eric@cirr.com]
> - >  If not,
> - > I'd suggest that either /bin/sh is missing, or HP-UX doesn't
> - > agree with the hardware about where the console is, and the
> - > shell is always getting an EOF when it tries to read the
> - > console.
> - 
> - It manages to boot into multi-user mode OK.
> 
> 	Do you see any output from the system rc scripts during
> multi-user boot??

Yes. It performs a quota check etc, gets to a console login before
X kicks in.
 
> - > 	At this point, I'd be more towards a missing shell.
> - 
> - I inherited the machine from my University as it was surplus
> - to requirements due to upgrading. Could it be possible that
> - the sysadmins have deliberately done this to prevent inquisitive
> - students ?
> 
> 	I suppose it's possible, but I'd venture it unlikely, as
> it's a bit more pain than the gain, at least in my opinion..
> 
> 	You might check to see what interpreter is called out at
> the top of /etc/rc.  If it's still /bin/sh, go verify what
> /bin/sh points to..

How can I do that? I'm not familiar with all the options/commands
of the hpux command from the ISL prompt.

> 	From a strings on a 9.03 init, it appears that init
> might attempt to start /bin/ksh, /bin/csh, /bin/sh, and /bin/su.
> You might want to verify the existance of those (/bin/su in
> particular).

> 	The 9.03 init I'm looking at also appears to look for
> consoles on /dev/systty, /dev/syscon and /dev/console. You might
> verify that they all point to useful locations..

OK. I'll check these.

<snip>

Cheers, Mark.
