Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA19731
	for <parisc-linux@puffin.external.hp.com>; Tue, 31 Oct 2000 09:49:53 -0700
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by atlrel1.hp.com (Postfix) with ESMTP id DE795774
	for <parisc-linux@thepuffingroup.com>; Tue, 31 Oct 2000 11:51:32 -0500 (EST)
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Elf Header change proposal 
In-Reply-To: Your message of "Tue, 31 Oct 2000 03:32:20 MST."
             <200010311032.DAA21612@udlkern.fc.hp.com>
References: <200010311032.DAA21612@udlkern.fc.hp.com> 
Date: Tue, 31 Oct 2000 09:51:31 -0700
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E13qedH-0007k6-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= 
=     2) 64 bit parisc binaries (currently just vmlinux) are currently using
=     the Elf32_hdr type.  They should be changed to use the Elf64_hdr type.

This I don't understand.  Palo (and palo's boot loader, and hpux's
boot loader) successfully use
eh.e_ident[EI_CLASS] == ELFCLASS32 and eh.e_ident[EI_CLASS] == ELFCLASS64
along with (__be16_to_cpu(eh.e_machine) == EM_PARISC)
to distinguish 32/64-bit parisc executables.  In the 64-bit case, palo
happily uses struct elf64_phdr to grok the 64-bit vmlinux header.
palo/lib/elf*.c has the details if they're of interest.

Palo has some potential problems: it doesn't check ABI, assumes
big endian byte order, and assumes that 64-bit ELF headers imply
a wide kernel (calling PDC and setting the W bit appropriately).

	-P
