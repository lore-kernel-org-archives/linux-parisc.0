Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id QAA12018
	for <hppa-linux@sod.res.cmu.edu>; Mon, 22 Mar 1999 16:47:57 -0500
Date: Mon, 22 Mar 1999 13:46:23 -0800 (PST)
From: Jason Eckhardt <jason@equator.com>
Message-Id: <199903222146.NAA26888@gatekeeper.equator.com>
To: billk@sr.hp.com, jason@equator.com
Subject: Re: [hppa-linux] Document Priority? (fwd)
Cc: hppa-linux@thepuffingroup.com
List-ID: <linux-parisc.vger.kernel.org>


>
> |   4. Any bug reports that MUST be worked around by the OS. In particular,
> |      I believe the S-chip had problems that could not be ignored by the OS.
>
> I'm working on PCXL and other CPU docs.  I'll try to find someone that
> remebers the PCXS chip.
>

   I personally don't care much about S, but apparently the 720 and perhaps one
   or two other models used it. I know some of the people who tested the
   bootstrap code were running on 720's. We do want to cover a large portion
   of the spectrum of 700's and 800's....

>
> I'll try.  Assuming I can make PS from TROFF and TeX.
>

  For TeX it's trivial, there is at least one well known .dvi to .ps
  converter. Use your favorite search engine to find "dvips". Then perform
  "dvips -f < xyzzy.dvi > xyzzy.ps".

  As for TROFF, I believe GROFF can emit PostScript.

  Jason.
