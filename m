Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-2.gci.net (mta-2.gci.net [208.138.130.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0DB2A482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Jun 2001 08:37:50 -0600 (MDT)
Received: from mmp-1.gci.net ([208.138.130.80]) by mta-2.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GFABAY00.R62 for
          <parisc-linux@lists.parisc-linux.org>; Thu, 21 Jun 2001 06:37:46 -0800
Received: from devnull.alaskatech.org ([24.237.5.207]) by
          mmp-1.gci.net (Netscape Messaging Server 4.15) with ESMTP id
          GFABAY00.V04 for <parisc-linux@lists.parisc-linux.org>; Thu, 21
          Jun 2001 06:37:46 -0800
Date: Thu, 21 Jun 2001 06:37:44 -0800 (AKDT)
From: Tom <tom@Alaskatech.org>
To: PA-RISC Linux list <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0106210628050.23440-100000@devnull.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Something broke dselect/apt...
List-ID: <linux-parisc.vger.kernel.org>

Unfortunately I wasn't watching the update - it's been a little too stable
lately, I guess...

I ran apt-get update/upgrade on Monday - all working. Just ran it again
this morning, had ~9 packages updated. All updated fine - no errors on the
update - but then apt-* fails to work with "error while loading shared
libraries - /usr/lib/libapt-pkg-libc6.2-3.so.3.2: undefined symbol:
_cp_push_exception". Trying to run dselect gives "error while loading
shared libraries: dselect: undefined symbol: __rethrow".

Has anyone noticed this yet and/or noticed something I may have goofed up?
I believe there was a palo update in there, plus one of the libc6-*
packages, but other than that I've no idea...

Thanks!
