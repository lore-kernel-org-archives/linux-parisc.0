Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA01463
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Sep 1999 10:04:50 -0600
From: Kirk Bresniker <kirkb@chrome.rose.hp.com>
Message-Id: <199909011607.JAA07206@chrome.rose.hp.com>
Subject: Re: [parisc-linux] HP3000 928LX Support?
To: Hugo.van.der.Kooij@caiw.nl (Hugo van der Kooij)
Date: Wed, 01 Sep 1999 9:07:40 PDT
Cc: rmurat@ibm.net, parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.10.9909011730100.20806-100000@bastion.nl3155vj16.vanderkooij.org>; from "Hugo van der Kooij" at Sep 1, 99 5:31 pm
List-ID: <linux-parisc.vger.kernel.org>

| On Wed, 1 Sep 1999, Richard Muratti wrote:
| 
| > I have the opportunity to acquire a HP3000 928LX server
| > and would like to know if it is supported.
| 
| HP3000 systems are not PA-RISC systems. They use the Motorola 68000 CPU
| and you chould check the 68000 oport effort wether or not the unit may run
| linux.
| 
| Hugo.

What?! The HP3000 systems are indeed PA-RISC. In fact, while there 
have been 68k HP-UX workstations the HP3000 have always had an
HP-designed architecture, first the 'classic' HP300 architecture
followed by PA-RISC.

As far as the 928LX, it is a PA-7100LC system, but features
HP-PB based I/O. I do not believe that anyone is working on
on this I/O architecture. 

KMB
--
+============================================================+
|       Kirk Bresniker    	(916) 748-2393		     |
|       8000 Foothills Blvd                                  |
|       Roseville, CA 95747-5649                             |
|       kirkb@rose.hp.com                                    |
