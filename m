Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA14257
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Nov 1999 01:13:35 -0700
Date: Mon, 15 Nov 1999 09:03:12 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
        Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715 useful
Message-Id: <19991115090312.E30917@mathe.stud.uni-erlangen.de>
References: <199911131834.NAA00219@hiauly1.hia.nrc.ca> <199911150357.TAA24057@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911150357.TAA24057@milano.cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> o Alex misunderstood - the HP-UX c720 driver *can* bypass all line
>   based interrupt support (ASP/LASI/Dino/...). It only does it for
>   a card which already uses transaction based interupts (TBIs)
>   (HSC F/W SCSI). TBIs are required to work on HSC bus to meet
>   PA I/O Arch and the c720 driver was coded with this safe assumption.
>   TBIs sadly do NOT work under PCI on all platforms.

In fact, to the best of my knowledge, software-visible TBIs are unique to
PA-RISC among all common architectures.  Am I wrong ?

> o and lastly, I too am skeptical (like Philipp) how useful this
>   optimization is. I can help measure it once the box is running.
>   I have my own set of optimizations I *think* we need. Philipp
>   agreed we would put them in once I had measurements showing
>   the improvement.

measurements showing the improvement to be significant enough to put what
otherwise has all the features of a nasty hack in the API.  What am I afraid
is going to happen is:

1. we find out there is an interesting, though not essential, performance win
2. we implement the necessary API
3. the API gets used in exactly one driver
4. the only two developers running machines making use of the driver disappear
   for a week
5. we break the driver
6. we have a long discussion, and fix the API
goto step 4.

So the possibility of just removing the interface support for using TBIs on
busses for which TBI is not the classical interrupt mechanism doesn't sound
all that bad compared to leaving it in, and if someone is really convinced
TBIs over PCI are worth implementing, I'd suggest to do some benchmarks as
soon as possible (i.e. _now_ for PA1.1 boxes).


	Philipp Rumpf
