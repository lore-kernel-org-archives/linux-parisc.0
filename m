Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA30110
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 May 2000 17:34:32 -0600
Received: from l3107mxr.atl.hp.com (l3107mxr.atl.hp.com [15.19.254.19])
	by atlrel2.hp.com (Postfix) with ESMTP id 80C65268
	for <parisc-linux@thepuffingroup.com>; Tue, 16 May 2000 19:34:32 -0400 (EDT)
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by l3107mxr.atl.hp.com (Postfix) with ESMTP id 4846F4FD83
	for <parisc-linux@thepuffingroup.com>; Tue, 16 May 2000 18:34:32 -0400 (EDT)
To: parisc-linux@thepuffingroup.com
Date: Tue, 16 May 2000 17:34:22 -0600
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12rqr5-0000jH-00@endor.fc.hp.com>
Subject: [parisc-linux] glibc and the rest of the world
List-ID: <linux-parisc.vger.kernel.org>


Since we've changed the assembler comment character, we changed some
existing assembly files in glibc.  Since these changes were done in-place,
we will be unable to fold them back into the upstream sources since
most folks don't use our assembler.  I'm thinking we need a separate
set of linux/hppa files instead of modifying the existing generic hppa
ones but I don't know how to do this.  Comments?  Advice?

My real motivation is to be able to track the real glibc.  I think the
copy we have is flawed, and with our changes it's difficult to go
to a standard release, like 2.1.3 (which I'd love to do, then we
can use the Debian build) or keep up with recent changes.  Since I
changed some of those assembly files too, I'd like to clean
up my hackery a bit before getting much deeper in the mire.

	-Paul Bame
