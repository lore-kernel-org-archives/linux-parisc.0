Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web11207.mail.yahoo.com (web11207.mail.yahoo.com [216.136.131.189])
	by dsl2.external.hp.com (Postfix) with SMTP id 9F32D482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Jul 2001 08:42:32 -0600 (MDT)
Message-ID: <20010712144225.20503.qmail@web11207.mail.yahoo.com>
Date: Thu, 12 Jul 2001 07:42:25 -0700 (PDT)
From: Charles Boone <ccboone@yahoo.com>
Subject: Re: [parisc-linux] Re: Problem installing .9 iso image on C240
To: Richard Hirst <rhirst@linuxcare.com>,
	Grant Grundler <grundler@puffin.external.hp.com>
Cc: Charles Boone <ccboone@yahoo.com>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20010711094816.G18375@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

One piece of info that I did not include,  which I
thought might be relative to the ps/2 issue.  I am not
sure it is, but I do not have a keyboard or mouse
connected on the c240.  I was pretty sure that it
would not be a problem, since it would be just like
having a dumb terminal on it.


--- Richard Hirst <rhirst@linuxcare.com> wrote:
> On Tue, Jul 10, 2001 at 11:36:25PM -0600, Grant
> Grundler wrote:
> > Richard Hirst wrote:
> > > IAOQ = _gsc_readl + 8
> > > called from dino_in32()
> > > I guess it was dino_in32(0xc1b21ec0), which
> looks odd.
> > 
> > It's definitely wrong. dino_in32() pokes dino to
> generate IO Port
> > transactions and Dino lives in 0xF... address
> range. This suggests the
> > pci_dev->sys_data is garbage (perhaps not
> initialized?) or points to garbage.
> > Perhaps for Dino's built-in PS/2 or RS232 port?
> > 
> > Sorry, I didn't follow this thread earlier. Does
> console output hint
> > which PCI device was involved (if any)?
> 
> Not obviously, and it failed in the middle of the
> install, so presumably
> whatever device was involved had been accessed
> successfully earlier.
> 
> Richard
> 


__________________________________________________
Do You Yahoo!?
Get personalized email addresses from Yahoo! Mail
http://personal.mail.yahoo.com/
