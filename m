Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA18398
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Nov 1999 16:20:41 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.16.124.11])
	by palrel1.hp.com (Postfix) with ESMTP id 2729616B8
	for <parisc-linux@thepuffingroup.com>; Wed, 24 Nov 1999 15:22:28 -0800 (PST)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id PAA06000 for <parisc-linux@thepuffingroup.com>; Wed, 24 Nov 1999 15:24:33 -0800 (PST)
Message-Id: <199911242324.PAA06000@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: Cache Flushes
In-reply-to: Your message of "Wed, 24 Nov 1999 14:38:49 PST."
             <383C68F9.C8C6792A@hp.com>
Date: Wed, 24 Nov 1999 15:24:32 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Frank Rowand wrote:
> Philipp Rumpf wrote:
...
> > As soon as we've implemented page colouring (which turns out to be really v
>   ery
> > close to large page support), I expect us to get along with very very few
> > cache flushes - basically I hope we can avoid them completely.
> > 
> >         Philipp Rumpf
> 
> No such luck.  You'll need cache flushing in drivers for non-coherent IO.

Frank is (as usual) right. Rule of thumb is if the box doesn't have an
I/O MMU (aka ccio or sba) or not using it, then it's not I/O coherent.
Every DMA transaction will require flushes/purges before or after
(inbound vs. outbound) of payload and device control data on such boxes.

My understanding is only PA2.0 supports speculative prefetching.
AFIAK that's ok since all PA2.0 boxes have an I/O MMU and the prefetched
data will be recalled/dropped during the course of the DMA.

Conclusion: In the "performance code path", PA1.1 will generally (some
PA1.1 are also I/O coherent) need flushes/purges and PA2.0 won't.
However, I wouldn't code this based on PA2.0 vs PA1.1 since the presence
of U2/Uturn/sba are what matter. And we will probably want to ignore
those chips for PA2.0 bringup (ie bringup will be not be I/O coherent).

grant

Grant Grundler
Unix Developement Lab
+1.408.447.7253
