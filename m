Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA07628
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 14:49:52 -0600
From: Stan Sieler <sieler@allegro.com>
Message-Id: <199906212049.NAA32096@bart.allegro.com>
Subject: Re: [parisc-linux] HPUX binary compatibility
To: mike@fast.cs.utah.edu (Mike Hibler)
Date: Mon, 21 Jun 1999 13:49:43 -0700 (PDT)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <199906211820.MAA06267@fast.cs.utah.edu> from "Mike Hibler" at Jun 21, 99 12:20:14 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Re:

> Yow, that is an ambitious goal!  I can see the desirability of doing it
 
Yes...I've been trying to get MPE/iX to support HP-UX binaries via this
method for a number of years, but HP hasn't shown much interest.

The reason I like it is that it removes the slightly obscene distinction
of a "linux process" vs. "HP-UX process".

(MPE/iX, which also runs on PA-RISC, and which has an internal emulator
for the Classic (CISC) HP 3000 instruction set, was originally going to
have a similar distinction: Native Mode process vs. Compatibility Mode process ...
but people pointed out, quite correctly, that a process might want
to switch from NM to CM to NM ... so a process is just a process ... the
NM/CM mode is no longer a type of process.)

What does the MPE example have to do with Linux?  Everything...what happens
when your "linux process" wants to dynamically load code from an HP-UX
library?  Or vice versa?  What about shared libraries?

Take it from someone who's been there: having a "process type" isn't
a 100% solution.  Having non-overlapping system call mechanism (either
different numbers or a different address) provides a much closer to
100% solution.  You may still need to translate things to provide
data back to an HP-UX system call (e.g., process structure for pstat?),
but that's *doable* ... and the translator method won't get that far!

-- 
Stan Sieler                                          sieler@allegro.com
                                         http://www.allegro.com/sieler/
