Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA00861
	for <parisc-linux@puffin.external.hp.com>; Thu, 27 Jan 2000 05:23:33 -0700
Message-ID: <20000127112427.11602.qmail@web507.mail.yahoo.com>
Date: Thu, 27 Jan 2000 03:24:27 -0800 (PST)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
To: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 715/33 and HIL driver
List-ID: <linux-parisc.vger.kernel.org>

I have seen the shellprompt on my 715/33 using the CVS
version 20000125 and defconfig (and removing the debug
printk's from sched.c + system.h). But activating
CONFIG_HIL leads to the following boot messages:

pagetable_init
kernel BUG at bootmem.c:163!
kernel BUG at bootmem.c:203!

I have read a previous message concerning problems
with the HIL driver. So my question : is the driver
still not ready for Linux 2.3 and is someone working
on that ?

Ulrich
__________________________________________________
Do You Yahoo!?
Talk to your friends online with Yahoo! Messenger.
http://im.yahoo.com
