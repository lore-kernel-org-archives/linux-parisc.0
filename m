Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id E95FE4A15
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Oct 2001 11:01:33 -0600 (MDT)
Message-Id: <200110101657.KAA19790@puffin.external.hp.com>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HPMC when doing sync on c3k (32 bit kernel) 
In-Reply-To: Message from Randolph Chung <randolph@tausq.org>
   of "Tue, 09 Oct 2001 20:04:38 PDT." <20011009200438.F653@tausq.org>
Date: Wed, 10 Oct 2001 10:57:43 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Randolph Chung wrote:
> I noticed that when i do a manual 'sync' on my c3000 running a 32-bit
> kernel, I get a HPMC:
...
> "pim hpmc" says:
> A Data I/O Fetch Timeout occurred while CPU 0 was
> requesting information from a device at the path 10/0/14/1/1 (built-in
> PCI device)

That's the SuckyIO serial port. Randolph and I exchanged notes offline
and concluded his prototype C3000 has PA8500 v2.0 CPU (and newer elroys
than mine). I can't reproduce the problem with a v2.3 chip.  I should be
able to upgrade his CPU to v2.3 and we'll see if the problem persists.
Lots of bugs in pre-2.3 chip revisions.
(BTW, does that answer your question Helge? :^/)

grant
