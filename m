Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA21087
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Oct 1999 09:18:25 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by cosrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id JAA02374
	for <parisc-linux@thepuffingroup.com>; Fri, 22 Oct 1999 09:19:15 -0600 (MDT)
Message-Id: <199910221519.IAA00565@milano.cup.hp.com>
To: Magne =?iso-8859-1?Q?=D8stlyngen?= <magne@spacetec.no>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] So you wanna get to a prompt, eh? 
In-reply-to: Your message of "Fri, 22 Oct 1999 16:22:40 PDT."
             <38107330.E3716195@spacetec.no>
Date: Fri, 22 Oct 1999 08:19:19 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Magne =?iso-8859-1?Q?=D8stlyngen?= wrote:
> > The 700 has an ancient IO architecture that we don't have any
> > documentation on, so it's not high on the list of priorities.
> 
> But it is possible to get the docs from HP?

Yes. If HP can find them and verify it doesn't contain someone else's
Intellectual Property (which isn't published already).
HP sees releasing old docs as a low priority since it doesn't
generate revenue. IMHO, the only way this is going to happen is
if some HP person does this in their spare time and then gets the
right signatures/approval.

I've done some of this but don't care about boxes older than 715's
or servers older than K or D class.

> > However, if
> > someone has patches to support it, we'd be happy to apply them.
> > As for cross compiling... we're forced to use HPUX because we don't have a
> > reasonable and functioning cross linker. More on that later.
> 
> Is it possible to compile with linux, and do only the linking on the hp?

This sounds possible but doesn't seem reasonable.

> (It isn't very fast.. :)  Can I link with HPUX 9.03? (probably not)
> 10.30? (It doesn't run 11.x)

Use 10.20. It should run on your 710. Don't use 10.30 as it was never
intended for distribution on workstations and certainly doesn't have
the support which WSY has poured into 10.20.

grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
