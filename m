Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1E4F94A18
	for <parisc-linux@parisc-linux.org>; Wed, 31 Jan 2001 19:48:34 -0700 (MST)
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel2.hp.com (Postfix) with ESMTP id 81D9A1762
	for <parisc-linux@parisc-linux.org>; Wed, 31 Jan 2001 21:48:33 -0500 (EST)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id 5C5A238926
	for <parisc-linux@parisc-linux.org>; Wed, 31 Jan 2001 19:50:31 -0700 (MST)
To: parisc-linux@parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 31 Jan 2001 19:50:31 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010201025031.5C5A238926@carmen.fc.hp.com>
Subject: [parisc-linux] WARNING: C3000 Linux problems
List-ID: <linux-parisc.vger.kernel.org>

Summary: Don't run Linux on a C3000 until you hear otherwise.

Recently I had been doing a lot of building on a C3000 and was having some 
very weird and often not repeatable errors. John Marvin has a J5000 and was 
not having the problems. We were able to find a way to repeat the errors 
cleanly and independantly of other variables. We discovered that there is 
something different between the C3000 and J5000 that is causing the errors to 
happen. This is using a pre 2.4.0-merge kernel. So whatever subtle difference 
there is in the hardware is causing or uncovering a problem with our kernel. 
J5000s seem to be as good as ever, I don't know about B1000, B2000, C3600, 
J5600, or J6000. John Marvin is still looking at the problem, I have switched 
to a J5000 and am still trying to get a new toolchain built properly. 
Hopefully this will be resolved soon.

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
