Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id RAA30445
	for <hppa-linux@sod.res.cmu.edu>; Thu, 25 Mar 1999 17:35:20 -0500
Received: from tintin.mcom.com (tintin.mcom.com [205.217.233.42])
	by netscape.com (8.8.5/8.8.5) with ESMTP id OAA03146
	for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 14:34:43 -0800 (PST)
Received: from netscape.com ([205.217.243.139]) by
          tintin.mcom.com (Netscape Messaging Server 4.03) with ESMTP id
          F969E200.SF6 for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar
          1999 14:34:50 -0800
Sender: shaver@netscape.com (Mike Shaver)
Message-ID: <36FABA03.7C223D3A@netscape.com>
Date: Thu, 25 Mar 1999 17:34:43 -0500
From: Mike Shaver <shaver@netscape.com>
MIME-Version: 1.0
To: hppa-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [hppa-linux] libmilli and linker scripts
List-ID: <linux-parisc.vger.kernel.org>

I'm making progress on getting the kernel to compile, and it's now
attempting to link, but I'm confounded by my expected foes:

1) millicode bits:
  net/network.a(socket.o): In function `proto_init':
  socket.o(.text+0x144): undefined reference to `$$dyncall'
and thousands more like it, and $$divI, $$divU and $$remU in the serial
code.  Is there some millicode assembly we could purloin, or should we
write our own somehow?  (Or maybe fix the compiler to do it all inline?)

2) the total absence of a linker script.  Anyone have ideas on:
kernel-in-memory layout, preferably by section?

Mike

-- 
87277.19 78688.20
