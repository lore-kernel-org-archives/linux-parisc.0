Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA28817
	for <parisc-linux@puffin.external.hp.com>; Thu, 17 Feb 2000 08:16:59 -0700
Received: from udlkern.fc.hp.com (jsm@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id HAA00213
	for <parisc-linux@thepuffingroup.com>; Thu, 17 Feb 2000 07:17:37 -0700 (MST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.1) id HAA08629 for parisc-linux@thepuffingroup.com; Thu, 17 Feb 2000 07:17:36 -0700 (MST)
Date: Thu, 17 Feb 2000 07:17:36 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200002171417.HAA08629@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Linux syscall ABI
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>
> I don't think I care.  Note that this is for PA1.1 anyway, so we don't have
> large pages architecturally.

But we do have an even smaller resource of block tlb's that can also
map a maximum of 64 Mb at a time, and which also need to be aligned
to there same size that they map. For this reason it might be worth
considering having a 64 Mb offset rather than a 0 offset and not mapping
the first 64 Kb.

>
> I'd prefer to fix gateway offset now - it's a pretty arbitrary decision,
> but it might break binary compatibility lateron.  My proposal is 0x100.

That's fine with me. We can put break instructions in 0x00-0xfc to catch
anyone branching through a null function pointer.

John Marvin
jsm@fc.hp.com
