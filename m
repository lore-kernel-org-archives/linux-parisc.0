Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C60D482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 10:05:48 -0600 (MDT)
Message-Id: <200109211603.KAA01633@puffin.external.hp.com>
To: =?iso-8859-1?Q?Andreas_H=E4rtel?= <andreas@malcolm.in-chemnitz.de>
Cc: "Parisc-Linux (E-Mail)" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 712/60 boots fine 
In-Reply-To: Message from =?iso-8859-1?Q?Andreas_H=E4rtel?= <andreas@malcolm.in-chemnitz.de>
   of "Fri, 21 Sep 2001 10:38:24 +0200." <000401c14278$c79760e0$0350a8c0@genesis>
Date: Fri, 21 Sep 2001 10:03:08 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

=?iso-8859-1?Q?Andreas_H=E4rtel?= wrote:
> It is difficult to understand for a newbie, that PALO needs file system type
> 'F0' but this type is unknown by fdisk.
> Or the 2. mistake, the partition where vmlinux is located must be lower or
> equal 2 GByte.

Both issues are documented in the palo documentation.
See "man palo" (which points to /usr/share/doc/palo/).
The install ISO's also had/have a README.INSTALL that tells one about
both issues as well.
(Kudos to Paul Bame - he did an excellent job with both)

Is there a more obvious place this should be documented?
(ie where did you look?)

> Thanks
> 
> Andreas

thanks,
grant
