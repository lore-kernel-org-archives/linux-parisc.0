Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA28121
	for <parisc-linux@puffin.external.hp.com>; Wed, 19 Apr 2000 13:22:34 -0600
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by atlrel2.hp.com (Postfix) with ESMTP id 19F13571
	for <parisc-linux@thepuffingroup.com>; Wed, 19 Apr 2000 15:22:33 -0400 (EDT)
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] code 28 in msdos_partition() 
In-reply-to: Your message of "Tue, 18 Apr 2000 13:19:29 PDT."
             <200004182019.NAA24003@milano.cup.hp.com>
Date: Wed, 19 Apr 2000 13:22:32 -0600
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12i03U-000281-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= 
= I figured out line 434 (of 497) fs/partitions/msdos.c
= ("if (!NR_SECTS(p))") is causing the code 28 trap (unaligned data
= reference trap) despite the use of get_unaligned() macro. Seems
= get_unaligned() just isn't supported. I tried tracking this down in
= order to fix it but got distracted by another problem.
= If someone feels like they want to contribute in
= a small way, fixing get/put unaligned would be helpful.

I'm interested in looking at this problem and seeing disks work in
general.  But I can't help since I don't have a box which seems to be
able to find SCSI drives (tried 712, b180, c360, and c3k).  Can you
give me a clue how to reproduce what you're seeing?

With my limited experience with Linux disks and software, the
partition table access is usually aligned right anyway, so I think
alignment traps here should be rare.

= The problem which distracted me was the use of generic
= swap macros by get_unaligned. parisc-linux defines architecture
= specific macros and I couldn't figure out why those
= were NOT being used. Any takers for this too?

Are you asking about le32_to_cpu() versus __le32_to_cpu()?  (Not that
I have an answer -- I'm just wondering if that's the question)

	-Paul Bame
