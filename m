Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA05760
	for <parisc-linux@puffin.external.hp.com>; Sun, 26 Sep 1999 12:35:00 -0600
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <37EE6973.5D758C47@uswest.net>
Date: Sun, 26 Sep 1999 12:44:03 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: Alex deVries <adevries@thepuffingroup.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] cleaning up IPL and ramdisks
References: <37EE67F2.D4C786B5@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:

> We've talked for awhile about rewriting all the bootup stuff, it's
> served us well until now, but it really needs a rewrite to make it a lot
> cleaner.  Is anyone interested in taking this on?  Helge?

Alex,

I am interested in helping since I've been struggling to get the kernel to
boot on the PA-RISC 2.0 architecture.

-Ryan

>
> The new version should use the same PDC calls as the rest of the kernel,
> use the entire LIF structure declared in the HPUX header files.
> Philipp, did you have any other thoughts?
>
> - Alex
>
> --
> Alex deVries
> Vice President of Engineering
> The Puffin Group
>
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
