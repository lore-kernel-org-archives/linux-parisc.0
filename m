Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bloody (bloody.mindless.co.uk [195.224.53.249])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3237D482F
	for <parisc-linux@lists.parisc-linux.org>; Sun, 25 May 2003 15:18:54 -0600 (MDT)
Received: from mindless.co.uk (bloody [127.0.0.1])
	by bloody (Postfix) with SMTP id 37A6669D5F
	for <parisc-linux@lists.parisc-linux.org>; Sun, 25 May 2003 22:18:50 +0100 (BST)
Message-ID: <35262.194.131.108.2.1053897530.squirrel@ssl.mindless.co.uk>
Date: Sun, 25 May 2003 22:18:50 +0100 (BST)
From: "Siraj 'Sid' Rakhada" <sid@mindless.co.uk>
To: <parisc-linux@lists.parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] RAID Boot Howto question...
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi,

I'm installing Debian 3.0r1 on a K370 (via a testing netinst CD due to
issues with PDC or something - I'm not too hot on this stuff yet!). It's
currently sitting on the 'partition a hard disk prompt' while I read up
some more on the RAID stuff...

Which leads me to a question about the RAID howto which is listed on the FAQ.

Basically the author (Martin Petersen) writes at the end of step 7 that he
made a modification to PALO to allow it to boot from RAID partitions...
The HOWTO is dated 14th Jan 2003...

Anyway, I was looking to find information on PALO now, to see if this
change has been incorporated onto a released version - and I think it has
- due to this: http://packages.qa.debian.org/p/palo/news/1.html - also
dated 14th Jan 2003.

Would it be a good idea to list in the RAID boot HOWTO that 'version 1.2
of PALO incorporates the change, and is available in debian/unstable' ?

Best regards,

Sid
