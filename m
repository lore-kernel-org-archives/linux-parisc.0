Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA13796
	for <parisc-linux@puffin.external.hp.com>; Mon, 16 Aug 1999 00:49:46 -0600
Message-Id: <199908160641.XAA03656@milano.cup.hp.com>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
Subject: Re: reserving constants
Cc: parisc-linux@thepuffingroup.com
Date: Sun, 15 Aug 1999 23:41:03 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

At 12:48 AM 8/6/99 +0200, Matthew Wilcox wrote:
...
>Linux doesn't distinguish between O_NONBLOCK and O_NDELAY so I also
>defined:
>
>#define O_NONBLOCK      00200004 /* HPUX has separate NDELAY & NONBLOCK */
>#define O_NDELAY        O_NONBLOCK

I would not equate the two.
I'm not sure the difference is clear to folks outside of HP.
Or even many folks inside HP for that matter. :^/
I just read the open(2) and read(2) man page. I don't think
it's use is fully documented. Perhaps in the DDG or DDR?

I might be confusing flags here though...could someone confirm
the O_NDELAY is the same flag which gets passed to the disk
drivers as B_NDELAY (defined in buf.h)?

B_NDELAY has special meaning to the mass storage subsystem and
is (was) needed by some of the "high availability" applications.

The semantics (I thought) of B_NDELAY is it allows the process to sleep
on a open/read/write, but no part of the SCSI driver stack is allowed
to retry "errors". This means the application must handle all error
conditions - including transient errors and there are plenty of those.
This was implemented to avoid long delays associated with retrying
"transient" errors and get control back to the application.

hope this helps,
grant
