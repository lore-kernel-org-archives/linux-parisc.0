Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id ECF6A482A
	for <parisc-linux@parisc-linux.org>; Sat, 28 Apr 2001 16:40:33 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14tdNz-000712-00
	for parisc-linux@parisc-linux.org; Sat, 28 Apr 2001 23:40:19 +0100
Date: Sat, 28 Apr 2001 23:40:19 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010428234019.D15328@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] pt-initfini.c
List-ID: <linux-parisc.vger.kernel.org>

glibc 2.2.3 requires a pt-initfini.c which is arch-specific (for hppa at
any rate).  dhd & amodra did initfini.c for hppa, and neither of them
seem to be around right now.  The IA64 pt-initfini.c differs from the
IA64 initfini.c by only a few lines.  So _for the moment_ in my local
copy, i've simply copied the initfini.c from the ordinary sysdeps as
pt-initfini.  Any volunteers to fix this mess properly?

-- 
Revolutions do not require corporate support.
