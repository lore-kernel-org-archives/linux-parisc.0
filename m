Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id C5F454A19
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Feb 2001 11:19:55 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA29150
	for <parisc-linux@puffin.external.hp.com>; Mon, 5 Feb 2001 11:15:40 -0700
Message-Id: <200102051822.KAA02233@milano.cup.hp.com>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] RFC: I/O tree design 
In-reply-to: Your message of "Sat, 03 Feb 2001 00:17:52 PST."
             <3A7BB0A0.D478911A@uswest.net>
Date: Mon, 05 Feb 2001 10:22:11 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Ryan Bradetich wrote:
> Here is my proposal for phase 2 of the I/O tree for parisc-linux.

Overall, this sounds ok to me.
Just a nit WRT to terminology.

...
> This proposal also calls for a special "root" node at
> index 0 of the device array.  The root node is the starting
> point of the I/O tree and does not have a parent, nor any
> siblings.  The root node has a single child pointer which
> points to the head of the sibling list for the system
> bus.

I would call the "root" node the "parent psuedo-bus adapter"
(or something like that) of the central bus. It's special because
it generally won't represent a physical PA I/O device. But it does
contain a "lower port address" - the fixed PA IO address your
previous bus-walk patch started with.

The idea here is you can pass "hp_device *" to your PA bus walk code
and not have seperate code for central bus or GSC bus. The bus walk
code could use the "lower port address" as a new starting point to
poke around.


thanks,
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
