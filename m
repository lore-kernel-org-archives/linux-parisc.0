Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA21895
	for <parisc-linux@puffin.external.hp.com>; Mon, 25 Sep 2000 18:39:12 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 26 Sep 2000 00:39:54 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 25 Sep 2000 20:39:06 -0400
Message-ID: <87k8c0kmvp.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Lazy linking issues
List-ID: <linux-parisc.vger.kernel.org>

So,

It turns out that our ideas of how lazy linking would work are not
quite right.  The problem is that fixup() has to be called with the
struct link_map stored in GOT[1] of the object we are trying to
relocate, which means the strategy of looking at _GLOBAL_OFFSET_TABLE_
obviously won't work (in ld.so it would always get us the link_map for
ld.so, and it won't compile anyway since the code has to get linked
into libc.a ... I don't actually know why it worked before, but
probably because I forgot a */ on the comment at the top of
TRAMPOLINE_TEMPLATE).

In fact the code in elf_machine_runtime_setup() is wrong as well since
it is storing the link_map in the GOT of ld.so rather than the dynamic
object that is being loaded lazily :)

I think the strategy of (ab-)using the LTP part of the PLT slot to
pass extra info to the trampoline code is basically sound.  The only
problem is that we need more information than we currently have.

What the trampoline needs to know is:

        1) Offset of the PLT relocation we are going to perform in the
           DT_JMPREL array.  Note that this is often the same as the
           index in the PLT, but for us it currently isn't because our
           IPLT relocations are not sorted (due to _init weirdness).

        2) The struct link_map * that was saved in
           elf_machine_runtime_setup().

Both of these are hard.  The reason they are hard is because we need
to find them for the object we are coming *from*, and since there is
no code in the PLT we cannot easily arrange for this to be so.
Actually we would need more help from the linker to do that, anyway,
since the addresses of the GOT and PLT are not easily accessible from
any object (since the LTP doesn't really point to either of them).

Here is what I tried (until I realized it was doomed to failure):

First, I added an extra machine-specific dynamic tag (I would have
used DT_HP_LOAD_MAP but glibc does not support the 'OS-specific'
dynamic tags, and in fact has the wrong value for DT_LOOS) pointing to
the reserved area of each object and fixed up this object's IPLT to
point to it.  The larger reserved area contained:

        0 - link-time address of _DYNAMIC (same as before)
        4 - pointer to this object's struct link_map (also same)
        8 - address of this object's PLT
        12 - address of the LTP value for the fixup function

Having the extra dynamic tag is a good way to flag that an object can
do lazy linking, so the changes would not affect older binaries.

The problem was that I was working under the false assumption that
$$dyncall and import stubs would (or could) load the address of the
PLT slot in %r1 (not sure why I thought that ... didn't look close
enough at the import stub code I guess) and that we could get the
offset of the PLT relocation this way.  This doesn't work for two
reasons: (1) obviously, import stubs don't load %r1 with the address
of the PLT slot, and (2) the PLT relocations aren't sorted so the
value would be wrong anyway.

This means that my old idea of storing the index of the IPLT
relocation in each PLT slot in elf_machine_runtime_setup() was
essentially correct, but then we have the problem of how to get at the
reserved area of the GOT.  There is basically no way to do this that I
can think of without adding another word to the PLT slot (which might
not be a bad idea, actually).

Anyway I am going home, I'll leave you to think about this I guess...

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
