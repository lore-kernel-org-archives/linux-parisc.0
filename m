Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA32423
	for <parisc-linux@puffin.external.hp.com>; Thu, 23 Sep 1999 10:58:51 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id NAA10716
	for <parisc-linux@thepuffingroup.com>; Thu, 23 Sep 1999 13:00:32 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id JAA29335 for <parisc-linux@thepuffingroup.com>; Thu, 23 Sep 1999 09:59:43 -0700 (PDT)
Message-Id: <199909231659.JAA29335@milano.cup.hp.com>
To: Parisc Linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Missing directories from CVS 
In-reply-to: Your message of "Thu, 23 Sep 1999 08:30:21 PDT."
             <199909231530.IAA29217@milano.cup.hp.com>
Date: Thu, 23 Sep 1999 09:59:42 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
...
> I did a checkout, make config (for 715), make dep.
> (make vmlinux is still running)

vmlinux built shortly after I posted...


> gcc is used to build scripts/mkdep, scripts/split-include and bin2hex.

Add one more to the list: arch/parisc/boot/mkImage

And on this one "cc" gets picky about pointer math.
Here's my diff for mkImage.c:

118c118
<     *entry_point = *(unsigned long*)(ptr + 6*sizeof(long));
---
>     *entry_point = *(unsigned long*)((char *)ptr + 6*sizeof(long));
131,132c131,132
<     short magic = *(short *)(ptr+sizeof(short));
<     long *arr         = (unsigned long *)ptr;
---
>     short magic = *(short *)((char *)ptr+sizeof(short));
>     long *arr         = (long *)ptr;

Any objections to committing this change?


On second thought, both changes should be written as:

	*entry_point = ((unsigned long *)ptr)[6];
and	
	short magic = ((short *)ptr)[1];


thanks,
grant
