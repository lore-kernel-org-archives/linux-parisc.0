Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA14307
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Nov 1999 10:42:57 -0700
Date: Wed, 17 Nov 1999 07:21:41 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] depi?
Message-Id: <19991117072141.H750@mathe.stud.uni-erlangen.de>
References: <19991116174733.C750@mathe.stud.uni-erlangen.de> <199911170006.QAA27014@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911170006.QAA27014@milano.cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> > Note that 3.75 GB userspace isn't a problem with either.  My A class looks
> > pretty packed with 768 MB RAM so I doubt you could fit more than 1.75 GB in
> > many pa1.1 boxes.
> 
> a180.pdf says A-class supports 2GB. And that's the "smallest" box HP

To support 2 GB (instead of 1.75 GB) we indeed need to do some additional
tricks (such as mapping the I/O range somewhere else, ugh).

Any PA1.0 box around on which we waste more than 256 MB ?

	Philipp Rumpf
