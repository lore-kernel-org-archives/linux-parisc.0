Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA08751
	for <parisc-linux@puffin.external.hp.com>; Wed, 18 Oct 2000 01:02:07 -0600
Received: from videotron.ca ([207.253.109.87]) by
          VL-MS-MR003.sc1.videotron.ca (Netscape Messaging Server 4.15)
          with ESMTP id G2M69Q02.4R8 for
          <parisc-linux@thepuffingroup.com>; Wed, 18 Oct 2000 03:03:26 -0400
Sender: fleet@mailserv2.iuinc.com
Message-ID: <39ED4B3B.85348ED2@videotron.ca>
Date: Wed, 18 Oct 2000 03:03:23 -0400
From: James Waterhouse <james.waterhouse@videotron.ca>
MIME-Version: 1.0
To: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] booting on 712/60
List-ID: <linux-parisc.vger.kernel.org>

Hello,
	I just compiled a ramdisk using mondays cvs src for everything. I'm
using the graphics console ramdisk file off the puffin.external.hp.com
(ramdisk20000530-sticon.tgz) to make the ramdisk. Now when I got to boot
it boots up until the point where the kernel says...

Sending BOOTP request.... OK
IP-Config: Got BOOTP answer.. bla bla
Switching from PDC console

And then I get nothing. So what is happening when we switch from the PDC
console? Is the output going to the serial port, or am I crashing
because my graphics hardware is not supported, or am I crashing for some
other reason?

Thanks,
James


-- 
Can you discern the signs of the times? || www.danielrevelation.com
Do you see the storm fast approaching?  || www.sundaylaw.com
Is your future built on "The Rock"?     ||
www.bibleinfo.com/sc/toc_sc.html
