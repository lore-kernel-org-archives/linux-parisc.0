Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA00360
	for <parisc-linux@puffin.external.hp.com>; Wed, 13 Sep 2000 11:11:00 -0600
Message-Id: <200009131711.KAA21176@adlmail.cup.hp.com>
Subject: Re: [parisc-linux] userspace function pointers in the kernel
Date: Wed, 13 Sep 2000 10:11:03 -0700
From: Cary Coutant <cary@cup.hp.com>
To: "Alan Modra" <alan@linuxcare.com.au>,
        "David Huggins-Daines" <dhd@linuxcare.com>
Cc: <parisc-linux@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

>The model I'm thinking of for elf32-hppa is along these lines:
>
>o  The linker creates a plt entry for all plabel relocs.  plt entries for
>   elf32-hppa are a function address, linkage table pointer pair, so
>   there's no need for the dynamic linker to allocate fptrs.
>o  A dynamic plabel reloc will have the function symbol, and an addend
>   into the plt.  This is a rather unusual reloc because the function
>   symbol value is ignored when calculating the final value.
>o  The dynamic linker builds a list or hash table of function symbols
>   versus plt offsets, and adjusts plabels so that only one plt entry is
>   ever used per function.

This is close to how it works on HP-UX, but we didn't use the table in 
your third bullet, so it became possible for the dynamic loader to come 
up with one function descriptor (PLT entry) one time, and a different one 
the next time.

Another thing you need to watch out for is when a library is dlclosed. 
Because the PLT entries are allocated when you see the reference -- not 
the definition -- you may not have a candidate PLT entry in the load 
module that contains the definition of the function (unless you also 
allocate PLT entries for all exported symbols). This means that you might 
be asked to dlclose a library that contains the PLT entry that is 
currently in use as the official function pointer for a function in 
another load module. If you go ahead and deallocate the library, you're 
hosed.

-cary
