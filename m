Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA11722
	for <parisc-linux@puffin.external.hp.com>; Sun, 14 Nov 1999 20:28:39 -0700
Received: from vodka.thepuffingroup.com (IDENT:adevries@vodka.thepuffingroup.com [192.168.1.2])
	by vodka.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id XAA07582
	for <parisc-linux@thepuffingroup.com>; Sun, 14 Nov 1999 23:41:07 -0500
Date: Sun, 14 Nov 1999 23:41:07 -0500 (EST)
From: Alex deVries <adevries@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.10.9911142338080.7516-100000@vodka.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] real mode stuff.
List-ID: <linux-parisc.vger.kernel.org>


So, realmode_setup.c is a good start, but it needs a bit of a cleanup.  

Stuff I'm working on:

- Philipp and I agree that we should just create arch/parisc/kernel/real
for all the real mode stuff
- creating arch/parisc/real/pdc.c
- moving some stuff in arch/parisc/kernel/realmode_setup.c to
arch/parisc/real/setup.c or similiar.

Let me know if there's objections.  I'll wait until Paul has a chance to
read this before committing.

- Alex

-- 
Alex deVries <adevries@thepuffingroup.com>
Vice President Engineering
The Puffin Group
