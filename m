Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA05382
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 Jan 2000 14:06:45 -0700
Message-Id: <200001062108.PAA22757@opus.cirr.com>
From: eric@cirr.com (Eric Schnoebelen)
To: Mark Wild <M_Wild@tunstall.co.uk>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Thanks...alot 
In-reply-to: Your message of "Thu, 06 Jan 2000 09:03:19 GMT."
             <51C39E66FF96D11194FCAA00040003048F3830@tele02.localnet>
Date: Thu, 06 Jan 2000 15:08:15 -0600
Sender: eric@cirr.com
List-ID: <linux-parisc.vger.kernel.org>


Mark Wild writes:
- From: eric@cirr.com [mailto:eric@cirr.com]
- >  If not,
- > I'd suggest that either /bin/sh is missing, or HP-UX doesn't
- > agree with the hardware about where the console is, and the
- > shell is always getting an EOF when it tries to read the
- > console.
- 
- It manages to boot into multi-user mode OK.

	Do you see any output from the system rc scripts during
multi-user boot??

- > 	At this point, I'd be more towards a missing shell.
- 
- I inherited the machine from my University as it was surplus
- to requirements due to upgrading. Could it be possible that
- the sysadmins have deliberately done this to prevent inquisitive
- students ?

	I suppose it's possible, but I'd venture it unlikely, as
it's a bit more pain than the gain, at least in my opinion..

	You might check to see what interpreter is called out at
the top of /etc/rc.  If it's still /bin/sh, go verify what
/bin/sh points to..

	From a strings on a 9.03 init, it appears that init
might attempt to start /bin/ksh, /bin/csh, /bin/sh, and /bin/su.
You might want to verify the existance of those (/bin/su in
particular).

	The 9.03 init I'm looking at also appears to look for
consoles on /dev/systty, /dev/syscon and /dev/console. You might
verify that they all point to useful locations..

- > 	FYI: 10.20 may still be available for free under HP's Y2K
- > upgrade program.  I ordered the 10.20 Y2K OS kit on the 30th.  I
- > haven't seen it yet, but that's another kettle..  Visit
- > http://www.hp.com/visualize/programs/y2k/y2k_menu/y2k_upgr/oskit.html
- > for more details.
- 
- I have the upgrade media (P/N B7989AA) but it doesn't seem to
- contain anything for a cold install, just patches for 9.x to 10.20
- although from previous posts I see some people claim to have done this.

	As I recall, there were no `patches' to go from 9.0x to
10.20 (given the filesystem was radically reorganized, etc.), so
I would expect that the `Upgrade Media' should be bootable..
Although, I don't have a copy, and you do..

	The P/N I'm looking at on the above mentioned page is
B6815AA, and is listed as including HP-UX 10.20 Core, ACE 9906
Core/Install CD, Quality packs, etc..

- Who did you contact regarding the above link?

	Who ever answered the phone when I called the US
fulfillment phone number (1800.386.1117, ext 4).  Karen, I
believe.  I'm sure there is another fulfillment operation in the
UK or Europe that could help you out (although I don't see such
phone numbers listed.)

- > - Any suggestions as to what I can do to get root ?
- > 
- > 	At this point, you probably need to boot off of the
- > installation media, and try to replace what appears to be a
- > missing shell.
- 
- Hmm, looks like I'm snookered then ...

	Possibly..

--
Eric Schnoebelen		eric@cirr.com		 http://www.cirr.com
		"Strange things are afoot at the Circle-K"
			 -- Bill and Ted's Excellent Adventure
