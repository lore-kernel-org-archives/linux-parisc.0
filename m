Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA13547
	for <parisc-linux@puffin.external.hp.com>; Tue, 18 Jul 2000 17:59:21 -0600
Date: Tue, 18 Jul 2000 17:01:02 -0700 (PDT)
From: Jason Eckhardt <jle@cygnus.com>
To: Matthew Wilcox <matthew@wil.cx>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] scheduling
In-Reply-To: <20000718180920.Q3150@vodka.thepuffingroup.com>
Message-ID: <Pine.SOL.3.91.1000718165232.7727A@cse.cygnus.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>




On Tue, 18 Jul 2000, Matthew Wilcox wrote:

> 
> i can't seem to find any documentation on the HP website about scheduling
> instructions for different processor models.

  There are at least two processor model docs
  on the puffin site (PCXL and PCXL2, i.e. the 7100LC and 7300 I believe).
  These ERSs discuss pipelines, latencies, bundling rules, etc -- scheduling
  rules.

>  gcc currently defaults to
> scheduling for the PA700 (presumably this is PCX?), and can be asked
> to schedule for PA-7100, PA-7200 or PA-8000.

  PCXT = 7100
  PCXT' = 7200
  PCXU = 8000

> i'm guessing that 8200,
> 8500 and 8600 have slightly different scheduling requirements.
> 
  
  The 8200, 8500, and 8600 have the same basic core as the PA8000. Scheduling
  for the 8000 should be fine for 8x00.

> my main question is, what should we default it to?  does scheduling for
> PA-8000 have a really bad effect on other CPU models?  or vice versa,
> is scheduling for PA-700 a really bad choice for PA-8x00 CPUs?
>  i know
> later PA models have all the fancy register renaming stuff in them so
> it may not make much difference, but i'm curious.
> 

  While it would be cool to have a kernel specifically scheduled for
  each processor, its likely that one will just have to be chosen for 
  a 32-bit kernel.
  The PA8x000 are probably the least susceptible to other schedules
  because of its ROB. Scheduling for 7100 or 7200 might be a good choice
  (or whatever machine seems to be the most popular).

  Obviously, a 64-bit kernel (when it exists) would best be
  scheduled as PA8000.

  
