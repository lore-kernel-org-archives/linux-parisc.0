Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA04027
	for <parisc-linux@puffin.external.hp.com>; Wed, 31 May 2000 09:40:46 -0600
Received: from ppp-2-148.cvx3.telinco.net (HELO rhirst.linuxcare.com) (@212.1.145.148)
  by mailserv2.iuinc.com with SMTP; 31 May 2000 15:41:13 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 3FDBCB009; Wed, 31 May 2000 16:41:02 +0100 (BST)
Date: Wed, 31 May 2000 16:41:02 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000531164102.L2253@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] ttyS00 reported twice
List-ID: <linux-parisc.vger.kernel.org>

There was some discussion on irc yesterday about bootup messages reporting
something like:

Found serial #0 at 0xf0823000, IRQ 538
ttyS00 at iomem 0xf0823800 (irq = 538) is a 16550A
Found serial #1 at 0xf0822000, IRQ 537
ttyS00 at iomem 0xf0822800 (irq = 537) is a 16550A

i.e. both ports reported as ttyS00.  This seems to be a consequence of us
calling register_serial() before rs_init() is called.  In addition there
is a chunk of initialisation in rs_init() that is #ifndef CONFIG_GSC;
that would need to be enabled so that rs_table[].line is initialised,
before we would report ttyS01.

The solution might be to make register_serial() aware of whether rs_init()
has yet been called.  If it hasn't, register_serial() just queues the
struct_serial that was passed in and returns success.  At the end of
rs_init() we call register_serial() again for each item in the queue.
This is similar to what happens with the net devices.

Richard
