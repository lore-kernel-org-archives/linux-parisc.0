Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA17514
	for <parisc-linux@puffin.external.hp.com>; Wed, 8 Mar 2000 23:43:33 -0700
Received: from cln.etc.bc.ca (zbsgib@24.65.187.169.bc.wave.home.com [24.65.187.169])
	by learn.etc.bc.ca (8.9.3/8.9.3) with ESMTP id VAA24345
	for <parisc-linux@thepuffingroup.com>; Wed, 8 Mar 2000 21:43:29 -0800 (PST)
Sender: sshack@learn.etc.bc.ca
Message-ID: <38C73A40.968A77C1@cln.etc.bc.ca>
Date: Wed, 08 Mar 2000 21:44:32 -0800
From: Steve Shack <sshack@cln.etc.bc.ca>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Neat hardware on 712.
List-ID: <linux-parisc.vger.kernel.org>

Good day puffins,
    Last night  Philipp and myself were playing around with the 712's
discusing how to support the powerswitch gracefully when we realized
that there was a cable going to the front of the case; Upon further
inspection it is a thermal sensor. Some duscussion followed as to how
this might be interfaced to the system. As it turns out it works as the
following. When the circuit is completed and the sensor is too hot
another fan in the back of the 712's power supply turns on. We've yet to
determine if there is anything else going on in the system or if there
is any way this information is reported back to the os/running system at
all but we'll investigate further. Philipp has suspicions about the
large number of wires coming on the power header. That perhaps some of
those wires are used for signaling. Myself I have a feeling that it
might be a combination of that and the two smaller wires coming from the
psu.


That's all for now.
Steve
