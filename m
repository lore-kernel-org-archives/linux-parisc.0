Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA18441
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Nov 1999 15:41:22 -0700
Message-Id: <199911172239.RAA02116@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] depi?
To: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de (Philipp Rumpf)
Date: Wed, 17 Nov 1999 17:39:15 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: frowand@cup.hp.com, Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        parisc-linux@thepuffingroup.com
In-Reply-To: <19991117230531.D10209@mathe.stud.uni-erlangen.de> from "Philipp Rumpf" at Nov 17, 99 11:05:31 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

I have been trying to figure outout why the kernel that I built with the
default configuration dies after going virtual.

It seems to me that some aspects of PA compilers and linkers haven't
been taken into account.  One particular thing to note is that long
branches are done via stubs which use interspace branches (i.e., they
use the space registers).  There is a builtin assumption that the four
quadrant model is being used.  Since we are linking to 0xc0000000, sr7
is being used for long branches.

Here is an example called from sys_pipe:

0xc0015538 <pdc_console_init+88>:       ldil -3ff72800,r1
0xc001553c <pdc_console_init+92>:       be,n 3c0(sr7,r1)

I can't find where sr7 is initialized.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
