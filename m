Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA18557
	for <parisc-linux@puffin.external.hp.com>; Wed, 16 Feb 2000 03:31:08 -0700
Received: from chrome.rose.hp.com (chrome.rose.hp.com [15.8.150.209])
	by atlrel2.hp.com (Postfix) with ESMTP id A6143CBA
	for <parisc-linux@thepuffingroup.com>; Wed, 16 Feb 2000 04:31:42 -0500 (EST)
From: Kirk Bresniker <kirkb@chrome.rose.hp.com>
Message-Id: <200002160933.BAA19152@chrome.rose.hp.com>
Subject: Re: [parisc-linux] Linux syscall ABI 
To: grundler@cup.hp.com (Grant Grundler)
Date: Wed, 16 Feb 2000 1:33:37 PST
Cc: prumpf@inwestnet.de, parisc-linux@thepuffingroup.com
In-Reply-To: <200002160234.SAA06672@milano.cup.hp.com>; from "Grant Grundler" at Feb 15, 100 6:34 pm
List-ID: <linux-parisc.vger.kernel.org>

Grant wrote:

| 
| Given the complexity of the systems, knowing *some* (not all)
| of the HW state is marginally useful at best. When we get
| into debugging driver problems later on, this will be clearer.
| 
| Besides the asynchronous nature of HPMCs, PIMs are unique to each
| class of box. So decoding a PIM on a K-class is quite different
| from the PIM on N or L-class. Only recently have tools been made
| internally available to help decode each type of PIM. I wouldn't
| hold my breath waiting for those to get published.

There are two key take aways from what Grant has said: 

1. There are some platform specific tools which help PIM analysis.  As
   someone who has read literally thousands of PIM dumps over 10 years
   worth of server platforms, and as someone who has contributed some of
   the analysis tools, I would say that the tools only automate the
   decoding of status register values (which are all implementation
   specific). There has never been an expert tool which pulls in a 
   PIM dump and spits out the answer. 

2. The platforms which Grant specified are server platforms, not the
   workstations.  In my experience, you're going to find many more
   people familiar with server PIM dump output than workstations, simply
   because of the threshold of pain of the customer base. A server
   customer is much more concerned with getting a fully analysis of
   each and every failure than a workstation customer.

In general, for real hardware faults, PIM dumps are usually as good 
as the underlying hardware error logging registers in telling an
expert what has gone wrong. But, in this case, when there is an OS or
OS/hardware interaction, the PIM is usually not enough. 

| 
| If linux could learn to dump host memory to disk, then HPMC's would
| a bit easier to debug since one could review data structures for suspect
| code. I think that's what the HPMC handler is intended for - not
| attempt to recover. Attempting to recover from an asyncronous fault
| doesn't sound feasible to me. But what do I know anyway....
| 

I don't know what Grant does (n't) know :), but I second the call for a
core dump.  To give an example of a complex hardware/OS interaction, I
was once debugging a system which was regularly getting OS panics due to
data page faults.  As a hardware engineer I would, as a matter of
principle, blaim software and then firmware.  But, the problem was
actually a double bit error due to a bad SRAM in the instruction cache
which was corrupting an instruction.  I only found this out by comparing
instructions and data in the memory dumps with the data stored in
PIM dumps.

As to recovery from HMPCs, I can only speak to the hardware generated
exceptions.  Most of the hardware generated HPMCs are linked to 
events which calls into question the validity of information. Get a
parity error on a private, dirty cache line? Well that means that there
is no valid copy anywhere. Better to dump PIM and halt immediately
rather than possibly commit bad data to permanent storage.  I think
that you have to be pretty confident to continue with other than
a core dump or tombstone page.

KMB
--
+============================================================+
|       Kirk Bresniker    	(916) 748-2393		     |
|       8000 Foothills Blvd                                  |
|       Roseville, CA 95747-5649                             |
|       kirkb@rose.hp.com                                    |
