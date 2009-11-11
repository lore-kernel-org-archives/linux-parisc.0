From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Problem with early startup in dynamic linker.
Date: Wed, 11 Nov 2009 11:41:12 -0500 (EST)
Message-ID: <20091111164114.01AE3515C@hiauly1.hia.nrc.ca>
References: <119aab440911110634oe4a8eb2m8ff519055e7fbdf5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440911110634oe4a8eb2m8ff519055e7fbdf5@mail.gmail.com> from "Carlos O'Donell" at Nov 11, 2009 09:34:17 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> John,
> 
> I need your help crafting some assembly for the early startup of the
> dynamic linker.
> 
> During early startup we need to do some work *before* the GOT is relocated.
> 
> This means that static local variable accesses are handled via a
> special wrapper e.g.
> ~~~
>   struct local *l;
> 
>   ELF_MACHINE_LOAD_ADDRESS (l, local);
> 
>  retry:
>   root = l->root;
> ~~~
> Where local is a static local variable defined at the top of the C file.
> 
> Previously I had implemented ELF_MACHINE_LOAD_ADDRESS like this:
> ~~~
> #define ELF_MACHINE_LOAD_ADDRESS(var, symbol)           \
>   asm ("        addil LT'" #symbol ", %%r19\n"          \
>        "        ldw RT'" #symbol "(%%sr0,%%r1), %0\n"   \
>       : "=&r" (var) : : "r1" );
> ~~~
> 
> As you will notice the LT'/RT' pair will generate an access through
> the GOT for this variable e.g.
> ~~~
>   ELF_MACHINE_LOAD_ADDRESS (l, local);
>    18b30:       2a 60 10 00     addil L%800,r19,r1
>    18b34:       48 26 00 00     ldw 0(r1),r6
> ~~~
> 
> This appears to have worked because in previous builds the GOT
> relocations required for this access were processed *before* the
> access.
> 
> How do I load the address of a static local variable without using the GOT?
> 
> I use the following for computing the location of _DYNAMIC:
> ~~~
>   Elf32_Addr dynamic;
> 
>   asm (
> "       b,l     1f,%0\n"
> "       depi    0,31,2,%0\n"
> "1:     addil   L'_DYNAMIC - ($PIC_pcrel$0 - 8),%0\n"
> "       ldo     R'_DYNAMIC - ($PIC_pcrel$0 - 12)(%%r1),%0\n"
>    : "=r" (dynamic) : : "r1");
> ~~~
> 
> Can I use this sequence to find the address of a static local variable?

This will work if the local variable is in the same segment as
the code.  It may work generally because I believe there is a fixed
relationship between the code and data segments on linux (this isn't
true on hpux).  The issue is whether the data is readonly or needs
to be writeable.

> Is there a more optimal sequence?

In PA 2.0, the b,l/depi instructions can be replaced by the mfia
instruction.  This saves one instruction.  If you just need to load
a byte, etc, the ldo can be replaced by a ldb, ldh, ldw or ldd
instruction.  If the data is close, the addil isn't needed.  Otherwise,
there isn't much else that can be done to make the sequence more
optimal.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
