Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA19805
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Sep 1999 10:43:20 -0600
Sender: adevries@thepuffingroup.com
Message-ID: <37E90B1E.526ADF6F@thepuffingroup.com>
Date: Wed, 22 Sep 1999 13:00:14 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: Philipp Rumpf <prumpf@suse.de>
CC: Hannu Martikka <martikka@stybba.ntc.nokia.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/80 problems
References: <199909162158.OAA21289@milano.cup.hp.com> <Pine.HPX.4.05.9909221438440.2148-100000@gamgee.ntc.nokia.com> <19990922153509.B5481@suse.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> 
> > With 715/80 I get following:
> > Boot
> > :disk(....)/stand/vmlinux
> 
> you might want to try to boot via tftp / bootp as this is what most of us do
> and it seems to work for us.

There's definitely a problem with booting off of a disk, and I'm not
sure what the problem really is.  It'd be great if someone could look
into this, I know we're not implementing the entire LIF header.

Has *anyone* been able to boot from disk?

- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
