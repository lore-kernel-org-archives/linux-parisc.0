Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA30425
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Jan 2001 11:46:16 -0700
Message-Id: <200101231850.KAA26800@adlmail.cup.hp.com>
Subject: Re: [parisc-linux] parisc64 kernel and ret1 (gr29) setup
Date: Tue, 23 Jan 2001 10:47:41 -0800
From: Cary Coutant <cary@cup.hp.com>
To: "Matthew Wilcox" <matthew@wil.cx>, "Alan Modra" <alan@linuxcare.com.au>
Cc: "Richard Hirst" <rhirst@linuxcare.com>, <parisc-linux@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

>> Is there any code elsewhere that "knows" the stack frame is 64 bytes
>> (except for gdb and signal handler frames)?
>
>i'm not sure that's the point... knowing the stack frame is 64 byte
>aligned allows the compiler to know the alignment of all types being
>placed on the stack.

On HP-UX, the 64-bit conventions require only 16-byte alignment for stack 
frames.

Several years ago we made an attempt to establish a 64-byte stack frame 
alignment in the 32-bit conventions, so that the compiler could take 
advantage of certain cache hints available on some PA-RISC CPUs. Because 
of the complexity of assuring that all stack frames in a program obeyed 
this convention, and the growth in average stack use, we abandoned the 
idea.

I don't believe, however, that we ever fixed the 32-bit conventions 
document to reflect this reversal. Unfortunately, it still says that sp 
must be 64-byte aligned. Trust me -- it's wrong. We've never enforced a 
64-byte alignment.

-cary
