Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA09368
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Dec 1999 11:52:55 -0700
Message-Id: <199912011856.KAA12102@milano.cup.hp.com>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
cc: alan@lxorguk.ukuu.org.uk (Alan Cox),
        Philipp.H.Rumpf@mathe.stud.uni-erlangen.de, mklein@dis.com,
        sieler@allegro.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Progress - Update 
In-reply-to: Your message of "Wed, 01 Dec 1999 13:33:09 PST."
             <199912011833.NAA17015@hiauly1.hia.nrc.ca>
Date: Wed, 01 Dec 1999 10:55:21 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"John David Anglin" wrote:
...
> Also, we may need to flush the cache line for &var.  The coding in buffer.c
> which caused the original panic in xchg looks dubiousin this regoard:
> 
>         /* Update the reuse list */
> 		tail->b_next_free = xchg(&reuse_list, NULL);
> 		reuse_list = bh;

If this data struct is only touched by processors, they are coherent
and flushing is not needed. (Except VM aliases...but I have to ignore
this case due to my ignorance).  If any driver DMAs this data and the
platform is I/O coherent (ie has ccio, epic or sba driver), processor
doesn't need to flush either. Processor should only need to flush on
*any* (SMP or not) platform which is not I/O coherent (assume the page
is mapped cacheable).

grant

Grant Grundler
Unix Developement Lab
+1.408.447.7253
