Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA13272
	for <parisc-linux@puffin.external.hp.com>; Sun, 9 Apr 2000 21:36:56 -0600
Received: from localhost (sammy@localhost)
	by sammyville.sammy.net (8.8.7/8.8.7) with ESMTP id XAA26440
	for <parisc-linux@thepuffingroup.com>; Sun, 9 Apr 2000 23:42:33 -0400
Date: Sun, 9 Apr 2000 23:42:33 -0400 (EDT)
From: Sam Creasey <sammy@sammy.net>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.21.0004092320450.32368-100000@sammyville.sammy.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] page colouring....
List-ID: <linux-parisc.vger.kernel.org>




Ok, so, the bit about applying a given "colour" to a page due to it's
virtual page has been confusing me for quite some time now...   

However, earlier today, __get_coloured_pages() was misbehaving
(e.g. destroying the zone allocations badly enough that no more
alloc_pages() calls would fly, and death ensued.), so I turned it off.

Simply using alloc_page() and removing all colour checks seems to have
helped matters considerably (speed and stability).


Anyone with better knowledge of why it's here want to enlighten me?


-- Sam


# uname -a
Linux 10.0.0.5 2.3.99-pre1 #41 Sun Apr 9 21:07:39 EDT 2000 parisc unknown
#
