Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA16369
	for <parisc-linux@puffin.external.hp.com>; Wed, 26 Jul 2000 08:06:07 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 26 Jul 2000 14:08:01 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13HRqm-00010p-00
	for <parisc-linux@thepuffingroup.com>; Wed, 26 Jul 2000 10:07:56 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 26 Jul 2000 10:07:56 -0400
Message-ID: <87puo1ougz.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] signal handling
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I was quite shocked to discover that we appear to have no signal
handling code in the Linux/parisc kernel whatsoever.

Is anyone planning to do this anytime soon?  It's unbelievably
annoying to debug userspace when you have to push TOC every single
time your program segfaults.

Never mind the fact that we can't really claim to have a working
kernel if it lacks basic things like signals.

I am formally threatening to do it wrong (since I don't know what I am
doing) if nobody steps forward to do it correctly within the next
hour.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
