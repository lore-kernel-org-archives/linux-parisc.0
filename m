Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id BB5AB483B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 May 2002 22:13:11 -0600 (MDT)
Received: (from carlos@localhost)
	by sh.od.inet (8.11.6/8.11.0) id g4R4DL923591
	for parisc-linux@lists.parisc-linux.org; Mon, 27 May 2002 00:13:21 -0400
Date: Mon, 27 May 2002 00:13:21 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020527001321.A6629@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] kdb_v21 branch updated to -pa26, and kallsyms cross-compile
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Parisc,

All the changes from -pa24 to -p26 have been merged into the
kdb-v21 tree (that Randolph graciously started!). Thanks go
to bame's recipe!

A few tests show that it is equivalent to the patches I had 
produced (fixes to traps.c for the soft power button).

If kdb is your bag, then it should all be set to go!

---

On another note... until I get a really fast PA box, I'm going
to be cross-compiling all the time. There are issues cross-compiling 
a kdb'd kernel, and the problem is called 'kallsyms'.

After a bout of idiocy and help from Jess I had a cross version
of kallsyms (never forget to 'unset CC'). 

It seemed like I was home free, except that I ran into the same
problem as before (even with the supposed _new_ cross kallsyms).

.tmp_vmlinux1: ELF file .tmp_vmlinux1 not for this architecture

I check ./src/modutils/obj/obj_load.c and find:

  if (f->header.e_ident[EI_CLASS] != ELFCLASSM
      || f->header.e_ident[EI_DATA] != ELFDATAM
      || f->header.e_ident[EI_VERSION] != EV_CURRENT
      || !MATCH_MACHINE(f->header.e_machine))
    {
       error("ELF file %s not for this architecture", filename);
       return NULL;
    }

So I breakup the values and test individually...

.tmp_vmlinux1: ELF file .tmp_vmlinux1 not for this architecture (!MATCH_MACHINE)

The MATCH_MACHINE macro is pretty dumb.
#define MATCH_MACHINE(x)  (x == EM_PARISC)

printf what e_machine header is set to:

ELF e_machine header is 3840
.tmp_vmlinux1: ELF file .tmp_vmlinux1 not for this architecture (!MATCH_MACHINE)

I'm not sure I've _ever_ seen a EM_??? value that big (EM_PARISC=15).
A closer inspection reveals that 3840 is 15 but byte swapped.

Which leaves me wondering... what else is going to be bytesex broke in
a cross modutils?

Is anyone familiar with modutils?
What would be a good way to include some cross-kallsyms support?

c.
