Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3BEAC4852
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 20 Dec 2003 21:18:06 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by colo.lackof.org (Postfix) with ESMTP id AFCA3298044
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 20 Dec 2003 21:18:05 -0700 (MST)
Received: from colo.lackof.org ([127.0.0.1])
	by localhost (colo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 13227-04 for <parisc-linux@lists.parisc-linux.org>;
	Sat, 20 Dec 2003 21:18:05 -0700 (MST)
Date: Sat, 20 Dec 2003 21:18:02 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031221041802.GB12969@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] audit for copyright/license
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,
I noticed linux-2.6:arch/parisc/kernel/firmware.c didn't
have a license (eg GPL) to stipulate terms of distribution.
I'll add a GPL to it in my next patch.

Could someone review drivers/parisc, arch/parisc, and include/asm-parisc
for both copyright and redistribution license?

A first step is to post a list of file missing either item.
If there is a "standard format" for either item, it would be
good to know what it is and whether or not parisc specific
files are "close enough" (or not).

Willy,
I noticed Documentation/SubmittingDrivers makes no mention of copyright.
Perhaps the following should be added after "License:"?

Copyright:      The copyright owner must agree to use of the GPL.
                It's best if the submitter and copyright owner are the
		same person. If not, the entity whichs authorizes the
		use of GPL should list a contact in case it's necessary
		to verify the will of the copyright owner.

thanks,
grant
