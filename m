Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA04340
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 09:49:10 -0700
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 16 Nov 1999 16:50:45 -0000
Subject: Re: [parisc-linux] depi?
To: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de (Philipp Rumpf)
Date: Tue, 16 Nov 1999 17:50:53 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk, Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        frowand@cup.hp.com, parisc-linux@thepuffingroup.com,
        adevries@thepuffingroup.com
In-Reply-To: <19991116174733.C750@mathe.stud.uni-erlangen.de> from "Philipp Rumpf" at Nov 16, 99 05:47:33 pm
Content-Type: text
Message-Id: <E11nmkn-0002xG-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Consistent with what the widely-used ports do in 2.2 (as far as I can see).

You mean x86

> It sure can help from a performance pov.
> 
> > Ultrasparc makes good use of tlb bypass bits for this.
> 
> We do have load/store word bypassing the TLB instructions, if that's what you
> mean.  We also can fix one of SR1-SR3 in kernel mode to be the identical map
> if some phys->virt instructions shows up heavily in profiles.

On the ultrasparc it pays off in part by avoiding TLB miss/reloads

> The day the parisc port reaches the usage counts we can stop caring about
> getting Oops/Panic messages (especially if they were unexpected and happened
> on a system that seemed stable a long time before) I might agree to the "only".

And until then you map in 20 odd pages. BFD

> Note that 3.75 GB userspace isn't a problem with either.  My A class looks
> pretty packed with 768 MB RAM so I doubt you could fit more than 1.75 GB in
> many pa1.1 boxes.

3.75Gig _virtual_ 

3.75Gig _virtual_ 

3.75Gig _virtual_ 
