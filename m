Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA22673
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Mar 2000 16:14:43 -0700
Received: from chrome.rose.hp.com (chrome.rose.hp.com [15.8.150.209])
	by palrel3.hp.com (Postfix) with ESMTP id 58495520
	for <parisc-linux@thepuffingroup.com>; Wed,  1 Mar 2000 14:14:23 -0800 (PST)
Received: (from kirkb@localhost) by chrome.rose.hp.com (8.8.6 (PHNE_14041)/8.7.3) id OAA05071 for parisc-linux@thepuffingroup.com; Wed, 1 Mar 2000 14:16:26 -0800 (PST)
From: Kirk Bresniker <kirkb@chrome.rose.hp.com>
Resent-Message-Id: <200003012216.OAA05071@chrome.rose.hp.com>
Message-Id: <200003012216.OAA05071@chrome.rose.hp.com>
Date: Wed, 01 Mar 2000 11:19:05 PST
To: bri@mojo.calyx.net (Brian S. Julin)
Subject: Re: [parisc-linux] make Image currently fails here too.
In-Reply-To: <Pine.BSO.4.21.0003011338010.23746-100000@mojo.calyx.net>; from "Brian S. Julin" at Mar 1, 100 1:39 pm

Brian,

| 
| My unsatisfied symbols are different, though:
| 
| ld: Unsatisfied symbols:
|    fcacheline (code)
|    pcacheline (code)
| 

I ran into this yesterday, and in poking around with Bonsai, I believe
that this is because sammy's net/drivers/lasi_82596.c code includes
calls to these macros to do the cacheline flushes and purges, but prumpf
removed their definitions from include/asm-parisc/cache.h.

KMB
--
+============================================================+
|       Kirk Bresniker    	(916) 748-2393		     |
|       8000 Foothills Blvd                                  |
|       Roseville, CA 95747-5649                             |
|       kirkb@rose.hp.com                                    |
