Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA29537
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 May 2000 13:35:05 -0600
From: Helge Deller <deller@gmx.de>
To: parisc-linux@thepuffingroup.com
Date: Thu, 25 May 2000 21:28:18 +0200
Content-Type: text/plain
References: <200005251826.MAA28859@puffin.external.hp.com>
In-Reply-To: <200005251826.MAA28859@puffin.external.hp.com>
MIME-Version: 1.0
Message-Id: <00052521281800.04293@P100>
Subject: [parisc-linux] Parallel driver for lasi/asp
List-ID: <linux-parisc.vger.kernel.org>

Hello Puffins & Linuxcare's,

after nearly half a year absence - in which I finished university yesterday - 
from the parisc-porting effort and silently lurking and following the list 
I'm now able to do some programming again.

I just committed a parallel-port-driver for lasi and asp-machines which I 
hacked up yesterday. This driver is mainly based on the parport_pc.c-driver 
and I don't have any clue, if it really works ! 

As Murphy's law says, my printer broke just in the moment I wanted to print 
my thesis last week, and so I now had to test the driver with an old 9-dot 
matrix-printer. The problem is, that all characters printed with this driver 
shows up in greek-letters, so I verified the output with the printer 
connected to my Intel-machine and I got the same result !
So I think the driver **may** work, but I can't test it !
Because of that it would be great to get any success or failure reports.....

Helge.


-- Private Note: (I hope this will be allowed here once on this list) --
Since I just finished university, I'm now searching for a good Unix / Linux / 
(parisc)-job near Duesseldorf / Germany.....
If someone is interested, please mail me privately at <deller@gmx.de>.
-----------------------------------------------------
