Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA14991
	for <parisc-linux@puffin.external.hp.com>; Thu, 23 Dec 1999 08:42:30 -0700
Received: from postal.sr.hp.com (postal.sr.hp.com [15.4.46.173])
	by atlrel2.hp.com (Postfix) with ESMTP id 0FD30B2F
	for <parisc-linux@thepuffingroup.com>; Thu, 23 Dec 1999 10:45:02 -0500 (EST)
Received: from meow.sr.hp.com (billk@meow.sr.hp.com [15.8.162.83]) by postal.sr.hp.com with ESMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0) id HAA27252 for <parisc-linux@thepuffingroup.com>; Thu, 23 Dec 1999 07:45:34 -0800 (PST)
Received: (from billk@localhost) by meow.sr.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0) id HAA07557 for parisc-linux@thepuffingroup.com; Thu, 23 Dec 1999 07:45:00 -0800 (PST)
Message-Id: <199912231545.HAA07557@meow.sr.hp.com>
Subject: [parisc-linux] How to set serial console on 712 (fwd)
To: parisc-linux@thepuffingroup.com
Date: Thu, 23 Dec 1999 07:45:00 -0800 (PST)
From: Bill Katz "\(William\)" <billk@sr.hp.com>
Reply-To: bkatz@agilent.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

|How do I set the console on my 712 to be the serial port, not the graphics
|display?
|
|Thanks
|

Boot to ISL and use the conspath
command to change the console back to rs232.  The command to use is:

serial
        conspath 2/0/4.643
graphics
        conspath 1/0/0.0
