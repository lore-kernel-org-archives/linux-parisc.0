Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA09978
	for <parisc-linux@puffin.external.hp.com>; Thu, 20 Apr 2000 16:36:46 -0600
Received: from l3107mxr.atl.hp.com (l3107mxr.atl.hp.com [15.19.254.19])
	by cosrel2.hp.com (Postfix) with ESMTP id 7F1061BD
	for <parisc-linux@thepuffingroup.com>; Thu, 20 Apr 2000 16:36:33 -0600 (MDT)
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by l3107mxr.atl.hp.com (Postfix) with ESMTP id 8D8AE4FD84
	for <parisc-linux@thepuffingroup.com>; Thu, 20 Apr 2000 18:36:43 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id PAA02144 for <parisc-linux@thepuffingroup.com>; Thu, 20 Apr 2000 15:36:56 -0700 (PDT)
Message-Id: <200004202236.PAA02144@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2-way j5000 hangs early 
In-reply-to: Your message of "Thu, 20 Apr 2000 15:08:02 PDT."
             <200004202208.PAA02080@milano.cup.hp.com>
Date: Thu, 20 Apr 2000 15:36:56 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:

> I also noticed that we don't print a message when crippling
> the box to 128MB of physical memory. I'm going to add
> that back to make sure it's happening *before* this
> init stuff happens.

I didn't have to.


>   Available memory:             2147483648 bytes
>   Good memory required:            9527296 bytes

combined with include/asm-parisc/pdc.h:
	int    imm_max_mem;            /* bytes of mem in IMM */

and it's usage in kernel/setup.c:
	mem_max = (PAGE0->imm_max_mem > MAX_MEM ? MAX_MEM : PAGE0->imm_max_mem);

Negative numbers are smaller than the small positive numbers.
We end up not crippling to 128MB and the mm code doesn't like that.
This cost me two days to figure out since I don't know what I'm
doing here.

grant

ps. Note that Paul Bame also just fixed another nasty (==hard to find)
bug in arch/parisc/lib/milli.S...


Grant Grundler
Unix Development Lab
+1.408.447.7253
