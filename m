Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA15026
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Apr 2000 19:41:24 -0600
Received: from l3107mxr.atl.hp.com (l3107mxr.atl.hp.com [15.19.254.19])
	by atlrel1.hp.com (Postfix) with ESMTP id 62112E5BE
	for <parisc-linux@thepuffingroup.com>; Fri, 14 Apr 2000 21:41:23 -0400 (EDT)
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by l3107mxr.atl.hp.com (Postfix) with ESMTP id 981B64FFD3
	for <parisc-linux@thepuffingroup.com>; Fri, 14 Apr 2000 20:23:48 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id SAA20656 for <parisc-linux@thepuffingroup.com>; Fri, 14 Apr 2000 18:23:55 -0700 (PDT)
Message-Id: <200004150123.SAA20656@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] msdos_partion+120 == code 28 
In-reply-to: Your message of "Fri, 14 Apr 2000 18:16:23 PDT."
             <20000414181623.A14133@puffin.external.hp.com>
Date: Fri, 14 Apr 2000 18:23:54 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> > code 28 == "Unaligned Data Reference Trap".
> > (Gee, where have I seen this before? :^(  )
> > 
> > IAOQ  == 0xc016939c msdos_partition+120
> > 
> 
> Can you resolve that into a line of the C code ?  It looks to me like
> the msdos partition code has been fixed to use get_unaligned and le*_to_cpu
> so I believe this should be a genuine bug.


0000058c <msdos_partition>:
...
 6ac:   0c 78 10 96     ldw c(sr0,r3),r22

GR 3 : c7f629be

I started looking at the code and I wasn't able to finish tracking
this down to day. Any other takers?

If I had to guess, I'd say check dereferences of nr_sects in struct
partition. But that's not obvious in msdos_partition...

thanks,
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
