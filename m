Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5B7BA482A
	for <parisc-linux@parisc-linux.org>; Tue,  1 May 2001 21:34:59 -0600 (MDT)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by atlrel2.hp.com (Postfix) with ESMTP id BE8C314A1
	for <parisc-linux@parisc-linux.org>; Tue,  1 May 2001 23:34:58 -0400 (EDT)
Date: Tue, 1 May 2001 21:34:58 -0600
To: parisc-linux@parisc-linux.org
Message-ID: <20010501213458.Y6063@zumpano.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: willy@ldl.fc.hp.com (Matthew Wilcox)
Subject: [parisc-linux] ELFOSABI_LINUX
List-ID: <linux-parisc.vger.kernel.org>

Here's the current situation as I understand it.

 * Binutils, when configured for an hppa-linux target, outputs binaries
   with the EI_OSABI field set to ELFOSABI_LINUX instead of ELFOSABI_SYSV.

 * The dynamic linker will refuse to link binaries for which the EI_OSABI
   field doesn't match the expected values -- the patch Jes wrote last
   december checks this field is set to either SYSV or LINUX, whereas
   the standard check is just for SYSV.  (note this is hppa-linux only
   and affects no other architecture).

 * The kernel does not currently check the EI_OSABI field.

The original discussion last November seemed to reach a resolution that
using this field to mark which ABI the OS implements was not the right
thing; instead this field marks ELF extensions that the ELF tools must
be aware of before manipulating this file.

Now, I'm not interested in digging up who did what when and why in order to
get us into this state.  But we do have a problem here.  Either we need to:

 * Stay in violation of the interpretation of the spec proposed last
   November.  This implies adding the HPPA patch to glibc so ld.so will
   recognise ELFOSABI_LINUX binaries.

 * Change binutils to produce binaries without ELFOSABI_LINUX set.  This
   implies rebuilding every debian package we've built so far -- over
   1100 source packages.  This means we'd miss our deadline of shipping
   at the end of May.

One subversive developer suggested a third alternative -- that we think up
& implement an extension to the ABI so we have to use ELFOSABI_LINUX :-)

Thoughts?
