Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA11500
	for <parisc-linux@puffin.external.hp.com>; Tue, 12 Sep 2000 19:05:15 -0600
Message-Id: <200009130105.SAA19154@adlmail.cup.hp.com>
Subject: Re: [parisc-linux] userspace function pointers in the kernel
Date: Tue, 12 Sep 2000 18:05:38 -0700
From: Cary Coutant <cary@cup.hp.com>
To: "David Huggins-Daines" <dhd@linuxcare.com>
Cc: <parisc-linux@thepuffingroup.com>, "Alan Modra" <alan@linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

>It looks like the IA-64 runtime achieves this by generating official
>procedure descriptors for every defined function in an object and
>placing them in the .opd section, then using these descriptors
>whenever the address of a function is taken.  Presumably external
>functions are compared using their .IA_64.pltoff entries?  I'm not
>clear on how that works and don't have an IA-64 handy to experiment.

I can't say for sure how Linux/IA-64 uses the .opd section, but the 
runtime and the psABI recommend that the "official" function descriptors 
be created by the dynamic loader as needed in response to dynamic FPTR 
relocations. A function pointer is always loaded from the GOT or from a 
statically-initialized variable, either of which would have been tagged 
with a dynamic FPTR relocation. The dynamic loader will allocate one and 
only one OFD for each function whose address is taken, and resolve each 
function pointer to the address of that OFD. Function pointers can then 
be compared as simple 32- or 64-bit quantities, without worrying about 
the contents of the function descriptor that they point to.

One way of avoiding the dynamic allocation by the dynamic loader is for 
the linker to allocate OFDs statically for each exported function, and 
for each hidden or static function whose address is taken. It looks like 
this may be what Linux is doing on IA-64. The disadvantage is that you 
end up with far more OFDs than you'll ever need, since few functions ever 
really have their addresses taken.

The .pltoff section is for local copies of OFDs that are used by inlined 
import stubs. When the compiler decides that a function is unlikely to 
resolve within the load module, it generates an inlined external call 
sequence, rather than rely on the linker to resolve a direct call to an 
import stub. This inlined sequence needs a local copy of the function 
descriptor to avoid an extra indirection. Since these function 
descriptors never serve as an official function descriptor, it doesn't 
matter that they don't have the same address as an OFD.

Note that the same argument applies to C++ vtables -- we can put copies 
of the function descriptors there, too, since we don't need the pointers 
to vtable entries to be unique.

As an aside, the problem we had on HP-UX/PA was in statically allocating 
the official function descriptors -- the linker allocated OFD 
"candidates" whenever it saw the address of a function get taken. This 
produced multiple candidates for the OFD, and it was possible that none 
of those candidates were actually in the load module where the function 
was defined. Thus, the loader had to choose one arbitrarily, and 
sometimes could be tricked into choosing different ones at different 
times. Hence the problem.

-cary
