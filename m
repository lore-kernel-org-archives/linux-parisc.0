Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA30181
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Dec 1999 19:49:52 -0700
Message-ID: <3869778A.8755BE63@storm.ca>
Date: Tue, 28 Dec 1999 21:52:58 -0500
From: Sandy Harris <sandy@storm.ca>
MIME-Version: 1.0
To: "Soto, Gene G." <Gene.Soto@bakeroiltools.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] cd-rom
References: <BBAFD7A26E78D311834400805FEA117701104D39@BHIHAWISS04>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

"Soto, Gene G." wrote:
> 
> I need to load 10.02 and am having problems mounting a NEC cdr-1410a cd-rom
> on my system (9000/712).  Any advice on where to go for help would be
> appreciated.  (SAM sees the device but I can't mount it).

Quite a few workstations seem to be picky about CD-ROM drives,
especially for booting and installing the OS. For Suns, the issue is
sector size. PC CDs want to use 512 and Sun wants 2K or vice versa.
I forget which way around it is. Some drives work on Sun, some need a
jumper change to work, some just don't.

A friend trying to install HP-UX on a 712 recently succeeded with the
fifth drive he tried. All drives worked fine on other systems. After
the install, he tried using a couple of the failed ones on the HP, and
that worked too.

I'd suggest trying a different drive.
