Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA24578
	for <parisc-linux@puffin.external.hp.com>; Wed, 5 Jan 2000 15:51:12 -0700
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id RAA07464
	for parisc-linux@thepuffingroup.com; Wed, 5 Jan 2000 17:54:03 -0500
Date: Wed, 5 Jan 2000 17:54:02 -0500
From: Matthew Wilcox <willy@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000105175402.I5882@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] A short note on includes
List-ID: <linux-parisc.vger.kernel.org>


Something I've noticed while going through the 2.2 code and modifying
it for 2.3 is that people quite often use

#include <asm/spinlock.h>

instead of

#include <linux/spinlock.h>

It is almost always preferred to use linux/foo instead of asm/foo if
linux/foo exists.  The linux/foo file will perform the <asm/foo> include
to get the arch-specific pieces as necessary.  There's no need to panic
and submit dozens of patches right now (particularly since we're about
to make the 2.3 tree available for public submissions), but I thought
this was a useful thing for people to know for the future.
