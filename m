Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id OAA08927
	for <hppa-linux@sod.res.cmu.edu>; Mon, 22 Mar 1999 14:52:35 -0500
Received: (from jason@localhost)
	by gatekeeper.equator.com (8.9.1a/8.9.1) id LAA23806
	for hppa-linux@thepuffingroup.com; Mon, 22 Mar 1999 11:52:16 -0800 (PST)
Date: Mon, 22 Mar 1999 11:52:16 -0800 (PST)
From: Jason Eckhardt <jason@equator.com>
Message-Id: <199903221952.LAA23806@gatekeeper.equator.com>
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Document Priority?
List-ID: <linux-parisc.vger.kernel.org>


>
> 	Does anyone have particular machines/chips/subassemblies that
> they are desperate for documentation on?  I've been working on "LASI"
> which is the I/O subsystem for the 712 (and pretty much all 7100LC, 
> 7300LC, 7200, 8000, 8200 based computers).  I'm currently digging for
> I/O docs for the earlier machines like the 720/730 adn early 715s.
>

  Not sure about everyone else, but I'd be intersted in these to get C
  class machines up and running. Its likely that these at least overlap
  the other systems:

   1. Onyx ERS (PCXU).
   2. CORE I/O on Raven or similar systems. Not sure if this is the same
      as LASI on 712.
   3. Graphics subsystems. For my machine in particular, builtin 
      Visualize-EG (goat).
   4. Any bug reports that MUST be worked around by the OS. In particular,
      I believe the S-chip had problems that could not be ignored by the OS.


   I'm sure I'll think of more.

> 	What output format should I generate? PostScript? PDF? PCL?
>

  1st PDF or 2nd PS.
  Forget PCL.

  Jason.
