Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA01504
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 12:22:28 -0700
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by atlrel1.hp.com (Postfix) with ESMTP id 810245C7
	for <parisc-linux@thepuffingroup.com>; Tue,  2 Jan 2001 14:25:47 -0500 (EST)
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.1/8.9.3 SMKit7.01) with ESMTP id MAA21706
	for <parisc-linux@thepuffingroup.com>; Tue, 2 Jan 2001 12:25:46 -0700 (MST)
Received: from localhost
	([127.0.0.1] helo=fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.12 #1 (Debian))
	id 14DX46-0005uT-00
	for <parisc-linux@thepuffingroup.com>; Tue, 02 Jan 2001 12:25:46 -0700
To: parisc-linux@thepuffingroup.com
Date: Tue, 02 Jan 2001 12:25:46 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E14DX46-0005uT-00@noam.fc.hp.com>
Subject: [parisc-linux] where to put 64 bit libmilli?
List-ID: <linux-parisc.vger.kernel.org>


I have source code for HP's 64-bit millicode and am working on making
it compilable with our tool chain.  But the bigger question is where
do I put it?

Right now millicode is part of libgcc.a in top-of-branch gcc, but I
seem to recall some linker magic, and when/if that happens I don't
know where to put the millicode stuff.

Help?

	-Paul Bame
