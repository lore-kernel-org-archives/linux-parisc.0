Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA05962
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Feb 2000 12:58:36 -0700
Received: from hpdst41.cup.hp.com (hpdst41.cup.hp.com [15.16.128.62])
	by atlrel1.hp.com (Postfix) with ESMTP id 9EE781A9A7
	for <parisc-linux@thepuffingroup.com>; Fri, 11 Feb 2000 13:53:30 -0500 (EST)
Received: from cup.hp.com (hpdst231.cup.hp.com [15.16.129.192]) by hpdst41.cup.hp.com with ESMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id KAA25689 for <parisc-linux@thepuffingroup.com>; Fri, 11 Feb 2000 10:53:29 -0800 (PST)
Message-ID: <38A45AE4.EF2A67AB@cup.hp.com>
Date: Fri, 11 Feb 2000 10:54:29 -0800
From: Ullas Ponnadi <uponnadi@cup.hp.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
References: <38A0B5CB.DCF1C486@cup.hp.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Timer Interrupt and Scheduler
List-ID: <linux-parisc.vger.kernel.org>

I would like to expand my observations a little bit more with regards to
the timer
interrupt and the scheduler.

Looking at the linux documentation available and the code for the x86
and
alpha architectures, at the very end of a return from the timer
interrupt,
a call to the scheduler should be made, if necessary. I see this call in
the
ret_from_intr label in entry.S file on the x86 architecture and
ret_from_sys_call
in entry.S on the alpha architecture. The parisc interrupt handler does
not seem to
be doing any such thing. ( Looking at the linux-2_3_29-20000208_tar
archive ).

Could someone help me understand how the scheduler would get called when

a timer interrupt occurs?

Thanks,

Ullas


Ullas Ponnadi wrote:

> Could someone give me more insight into how the scheduler would get
> called
> when a timer interrupt happens? I tried tracing through the code
> handling the
> external interrupt and am at a loss trying to figure out this part.
>
> Thanks,
>
> Ullas Ponnadi
