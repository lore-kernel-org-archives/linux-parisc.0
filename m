Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA00325
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Oct 1999 22:55:22 -0600
Received: from vodka.thepuffingroup.com by mrelay.bellglobal.com
 (PMDF V5.1-12 #26722) with ESMTP id <0FJV00CE2XPQE0@mrelay.bellglobal.com> for
 parisc-linux@thepuffingroup.com; Wed, 20 Oct 1999 00:56:15 -0400 (EDT)
Date: Wed, 20 Oct 1999 01:02:52 -0400 (EDT)
From: Alex deVries <adevries@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-id: <Pine.LNX.4.10.9910200059250.14349-100000@vodka.thepuffingroup.com>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] a WAX question.
List-ID: <linux-parisc.vger.kernel.org>


I've figured out the problems with getting Lasi working on my brand
spanking new 712/80, and had to make a more general Lasi hversion and
sversion pattern matching included in lasi.c (to be committed shortly).

I'm trying to make a generic one for RS232, and going through the hardware
table in arch/parisc/kernel/hardware.c, I need to ensure that I don't
conflict with other non-lasi serial ports.  

Something that comes up quite a bit in those entries is WAX.  Is there
actually a serial port on the WAX chip?  What can people tell me about
this chip?

- Alex

-- 
Alex deVries <adevries@thepuffingroup.com>
Vice President Engineering
The Puffin Group
