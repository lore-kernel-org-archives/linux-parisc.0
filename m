Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA31604
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Jan 2001 16:55:15 -0700
Received: from dot.at (IDENT:plattner@dot-tc01-039.dot.at [212.9.128.79])
	by dns2.dot.at (8.9.3/8.9.2) with ESMTP id BAA28550
	for <parisc-linux@thepuffingroup.com>; Thu, 18 Jan 2001 01:05:33 +0100
Sender: plattner@dns2.dot.at
Message-ID: <3A6631BF.3E95C0C2@dot.at>
Date: Thu, 18 Jan 2001 00:58:55 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] HP E55 server (model 9000/856) // PDC console ?
List-ID: <linux-parisc.vger.kernel.org>

Hello HP hackers !

I have beside the HP apollo 700 series (9000/720) a
server machine, the HP E55 (model 9000/856). As far as I saw
on the hardware page of the puffin group, the SCSI controller
and the multi-port serial is not supported.

Is this really so ? 
Is there a solution for that ?

I also want to cantact HP for documentation.


Is there a possibility to use the PDC console as system console.
Now the kernel says
	Switching from PDC console
and no further output is there, as the PDC console runs on the
port-0 of the serial multi-port board. If I can continue to use
the PDC console, I can perhaps try to boot NFS !

With friendly regards
	Christoph


-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
