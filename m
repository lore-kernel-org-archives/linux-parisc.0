Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA08203
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Dec 1999 11:03:29 -0700
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 1 Dec 1999 18:05:27 -0000
Subject: Re: [parisc-linux] Progress - Update
To: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de (Philipp Rumpf)
Date: Wed, 1 Dec 1999 18:03:39 +0000 (GMT)
Cc: dave@hiauly1.hia.nrc.ca, mklein@dis.com, alan@lxorguk.ukuu.org.uk,
        Philipp.H.Rumpf@mathe.stud.uni-erlangen.de, sieler@allegro.com,
        parisc-linux@thepuffingroup.com
In-Reply-To: <19991201164141.B4951@mathe.stud.uni-erlangen.de> from "Philipp Rumpf" at Dec 1, 99 04:41:41 pm
Content-Type: text
Message-Id: <E11tE6d-0008Lk-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> 
> Furthermore we have to care for cases like:
> 
> 	var = 1;
> x=0;
> CPU0		CPU1
> xchg(&var,x);	test_and_set_bit(0, &var);

Umm. Does anyone actually rely on that ? Im not sure the non x86 ports have
that property

> IMHO we really should do the 2.3 merge first.

Yep
