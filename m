Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.powertech.no (smtp1.powertech.no [195.159.0.145])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0FB7F482A
	for <parisc-linux@parisc-linux.org>; Wed, 19 Dec 2001 13:27:35 -0700 (MST)
Message-ID: <001b01c188cb$cb1eda60$0201a8c0@andy>
From: "Andy Walker" <squawker@start.no>
To: "Grant Grundler" <grundler@dsl2.external.hp.com>
Cc: "Richard Hirst" <rhirst@linuxcare.com>,
	<parisc-linux@parisc-linux.org>
References: <1008589643.3c1ddb4b75583@nyepost.start.no> <1008594958.3c1df00ed9750@nyepost.start.no> <20011219113621.X1897@linuxcare.com>  <1008771313.3c20a0f14484a@nyepost.start.no>  <20011219165635.3E405482A@dsl2.external.hp.com>
Subject: Re: [parisc-linux] Status report - B132L and 725/100 
Date: Wed, 19 Dec 2001 21:28:58 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

From: "Grant Grundler" <grundler@dsl2.external.hp.com>

> Andy Walker wrote:
> > To triple check the termination, I installed the terminator packs on
> > the card and moved the cable from the internal connector to the
> > external one. No difference there, even with your kernel parameter
> > suggestion.
>
> Couple more things:
> o make sure your disks are *not* terminated - just both ends of the bus.

Already checked. The internal cable has a terminator built into the end. The
disks are definitely not terminated.
In the original configuration the internal was attached to the internal
connector. There wer no terminator packs on the card itself, and there was
a terminator attached to the external connector.
In the second configuration, I hung the internal cable on the external
connector, and installed the terminator packs on the card. Same results.

> o double check all connectors to make sure there are no bent pins.
> o replace any cables you can - especially external ones.

I'll double check all this tomorrow, but the fact that I can boot HP-UX
off of these disks suggests that the hardware is intact. At the moment
I'm only using a single internal cable - I'll swap it and see what
happens.

> o verify the disks are the correct type. For c720, I expect
>   *differential* SCSI.  Single Ended disks were used with LASI based
>   machines (53c710) and built-in fast/wide on a few of the BXXX/CXXX
>   workstations.

Well, one of the disks in question is the original HP-UX boot disk for
this machine, and its a Seagate WD prefix disk. The other disk I tried
is also a WD disk, taken from a C110. The Bluefish is reported as diff
by the 53c8xx driver, it says differential on the external connector -
there can't be any doubt, can there? This should all work together.

Obviously, my initial thoughts went to the know problems with the c720
on 735's. The problem does seem very similar - I understood that the
735 problem was caused by some weirdo HP glue logic chip. Could this
not be a similar case?

Anyway, I'll take an known good disk with me tomorrow and try that with
a different internal cable. I'll also double check that everything is
still working with HP-UX. More news as it breaks.........

-Andy
