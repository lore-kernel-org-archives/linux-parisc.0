Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA10350
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 17:03:32 -0700
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id QAA28324
	for <parisc-linux@thepuffingroup.com>; Tue, 16 Nov 1999 16:05:06 -0800 (PST)
Message-Id: <199911170006.QAA27014@milano.cup.hp.com>
To: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] depi? 
In-reply-to: Your message of "Tue, 16 Nov 1999 17:47:33 PST."
             <19991116174733.C750@mathe.stud.uni-erlangen.de>
Date: Tue, 16 Nov 1999 16:06:41 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> Note that 3.75 GB userspace isn't a problem with either.  My A class looks
> pretty packed with 768 MB RAM so I doubt you could fit more than 1.75 GB in
> many pa1.1 boxes.

a180.pdf says A-class supports 2GB. And that's the "smallest" box HP
ships today and it won't be on the pricelist much longer. 712/100 only
supports 192MB. I don't know about 715's and older B/C-class systems.

I'm pretty sure all new workstations will support more than 4GB
(and run PA2.0). If we can do something now to port linux to those
boxes easier later, then I think we should.

grant

Grant Grundler
Unix Developement Lab
+1.408.447.7253
