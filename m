Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA21659
	for <parisc-linux@puffin.external.hp.com>; Tue, 3 Oct 2000 05:17:05 -0600
Received: from user48-134.jakinternet.co.uk (HELO rhirst.linuxcare.com) (@212.41.48.134)
  by mailserv2.iuinc.com with SMTP; 3 Oct 2000 11:17:59 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 9A800B005; Tue,  3 Oct 2000 12:16:05 +0100 (BST)
Date: Tue, 3 Oct 2000 12:16:05 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001003121605.A17291@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] sys_delete_module() entered with ints disabled
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  sys_delete_module() (and presumably other system calls) is entered
with interrupts disabled (sm=0x000a), which causes problems trying to
unload kernel module sym53c8xx.o as it waits for a timer tick.
I had a quick look at syscall.S, but didn't see anything wrong
there.  Anyone know where/why they get disabled?

Richard
