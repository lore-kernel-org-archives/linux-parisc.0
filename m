Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA20613
	for <parisc-linux@puffin.external.hp.com>; Tue, 25 Jul 2000 11:28:24 -0600
Message-Id: <200007251722.KAA02283@adlmail.cup.hp.com>
Subject: Re: [parisc-linux] PIC code generation in gcc/binutils
Date: Tue, 25 Jul 2000 10:20:38 -0700
From: Cary Coutant <cary@cup.hp.com>
To: "David Huggins-Daines" <dhd@linuxcare.com>
Cc: <parisc-linux@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

>I can see some advantages in this even with a non-segmented runtime
>architecture - theoretically, having the GP be managed by the caller
>rather than the callee should make intramodule calls in
>position-independent code more efficient.  (I think so at least)

Yes, it does have that advantage, and we take advantage of it when we can 
determine at compile time that the callee is in the same load module.

>One thing I have not figured out is how the GP is "bootstrapped" in
>the startup code for the dynamic linker itself - how does ELF64 on
>HP/UX deal with this problem?

The kernel loader passes a "load info" record to the dynamic loader as 
the fourth parameter (after argc, argv, and envp). This record contains, 
among other things, the load addresses of the dynamic loader's text and 
data segments. The dynamic loader's startup code materializes its own gp 
based on the base address of its data segment.

-cary
