Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA25979
	for <parisc-linux@puffin.external.hp.com>; Mon, 13 Mar 2000 09:08:57 -0700
Message-ID: <20000313151007.24401.qmail@web507.mail.yahoo.com>
Date: Mon, 13 Mar 2000 07:10:07 -0800 (PST)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
Subject: Re: [parisc-linux] HIL_BASE ("finding" devices)
To: Philipp Rumpf <prumpf@inwestnet.de>, "Brian S. Julin" <bri@mojo.calyx.net>,
        g@abacus.local
Cc: parisc-linux <parisc-linux@thepuffingroup.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

--- Philipp Rumpf <prumpf@inwestnet.de> wrote:
> On Sun, Mar 12, 2000 at 03:52:52PM -0500, Brian S.
> Julin wrote:
> > I've only just really started to hack at the HIL
> driver, but
> > one thing I noticed off the bat is that the
> HIL_BASE defined
> > in hil.h is 0xf0821000 while the device base
> listed when 
> > I boot for the HIL is 0xf0201000.  This probably
> means it 
> > varies across different models.
> 
> It probably does.   AFAIK, the HIL driver is pretty
> much a hack
> Matthew did to get his 715's keyboard working (the
> 715 and keyboard
> are here now and Matthew is in Ottawa, and I don't
> have it set up
> so didn't work on the driver).
> 
0xf0821000 is the HIL device address connected via ASP
(Model 715/33 and maybe others?). 0xf0201000 is the
HIL device address connected via WAX / LASI.

If you need a tester for a new HIL-driver on a 715/33
(like Matthew was using), please let me know. I have
been using Matthew's hack on my workstation until it
ceased to work, and it allowed me to see the first
responses at the sash prompt.

Ulrich


__________________________________________________
Do You Yahoo!?
Talk to your friends online with Yahoo! Messenger.
http://im.yahoo.com
