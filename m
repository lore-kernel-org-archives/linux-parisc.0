Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.powertech.no (smtp1.powertech.no [195.159.0.145])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5007E482B
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Jul 2001 12:25:45 -0600 (MDT)
Message-ID: <000f01c108a5$0f9825e0$0201a8c0@andy>
From: "Andy Walker" <squawker@start.no>
To: <parisc-linux@lists.parisc-linux.org>,
	"Richard Hirst" <rhirst@linuxcare.com>
References: <OFE6582140.671FFFD5-ONC1256A81.00401A6F@LocalDomain> <20010709084633.C23509@linuxcare.com> <994679274.3b4999ea6d75d@epost.start.no> <20010709182016.L23509@linuxcare.com>
Subject: Re: [parisc-linux] palinux 0.9.1
Date: Mon, 9 Jul 2001 20:29:15 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

> On Mon, Jul 09, 2001 at 01:47:54PM +0200, Andy Walker wrote:
> > Quoting Richard Hirst <rhirst@linuxcare.com>:
> > > 
> > > You are not the only person with this problem, so
> > > hopefully someone will fix it soon.
> > > 
> > > Richard
> > 
> > Hi folks,
> > 
> > Just a note to say that I'm experiencing this too. I've
> > a B132L, 192MB, 2gb+4gb wide/diff disks. Firmware is
> > patched up to 6.1, the latest I could find. Boots nicely
> > now that I told it the console is on the built in frame
> > buffer GRAPHICS(0) rather than the HCRX24/GRAPHICS(2) -
> > but the ps/2 keyboard locks up at the first Debian
> > install screen.
> > 
> > Time for a serial install I guess.
> 
> I've just heard that this might be a keyboard reset problem, and
> simply unplugging and replugging the keyboard at that point may
> make it work.
> 
> Richard

I'm afraid not :-( Didn't work for me 5 minutes ago. I noticed
there's a WAX HIL device on these B models - pity there's no
connector for that 'cos I've got a HIL keyboard and mouse
laying around downstairs.

-Andy
