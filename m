Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA13401
	for <parisc-linux@puffin.external.hp.com>; Sun, 14 Nov 1999 23:56:22 -0700
Received: from vodka.thepuffingroup.com (IDENT:adevries@vodka.thepuffingroup.com [192.168.1.2])
	by vodka.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id DAA08043
	for <parisc-linux@thepuffingroup.com>; Mon, 15 Nov 1999 03:08:49 -0500
Date: Mon, 15 Nov 1999 03:08:49 -0500 (EST)
From: Alex deVries <adevries@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.10.9911150307300.7996-100000@vodka.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] depi?
List-ID: <linux-parisc.vger.kernel.org>


What does this actually do:

        ; Get ready for phys->virt transition
        ; First order of business is to adjust some pointers
        depi            3,1,2,%arg0     ; phys->virt(free mem ptr)
        depi            3,1,2, %sp      ; phys->virt SP
        depi            3,1,2, %dp      ; p2v DP

in head.S?

I don't have a 'depi' in the index of my PA 2.0 assembler book.  I have a
depwi and a depdi though.

- Alex "I shot the sheriff, but I did not shoot the depdi" deVries

-- 
Alex deVries <adevries@thepuffingroup.com>
Vice President Engineering
The Puffin Group
