Received: from rhirst.linuxcare.com (sleepie.demon.co.uk [194.222.23.208])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id DAA02469
	for <parisc-linux@puffin.external.hp.com>; Mon, 13 Nov 2000 03:24:29 -0700
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 2248CB007; Mon, 13 Nov 2000 10:24:03 +0000 (GMT)
Date: Mon, 13 Nov 2000 10:24:03 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@puffin.external.hp.com
Message-ID: <20001113102403.P32715@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] BEWARE: Makefile changed from parisc to parisc64
List-ID: <linux-parisc.vger.kernel.org>

Confused me for a while, anyway.  If you cvs update your kernel
source and expect to build a 32 bit kernel, you need to edit the
top level Makefile to change the arch := line.

Richard
