Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA09476
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Dec 1999 11:54:23 -0700
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 1 Dec 1999 18:56:21 -0000
Subject: Re: [parisc-linux] Progress - Update
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Wed, 1 Dec 1999 18:54:21 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk, Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        mklein@dis.com, sieler@allegro.com, parisc-linux@thepuffingroup.com
In-Reply-To: <199912011833.NAA17015@hiauly1.hia.nrc.ca> from "John David Anglin" at Dec 1, 99 01:33:09 pm
Content-Type: text
Message-Id: <E11tEtl-0008Q0-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Also, we may need to flush the cache line for &var.  The coding in buffer.c
> which caused the original panic in xchg looks dubiousin this regoard:
> 
>         /* Update the reuse list */
> 		tail->b_next_free = xchg(&reuse_list, NULL);
> 		reuse_list = bh;

spin lock and atomic ops are expected to be write barriers across all
CPUs
