Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA14308
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Sep 2000 12:56:21 -0600
Message-Id: <200009221900.MAA14390@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Cc: amodra@linuxcare.com
Subject: Re: [parisc-linux] internal error in tc-hppa.c? 
In-reply-to: Your message of "Fri, 22 Sep 2000 09:52:26 PDT."
             <E13cW3m-0006sn-00@hpisp747.cup.hp.com>
Date: Fri, 22 Sep 2000 12:00:44 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:

> I was told entry.S is broken but the assembler should handle it
> more gracefully...so I'll be looking at entry.S to see what's broken.

This was correct - in a twisted sense (tnx dhd!).
Case closed. Details and minor rant follow.


> Line number of entry.S is junk since parisc64 version is just
> an include of the parisc version. line 1560 is the real culprit:
>         b,n .

This is the last line of the file...adding NOP moved the error
to the nop.


The problem was the following change to arch/parisc/tools/offset.c:

| revision 1.9
| date: 2000/09/22 13:36:58;  author: jsm;  state: Exp;  lines: +12 -1
| Put in offset for processor field in task structure. Put in offset for
| elements of irq_cpustat_t which are used in assembly for processing
| software interrupts.

It was NOT ported to arch/parisc64/tools/offset.c.

jsm added TASK_PROCESSOR definitions *and* used them in entry.S.
entry.S is common between parisc and parisc64 while offset.c is not.

[/rant on]
Having to track this down the hard way cost me ~3 hours.
Especially since Paul Bame and I were suspicious about
our recent changes to assembly.h...so if the error reported
could be more informative (ie which symbol failed),
it'd have been easy to figure out.
{/rant off]

Could someone who has a clue about tc-hppa.c improve the
error reporting for this case?
I'm certain we are going to see this again...

thanks,
grant

ps. I've ported the changes to parisc64/tools/offset.c and
   will commit them shortly.

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
