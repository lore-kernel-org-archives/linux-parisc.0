Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA22585
	for <parisc-linux@puffin.external.hp.com>; Fri, 24 Dec 1999 01:17:44 -0700
Message-Id: <38632C7A.BECFE291@cableinet.co.uk>
Date: Fri, 24 Dec 1999 08:19:06 +0000
From: Tom Gallagher <teg@cableinet.co.uk>
Reply-To: teg@cableinet.co.uk
MIME-Version: 1.0
To: taggart@rascal.fc.hp.com, parisc-linux@thepuffingroup.com
Subject: RE: [parisc-linux] How to set serial console on 712 (fwd) 
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

I seem to have managed to set my console on my 712 to be neither serial
or graphics.  When HPUX boots it seems to detect the console is serial
and I get a login prompt and console messages on my serial terminal, but
it is not really the console as I see no messages from ISL etc on the
serial port.
I think I incorrectly typed the console path when I changed it :( .

The machine boots fine and I can telnet to it etc, but I have no way of
accessing the PDC/ISL.  Before I managed to do this I upgraded it to the
lastest firmware.

Is there some HPUX (10.20) command or trick to alter PDC? ISL?
information to reset my console to a sane state?

I have tried unplugging the keyboard/disks/LAN pretty much everything
really to try to reset it to some factory default.

Thanks.
