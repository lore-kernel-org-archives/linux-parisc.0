Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA16356
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Nov 1999 14:24:43 -0700
From: Kirk Bresniker <kirkb@chrome.rose.hp.com>
Message-Id: <199911242127.NAA27314@chrome.rose.hp.com>
Subject: Re: [parisc-linux] Progress - Update
To: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de (Philipp Rumpf)
Date: Wed, 24 Nov 1999 13:27:52 PST
Cc: dave@hiauly1.hia.nrc.ca, sieler@allegro.com,
        parisc-linux@thepuffingroup.com
In-Reply-To: <19991124220528.L1009@mathe.stud.uni-erlangen.de>; from "Philipp Rumpf" at Nov 24, 99 10:05 pm
List-ID: <linux-parisc.vger.kernel.org>

Philipp,

| are you up-to-date with the cvs tree (I have no idea which caches the 735 has,
| but cache flushes won't harm (well, they do harm performance)) ?

The cache flush instructions are architected to cause a processor to memory transfer
iff the cache line is dirty, while an instruction is executed, unless a dirty 
cache line is referenced, memory bandwidth is not consumed.

KMB
--
+============================================================+
|       Kirk Bresniker    	(916) 748-2393		     |
|       8000 Foothills Blvd                                  |
|       Roseville, CA 95747-5649                             |
|       kirkb@rose.hp.com                                    |
