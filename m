Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from opus.allegro.com (opus.allegro.com [209.10.39.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D46348B0
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Oct 2001 10:31:57 -0600 (MDT)
From: Stan Sieler <sieler@allegro.com>
Message-Id: <200110041631.JAA19873@opus.allegro.com>
Subject: Re: [parisc-linux] Unaligned data reference...
To: nneul@umr.edu (Neulinger, Nathan)
Date: Thu, 4 Oct 2001 09:31:52 -0700 (PDT)
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D851@umr-mail03.cc.umr.edu> from "Neulinger, Nathan" at Oct 04, 2001 08:24:38 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Re:

> inst2 login: swapper[0]: Unaligned data reference 28
...
> r4-7     109e8db2 10380ac8 0000000c 109e8d94
...
>  IIR: 0c801093    ISR: 00000000  IOR: 109e8db2

That's:   LDWS     0(0,4),19
and R4 is $109e8db2   (which is only 2-byte aligned)

BTW, pardon me for asking what might be an easy question, but...
how does one disassemble an instruction on HP-UX / Linux?

thanks,

-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html                  www.sieler.com
