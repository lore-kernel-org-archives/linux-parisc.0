Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tomts7-srv.bellnexxia.net (tomts7.bellnexxia.net [209.226.175.40])
	by dsl2.external.hp.com (Postfix) with ESMTP id BDFDD482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 May 2001 23:29:10 -0600 (MDT)
Received: from unios.dhs.org ([209.226.99.73]) by tomts7-srv.bellnexxia.net
          (InterMail vM.4.01.03.16 201-229-121-116-20010115) with ESMTP
          id <20010530052850.YUGS16174.tomts7-srv.bellnexxia.net@unios.dhs.org>
          for <parisc-linux@lists.parisc-linux.org>;
          Wed, 30 May 2001 01:28:50 -0400
Sender: beholder@dsl2.external.hp.com
Message-ID: <3B148463.3DB0D62@unios.dhs.org>
Date: Wed, 30 May 2001 01:25:56 -0400
From: Pat Wendorf <beholder@unios.dhs.org>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Serial Console Issues
List-ID: <linux-parisc.vger.kernel.org>

I'm new and mostly clueless to PA-RISC, but I recently given a 735/125
and I'm having a heck of a time trying to get the serial console to
work. I tried connecting a 9 pin crossover cable (works fine with a
Sparc 1+ serial console) to COM A at the back of the machine. I set the
term software to 9600-N81 (leaving the frame buffer in).  The term
proggie is pretty much silent except for a funny "u" character that
shows up almost instantly after I power the machine. I searched the
mailing list and found that some people needed to remove the fb from the
machine, this also produces the same result.  I pulled the watch battery
out from the main "blade" at the back for a good 15 minutes to see if
there was some sort of cmos issue, again no luck.  If it helps, the
status lights are solid and show 1, 6 and 7 on (all the rest, minus the
"on" light are off).  The two SCSI connectors on the main "blade" have
terminators plugged into them, but the result seemed the same with them
unplugged, and the machine seems to have two extra connectors in what
looks like another card on the left hand side (so much SCSI, so little
devices ;), which have nothing connected to them, so I must assume are
internally terminated. 

As I said I'm quite unfamiliar with anything HP, so this is an
experience :)

-- 

Pat Wendorf
