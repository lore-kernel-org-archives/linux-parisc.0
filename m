Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA23366
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Jun 1999 01:32:44 -0600
To: Alex deVries <adevries@thepuffingroup.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] A quick update 
Reply-To: law@cygnus.com
In-reply-to: Your message of Fri, 18 Jun 1999 03:22:21 EDT.
             <3769F3AD.DF068942@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 18 Jun 1999 01:26:21 -0600
Message-ID: <13166.929690781@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <3769F3AD.DF068942@thepuffingroup.com>you write:
  > - we need an HPUX ld linker script to resolve the vmlinux building,
  > what's the format for this?
No such animal that I'm aware of.

There is some rough ordering control using the space/subspace sort keys, but
you don't get absolute control over where stuff ends up in memory.

In what ways do you need to control the layout of stuff in memory?

jeff
