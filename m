Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA32466
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 11:49:31 -0700
Message-Id: <200011141851.KAA11966@milano.cup.hp.com>
To: "Phillip D. Beal" <pdbeal@louisville.edu>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 735/755 and Kernel test10.. 
In-reply-to: Your message of "Tue, 14 Nov 2000 13:40:24 PST."
             <20001114134023.B33756@athena.louisville.edu>
Date: Tue, 14 Nov 2000 10:51:26 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Phillip D. Beal" wrote:
> Hey,
> 
> I've been working on the 735 and 755 that I has access to and so far
> the systems booted the test6 kernel, but scrambled the console as soon
> as init was run.  So, I figured I'd try the new test10 kernel that you
> have added.  Both system boot, and then stop at this line:
> 
> branching to kernel entry point 0x00100000
> Can't select default wide mode, PDC_PSW call does not work

Did you build this kernel yourself?

If so, it sounds like you built a 64-bit kernel since that's the default.
You need to change the ARCH line in the linux/Makefile to read "parisc"
instead of "parisc64".

grant

> 
> What does the above actually mean?  How can I remove the PDC_PSW call
> from the kernel so it can boot? I have plans to test this new kernel
> image on a 715 later today. 
> 
> Thanks,
> -- 
> Phillip Beal
> Electrical and Computer Engineering
> S+LUG Vice-President
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
