Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA16728
	for <parisc-linux@puffin.external.hp.com>; Sat, 13 Jan 2001 00:30:33 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 13 Jan 2001 07:34:10 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14HLCS-0005JZ-00
	for parisc-linux@thepuffingroup.com; Sat, 13 Jan 2001 07:34:08 +0000
Date: Sat, 13 Jan 2001 07:34:08 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20010113073408.B16185@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] Oopser
List-ID: <linux-parisc.vger.kernel.org>


I'm interested in having a useful debugging tool written by someone who
knows the processor really well.  What I basically want to be able to
do is call oopser(10 * HZ) and have the machine reliably crash in 10
seconds time (and do a register dump).  that would at least tell me
where the kernel's got to.

it'd be most useful if it worked with interrupts disabled, but even
something which required interrupts to be enabled would be of some use.

-- 
Revolutions do not require corporate support.
