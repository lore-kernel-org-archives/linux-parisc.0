Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA28693
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 13:36:31 -0700
Date: Mon, 20 Nov 2000 15:40:24 -0500 (EST)
From: herrold <herrold@owlriver.com>
Sender: <herrold@513erich.iwaynet.net>
To: "Paul J.Y. Lahaie" <pjlahaie@linuxcare.com>
cc: <parisc-linux@thepuffingroup.com>
Subject: Serial vs. STI console selector  was: Re: [parisc-linux] Beta CD
In-Reply-To: <20001114154259.B30937@achilles.net>
Message-ID: <Pine.LNX.4.30.0011201531170.6744-100000@pokey.513erich.iwaynet.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 14 Nov 2000, Paul J.Y. Lahaie wrote:

> This is to answer all the questions about sti console.  Currently, in the
> CVS tree, serial console and STI console cannot be turned on at the same time.
>
> This means that a choice between serial/sti needs to be done at compile
> time.

> If you have any more questions or suggestions, feel free to email me or
> post on this list.  Thank you.

... Query --

Background: Back in the early 70's with a HP 8090 <?>, IBM 1401, IBM
1620, and IBM 360/40, we faced such issues (Don't ask my age,
please)  -- The solution was to probe for, and look for 'sense
switches' in unusual state -- that is -- Some condition which we
could examine, and yet not hose up the boot proces on the host. --
CapsLock set on a keyboard driver -- DSR on a serial line, a
'console sense switch' normally kept off but turned on ... so on.
Sort of like working through a qualitative analysis flowchart in
non-organic chemistry.

Is this possible, to allow support of both, with a single kernel?

-- Russ
