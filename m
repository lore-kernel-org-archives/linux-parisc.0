Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA14074
	for <parisc-linux@puffin.external.hp.com>; Tue, 18 Jul 2000 18:07:53 -0600
Date: Tue, 18 Jul 2000 17:09:31 -0700 (PDT)
From: Jason Eckhardt <jle@cygnus.com>
To: Matthew Wilcox <matthew@wil.cx>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] scheduling
In-Reply-To: <Pine.SOL.3.91.1000718165232.7727A@cse.cygnus.com>
Message-ID: <Pine.SOL.3.91.1000718170539.7727B-100000@cse.cygnus.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>




On Tue, 18 Jul 2000, Jason Eckhardt wrote:

>   While it would be cool to have a kernel specifically scheduled for
>   each processor, its likely that one will just have to be chosen for 
>   a 32-bit kernel.
>   The PA8x000 are probably the least susceptible to other schedules
>   because of its ROB. Scheduling for 7100 or 7200 might be a good choice
>   (or whatever machine seems to be the most popular).
> 

  Its probably worth mentioning also that most of the other processor
  models are dual-issue with very similar bundling rules. The 7100, 
  for example can issue 3 combinations: int-fp, fp-int, fp-branch. The
  7200 is similar, but also adds an int-int (with some restrictions)
  bundle type. So whichever of the 7xxx schedules we choose likely 
  won't cause death on other 7x000 processors. Still, the most common
  processor might be the best choice.
