Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.lokmail.net (MAIL.LOKMAIL.NET [209.48.2.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7962B4837
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 10:32:56 -0600 (MDT)
Received: from mail.lokmail.net (localhost [127.0.0.1])
	by mail.lokmail.net (8.9.3/8.9.3) with ESMTP id MAA25337
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 12:32:51 -0400
Message-Id: <200109271632.MAA25337@mail.lokmail.net>
From: Jurij Smakov <jurij@lokmail.net>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720 - some progress 
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Thu, 27 Sep 2001 12:32:51 -0400
Sender: jurij@mail.lokmail.net
List-ID: <linux-parisc.vger.kernel.org>

> A quick glance at arch/parisc/hardware/inventory.c reveiled the
> following:
> 
> long status;
> unsigned int bus_id;
> ...
> status = pdc_model_info(&model);
> bus_id = (model.hversion >> (4 + 7)) & 0x1f;
> 
> switch (bus_id) {
> case 0x4:               /* 720, 730, 750, 735, 755 */
> 
> I don't know if all these models have the same CPU. I'm guessing not.
> 
> I also see a parisc_get_cpu_type(...) in arch/parisc/kernnel/hardware.c.
> This is probably what you want.
> 
> Regards,
> 
> Albert

Hi Albert!

As Matthew pointed out, it is not neccessary to determine the CPU type.
"Normal" (newer) CPU's do not consider reading from cr26 and cr27 to
be privileged operations, so the condition, which is checked in the
patch will just never occur for them. Actually, did you try it? I'm
very interested in the results.

Cheers,

Jurij.
