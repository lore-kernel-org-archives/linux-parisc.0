Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA32162
	for <parisc-linux@puffin.external.hp.com>; Wed, 9 Aug 2000 18:28:18 -0600
From: Bdale Garbee <bdale@gag.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: PA/Linux CD Image
In-Reply-To: <39917C97.4DC81F31@gmx.de>
Message-Id: <20000809182812.78B76363F3@rover.gag.com>
Date: Wed,  9 Aug 2000 12:28:12 -0600 (MDT)
List-ID: <linux-parisc.vger.kernel.org>

In article <39917C97.4DC81F31@gmx.de> you wrote:

> if i put
> some effort into installing it then I'll like to use it as a basis for
> further updates, e.g. when there will be eventually a stable kernel I
> want to install it over this distribution. I'll have to install probably
> some further programs, too. Will this be possible with a "reasonable"
> effort?

That depends on your definition of "reasonable".  :-)  I don't think anyone
expects you to "install" the bits on this CD.  The image is bootable, and it
should be possible to play around quite a bit running from the CDROM root.

My personal spin on this is that if it's not hard for you to burn a CR-R, or
if you were to acquire a physical disk at LWCE, then it's probably worth 
dropping it in a CDROM drive and booting it to see what's there and what does
and doesn't work.  It may not be worth trying to install this onto your hard
disk for any reason other than intellectual curiosity unless you intend to
dive in and help the team complete the porting work.  Even then, I find it 
desireable to work over an nfsroot and not a local disk installation.

We're getting close (a couple of months, maybe) from being able to offer 
a relatively normal Debian installation/upgrade process.  If you want to 
*use* parisc-linux (as opposed to helping get the port finished), that is
probably a better trigger event to wait for.

Bdale
