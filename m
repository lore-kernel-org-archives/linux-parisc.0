Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA16255
	for <parisc-linux@puffin.external.hp.com>; Tue, 15 Feb 2000 20:32:42 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id BD91374F
	for <parisc-linux@thepuffingroup.com>; Tue, 15 Feb 2000 18:33:18 -0800 (PST)
Message-Id: <200002160234.SAA06672@milano.cup.hp.com>
To: Philipp Rumpf <prumpf@inwestnet.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Linux syscall ABI 
In-reply-to: Your message of "Tue, 15 Feb 2000 19:18:58 PST."
             <20000215191858.P765@abacus.local>
Date: Tue, 15 Feb 2000 18:34:14 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
...
> HPMC is good debugging information - you've got PIM.

IMO, Frank didn't say this clearly:
	PIM is not "good debugging information".

Given the complexity of the systems, knowing *some* (not all)
of the HW state is marginally useful at best. When we get
into debugging driver problems later on, this will be clearer.

Besides the asynchronous nature of HPMCs, PIMs are unique to each
class of box. So decoding a PIM on a K-class is quite different
from the PIM on N or L-class. Only recently have tools been made
internally available to help decode each type of PIM. I wouldn't
hold my breath waiting for those to get published.


> Of course, we want
> an HPMC handler too, at some point.  The assembly part just tries to
> find out if the machine is still usable, and resets it if it's not.
> If it is, we'd like it to be treated as normal interruption, and then
> have a CPU-specific fault handler that reads the interesting registers
> and prints a nice message.

If linux could learn to dump host memory to disk, then HPMC's would
a bit easier to debug since one could review data structures for suspect
code. I think that's what the HPMC handler is intended for - not
attempt to recover. Attempting to recover from an asyncronous fault
doesn't sound feasible to me. But what do I know anyway....

later,
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
