Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA08451
	for <parisc-linux@puffin.external.hp.com>; Tue, 12 Sep 2000 14:54:19 -0600
Message-Id: <200009122054.NAA05612@adlmail.cup.hp.com>
Subject: Re: [parisc-linux] userspace function pointers in the kernel
Date: Tue, 12 Sep 2000 13:54:42 -0700
From: Cary Coutant <cary@cup.hp.com>
To: "David Huggins-Daines" <dhd@linuxcare.com>,
        <parisc-linux@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

>Next, even if we *weren't* trapping we would still be doing the wrong
>thing, because $$sh_func_adrs is actually supposed to give us the
>address of the function's code, and it isn't going to do this since
>the function lives in a different space.
>
>In the case of sigaction() I think we actually want to compare the
>plabel value (rather than the code address) againsr SIG_IGN and
>SIG_DFL.  However there may be other cases where this will break.
>
>Yes this is yet another side effect of the broken PA-RISC run time
>architecture.

I'm deeply troubled to learn that Linux is using $$sh_func_adrs, as I 
will readily agree with you that it's seriously broken.

It was introduced as a way to compare function pointers reliably, but in 
fact accomplishes exactly the opposite. The problem is that our dynamic 
loader cannot guarantee that two function pointers that both refer to the 
same procedure will compare equal. Rather than fix the dynamic loader, we 
chose to modify the compilers to compare two function pointers by digging 
down into the function descriptor itself to see if they really refer to 
the same function. Unfortunately, not all data items typed as function 
pointers are really valid pointers, and they can't be dereferenced 
safely. Thus, the millicode routine uses the probe instruction to verify 
that the address can be dereferenced without causing a memory fault.

Of course, this isn't 100% reliable on HP-UX, either, since a probe 
failure doesn't mean that the address isn't mapped. It should also be a 
"probe,r" instead of "probe,w".

For Linux, I strongly recommend that the dynamic loader guarantee that 
there is a 1-1 mapping between function and function pointer. If you do 
this, you won't need this silly special case when comparing function 
pointers.

>What do the IA-64 people do about this problem?

On IA-64, the dynamic loader will maintain a 1-1 mapping.

-cary
