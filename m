Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA10700
	for <parisc-linux@puffin.external.hp.com>; Wed, 8 Dec 1999 16:30:23 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.16.124.11])
	by atlrel1.hp.com (Postfix) with ESMTP id 4821D9D3B
	for <parisc-linux@thepuffingroup.com>; Wed,  8 Dec 1999 18:32:32 -0500 (EST)
Message-Id: <199912082333.PAA03087@milano.cup.hp.com>
To: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] /usr/conf/machine header files 
In-reply-to: Your message of "Mon, 06 Dec 1999 00:27:08 PST."
             <19991206002708.A16979@mathe.stud.uni-erlangen.de>
Date: Wed, 08 Dec 1999 15:33:30 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> > This directory seems to be a gold mine of information about hardware.
> 
> One extremely interesting piece of information for those interested in the
> PA2.0 port:  64-bit virtual addresses are 42 bits per quadrant only and
> start at the smallest address in the quadrant - so unlike alpha where the
> addresses are "sign-extended".

Actually, HP-UX does sign extend I/O addresses. I'm not sure
if this is a feature of HP-UX or something in the HW makes it
easier to do it this way...anyone know?

Secondly, don't make assumptions about how many bits are used in
a virtual or physical addresses unless it's processor specific code.
(eg TLB handler or trap handler or hpmc handler). I know the number
of physical bits supported by the processor is going to increase
from 40-bits (runway).

cheers,
grant

Grant Grundler
Unix Developement Lab
+1.408.447.7253
