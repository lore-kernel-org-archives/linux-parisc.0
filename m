Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA27507
	for <parisc-linux@puffin.external.hp.com>; Thu, 10 Jun 1999 00:19:46 -0600
From: Kirk Bresniker <kirkb@chrome.rose.hp.com>
Message-Id: <199906100620.XAA03156@chrome.rose.hp.com>
Subject: Re: [parisc-linux] booting problems
To: adevries@thepuffingroup.com
Date: Wed, 09 Jun 1999 23:20:40 PDT
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <375F482D.E1E0B53D@thepuffingroup.com>; from "Alex deVries" at Jun 10, 99 1:07 am
List-ID: <linux-parisc.vger.kernel.org>

Alex --
| is stuck on. According to the inside of the top cover (oh, what a great
| place to put debug info), this means: "System board fault, HPMC or
| Unknown fault".  At this point I'm going for the third.
| 
| Looks like we just need to compare a large chunk of the bootable binary
| to figure out what's happening.
| 

Not so fast, there is probably more data to be had. Discounting the system
board or unknown faults, you code has caused an HPMC, High Priority
Machine Check. This could be several things, but a good guess would be
either execution of an invalid instruction (you jumped into data), or
you attempted to read a address where there is no hardware to respond.

The way to check is to reboot the system through self-test and when you
reach the boot console handler execute a "SER PIM" command.  PIM is an
area of non-volatile memory that is filed in by the routine which
handled the HPMC and is filled with the state of the machine when the
HPMC was encountered.  From this you should be able to obtain the
address of the instruction which was executing when the problem occured,
and should be able to determine what type of problem occured (illegal
instruction, bad memory reference, etc.)  The PIM dumps are timestamped,
so make sure that your system time is up to date and that that the PIM
is from your crash.

Do your systems include remote management cards? The remote management
cards offer the ability to force a PIM dump through a TC (Transfer of
Control) command, or to force a reset. They also will display chassis
codes. Chassis codes, see the PDC_CHASSIS call in your pdc32.pdf
documentation), are displayed on the 25th line of an HPTERM compatible
terminal or web console session. They are communicated to the management
cards over a dedicated hardware interface, and so inserting them into
your code gives a very low level way to display debug data.

KMB


--
+============================================================+
|       Kirk Bresniker    	(916) 785-5677		     |
|       8000 Foothills Blvd                                  |
|       Roseville, CA 95747-5649                             |
|       kirkb@rose.hp.com                                    |
