Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from zandfmgw6.za.didata.com (zandfmgw6.za.didata.com [196.36.8.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8F1BF482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 31 Jul 2001 06:28:32 -0600 (MDT)
Received: from zandfexc4.didata.co.za (unverified) by zandfmgw6.za.didata.com
 (Content Technologies SMTPRS 4.2.1) with ESMTP id <T551592ce6cc424081a598@zandfmgw6.za.didata.com> for <parisc-linux@lists.parisc-linux.org>;
 Tue, 31 Jul 2001 13:29:22 -0700
Message-ID: <ADC0FD85146AD511972C0050DA09165007DAB1@zahbw0sv02.ics.didata.com>
From: "Andrew Gaylard (Dimension Data)" <Andrew.Gaylard@za.didata.com>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Dead keys in X
Date: Tue, 31 Jul 2001 13:33:41 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

(My apologies for spamming the entire list with HTML.
Mozilla worked fine for my first message, but since then 
seems to refuse to produce vanilla text messages.
I'm now trying with a different mail client; hopefully
that sorts it out.)

I tried using 
	xmodmap -e "keycode 0xE0 = i"
but the result was the same.  I think the bigger problem
here is that the 'o'-button sends nothing at all.  If it
doesn't even produce an X event to start with, it can't 
be remapped.

Anyone with some Xpertise out there who can say where 
the server assigns keycodes in the first place?

-----Original Message-----
From: Helge Deller [mailto:helge.deller@sap.com]
Sent: 30 July 2001 17:51
To: Andrew Gaylard; parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Dead keys in X


On Monday 30 July 2001 17:02, Andrew Gaylard wrote:
> The 'i' and 'o' keys in X are dead.  The 'i'-key at least
> sends a keycode-224 to X (as viewed in xev), but if I try
>
> 	xmodmap -e "keycode 224 = i"
>
> I get the error:
> 	xmodmap: commandline:0: bad keycode value (out of range)


Hi Andrew,

Just an idea: Does 
		xmodmap -e "keycode 0xE0 = i"
works ?

Helge



**********************************************************************
This email and any files transmitted with it are confidential and
intended solely for the use of the individual or entity to whom they
are addressed. If you have received this email in error please notify
the system manager.

This footnote also confirms that this email message has been swept by
MIMEsweeper for the presence of computer viruses.

www.mimesweeper.com
**********************************************************************
