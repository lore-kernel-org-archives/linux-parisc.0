Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id C5EA048AE
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Oct 2001 08:36:32 -0600 (MDT)
Date: Mon, 1 Oct 2001 08:36:28 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200110011436.IAA14595@udlkern.fc.hp.com>
To: nneul@umr.edu
Cc: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: Status of hp-ux binary compatibility?
List-ID: <linux-parisc.vger.kernel.org>

Nathan,

hp-ux compatibility is definitely broken. It probably wouldn't take too
much effort to get it back to where it was before, however the best we
ever did was to run some simple text based programs that were linked
archive (-Wl,-aarchive). We didn't even have shared libraries working.

Just out of curiosity, what type of HP-UX binaries did you want to run?
If it is 3D graphics based, or it uses a bunch of HP-UX proprietary
kernel calls, ioctl's, etc. it isn't likely to work anytime soon ...

John Marvin
jsm@fc.hp.com
