Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA11171
	for <parisc-linux@puffin.external.hp.com>; Sat, 20 Jan 2001 06:23:32 -0700
Received: from athena.louisville.edu (athena.louisville.edu [136.165.1.37])
	by erouter1.it-datacntr.louisville.edu (Postfix) with ESMTP id D24BB22E99
	for <parisc-linux@thepuffingroup.com>; Sat, 20 Jan 2001 08:27:19 -0500 (EST)
Date: Sat, 20 Jan 2001 08:26:48 -0500
From: "Phillip D. Beal" <pdbeal@louisville.edu>
To: parisc-linux@thepuffingroup.com
Message-ID: <20010120082648.A18988@athena.louisville.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Question for the Faq
List-ID: <linux-parisc.vger.kernel.org>

Hey,

I thought I'd post this to be added to the faq, as I was stumped on this
problem for a while, and I think some people might hit the same problem.

Q: The system boots up on the sTI Console but no "login:" prompt appears,
what do I do?

A: Uncomment the tty0 in /etc/inittab.

Just a thought....I spent a couple of days trying to figure out why the
console didn't completely work and I found that the tty's were commented
out under /etc/inittab.  


-- 
Phillip Beal                           ___           _               _   
Electrical and Computer Engineering   | _ ) ___ __ _| |___  _ _  ___| |_ 
pdbeal@louisville.edu                 | _ \/ -_) _` | |_ /_| ' \/ -_)  _|
http://www.bealz.net/                 |___/\___\__,_|_/__(_)_||_\___|\__|
