Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id WAA24068
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 22:46:43 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel1.hp.com (Postfix) with ESMTP id C0B4C68A
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 00:48:56 -0500 (EST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id WAA18159 for parisc-linux@puffin.external.hp.com; Mon, 20 Nov 2000 22:47:41 -0700 (MST)
Date: Mon, 20 Nov 2000 22:47:41 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200011210547.WAA18159@udlkern.fc.hp.com>
To: parisc-linux@puffin.external.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Use of the EI_OSABI field
List-ID: <linux-parisc.vger.kernel.org>

> Another glibc issue (which is why I'm sending this back to the list) is
> that there has been quite some discussion on the binutils list over the
> use of the EI_OSABI field.  The conclusion being that it isn't really
> correct to use this field to discern the intendend execution platform.
> It's purpose is really to tell ELF tools that a file contains fields and
> values that need to be interpreted in a non-standard way.  Since both
> elf32-hppa and elf64-hppa follow the standards, I'm inclined to think that
> the gnu tools should set EI_OSABI to zero for both HPUX and Linux targets.

I don't read the binutils mailing list, so I checked the archive.  In my
opinion I didn't see a discussion, I saw H.J.  Lu repeatedly asserting
this "fact".  He may or may not be correct about original intention, but
the implementation so far has been that EI_OSABI is used to tell what the
target platform is.  That is what FreeBSD is doing, that is what HP-UX is
doing, and that is what the IA-64 Unix System V Application Binary
Interface specifies:

  http://developer.intel.com/design/IA-64/Downloads/24537002.pdf

Note that the second paragraph in section 1.1 of that specification
includes the following:

    This document is the result of consensus among operating system
    vendors intending to provide UNIX and UNIX workalike operating
    systems on the IA-64 architecture. The vendors participating in
    this effort include Intel, Sun Microsystems, SCO, IBM, SGI,
    Cygnus Solutions, VA Linux Systems, HP, and Compaq.

So, If the specification is wrong according to H.J. Lu, why did both
Cygnus and VA Linux Systems not object to this:

    Section 4.1.1.4 Operating System Identification

    The e_ident[EI_OSABI] value identifies the operating system and
    ABI to which the object is targeted, as listed in Table 4-1.

Table 4-1 lists the various ELFOSABI_* fields, e.g. ELFOSABI_HPUX,
ELFOSABI_NETBSD, ELFOSABI_LINUX, etc.

Note also, that the current mechanism for us to be able to differentiate
elf executables in the Linux kernel is the machine dependent
elf_check_arch() macro, whose only argument is a pointer to a
elf32_hdr or elf64_hdr. I think it would be ugly to try to get the
.note.ABI-tag section first for every exec of a new binary in order
to determine what the target ABI is.

In my opinion, unless H.J. Lu can get the IA-64 ABI changed, it is too
late to assert his view of what that field was supposed to be. Please
leave the EI_OSABI field set to ELFOSABI_LINUX until a better consensus
on this issue is reached.

John Marvin
jsm@fc.hp.com
