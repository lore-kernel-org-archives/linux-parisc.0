Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA25373
	for <parisc-linux@puffin.external.hp.com>; Mon, 24 Jul 2000 17:59:02 -0600
Message-Id: <200007250000.RAA03038@adlmail.cup.hp.com>
Subject: Re: [parisc-linux] PIC code generation in gcc/binutils
Date: Mon, 24 Jul 2000 16:58:47 -0700
From: Cary Coutant <cary@cup.hp.com>
To: "David Huggins-Daines" <dhd@linuxcare.com>
Cc: <parisc-linux@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

>I was hoping to write up a preliminary ABI specification based on the
>64-bit ELF implementation on HP/UX, so I've been trying to find
>detailed specifications on how the ELF64 ABI actually works but so far
>have not come up with much information from HP's documentation.  The
>64-bit runtime architecture document has some useful information, but
>I suspect I'll have to look at the actual implementation to nail down
>the details.

As the HP-UX Runtime Architect, I'll be happy to answer any questions you 
may have on the runtime architecture. I realize that the 64-bit runtime 
architecture is weak in the dynamic loading area, but I'll try to make up 
for that by answering questions in this forum.


>One thing I am sure of is that if we try to follow the HP/UX ELF64
>specification for dynamic linking on 32-bit Linux we are going to be
>substantially different from other Linux/ELF platforms.  In
>particular, the handling of inter-module calls and function pointers,
>and the management of the GP, are done in a totally different way from
>all the other platforms I've encountered (i386, m68k, alpha).
>(i.e. inter-module calls are handled by another set of stubs, and GP
>management is done by the caller via the function descriptors, rather
>than by the callee with GPDISP and similar relocations)

The model used for PA-RISC is a a consequence of the segmented 
architecture, where the text and data segments are not adjacent. Since 
the PA-RISC sharing model is based on global virtual addresses, the text 
and data segment are loaded in separate quadrants of the address space so 
that the text can be shared and the data can be process-private. As a 
result, a procedure cannot materialize its own gp, since there is no 
fixed pc-relative offset between the text and data. This means that the 
caller must materialize the gp prior to the call, or as part of the call.

By the way, this model is also being used for IA-64. You may be able to 
leverage some of the work being done for ld.so on that platform.

It shouldn't really complicate the dynamic loader that much, though. A 
function pointer is still essentially a function pointer, and behaves the 
same as in the other model, even though it points to a 128-bit descriptor 
rather than an actual function. The linker needs to allocate a GOT entry 
for each import stub (aka "proxy") it creates, and attach a dynamic FPTR 
relocation to that GOT entry. The dynamic loader needs to create the 
function descriptor when it processes the FPTR relocation.

Lazy binding requires a bit of cleverness. We do it by dynamically 
creating lazy-binding stubs that load a module id and a PLT index into 
registers, then branch to a common bind-on-reference routine.


Cary Coutant
HP-UX Runtime Architect
