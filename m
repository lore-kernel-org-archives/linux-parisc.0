Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 44F6A482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  2 Aug 2001 09:10:49 -0600 (MDT)
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by atlrel2.hp.com (Postfix) with ESMTP id EFCCCD0B
	for <parisc-linux@lists.parisc-linux.org>; Thu,  2 Aug 2001 11:10:47 -0400 (EDT)
Received: from eeyore (helgaas@eeyore.fc.hp.com [15.1.54.199])
	by hpfcla.fc.hp.com (8.9.3 (PHNE_22672)/8.9.3 SMKit7.01) with SMTP id JAA10983
	for <parisc-linux@lists.parisc-linux.org>; Thu, 2 Aug 2001 09:10:46 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Bjorn Helgaas <bjorn_helgaas@hp.com>
To: parisc-linux@lists.parisc-linux.org
Date: Thu, 2 Aug 2001 09:11:54 -0600
MIME-Version: 1.0
Message-Id: <01080209115401.05959@eeyore>
Subject: [parisc-linux] Fwd: [Linux-ia64] [RFC] /proc/ksyms change for IA64 (fwd)
List-ID: <linux-parisc.vger.kernel.org>

Is this an issue for parisc as well?


----------  Forwarded Message  ----------
Subject: [Linux-ia64] [RFC] /proc/ksyms change for IA64 (fwd)
Date: Thu, 02 Aug 2001 13:38:40 +1000
From: Keith Owens <kaos@ocs.com.au>
To: linux-ia64@linuxia64.org


FYI.  Followups to linux-kernel@vger.kernel.org please, the initial
problem is IA64 specific but the fix is a generic one for all
architectures that require special processing, it needs to be discussed
on l-k.  I would have used Bcc: to ia64 but this list rejects Bcc mail.

------- Forwarded Message

The IA64 use of descriptors for function pointers has bitten ksymoops.
For those not familiar with IA64, &func points to a descriptor
containing { &code, &data_context }.  System.map contains the address
of the code, /proc/ksyms contains the address of the descriptor.
insmod needs the descriptor address, ksymoops and debuggers need the
code address, /proc/ksyms needs to contain both addresses, with one of
them prefixed by a special character.

EXPORT_SYMBOL() cannot distinguish between &function and &data.
Telling everybody that they must type EXPORT_SYMBOL_FUNCTION or
EXPORT_SYMBOL_DATA is not an option, the second symbol has to be
automatically added after linking vmlinux and modules.  I want to fix
this problem in user space, with no changes to to kernel code.  My
proposal for kernel 2.5 is :-

* In System.map and /proc/ksyms, label foo addresses the code, not the
  descriptor.  Label &foo addresses the function descriptor.

* foo has symbol versions, &foo does not.

* In kernel build, all objects that export symbols are post processed
  immediately after they are compiled.  On most architectures the post
  process is a no-op.  On IA64 it runs a program from modutils that
  identifies exported function pointers and modifies the ksymtab and
  kstrtab, see below.

* At run time, insmod does its normal address fixup processing first,
  including checking for symbol versions.  If the existing code
  succeeds without unresolved symbols, insmod modifies the address
  fixup so a reference to foo is resolved to &foo, iff both foo and
  &foo are in /proc/ksyms.

This has the benefit that all the changes are in modutils plus a small
change to the kernel build, no other user space tools are affected.
Most user space programs expect foo to address the code, not the
descriptor, AFAIK it is only insmod that needs the descriptor.  This
change will also affect any code that tries to front end functions from
modules but IMNSHO code should not be doing that.  If this breaks
binary only modules - tough.

One problem that always has to be addressed with modutils is version
skew between user space and the kernel.  With this approach, if you
build a new kernel with old modutils then the post processing program
will not be available so ksyms has the old format and the old insmod
behaviour applies, ksymoops will get errors but the kernel will still
run.  With a new modutils but an old kernel you get the old behaviour.
The only way you can get problems with version skew is to compile a
kernel on one machine with new modutils and install on another machine
with old modutils, modules will oops.  I don't see this as a problem,
the IA64 population is fairly small, in any case gcc cross compile for
IA64 has problems right now.

The new modutils supplied program (/usr/bin/modules_post) will look
through the __ksymtab section for an object.  For each exported symbol,
look at the data it references.  If that data contains two relocatable
addresses, one pointing to a text symbol, the other to a data symbol
and the text symbol has the same name as the exported symbol then this
is a descriptor.  Change the exported symbol name to &foo and add an
exported symbol foo that points to the code.

Note: This is modutils 2.5 stuff.  modules_post needs to use BFD which
      current modutils does not use, this adds a new requirement when
      compiling modutils.  Using BFD is the only way I can handle all
      the relocation types, especially in cross compile mode.  It may
      or may not get backported to modutils 2.4, probably not.
      ksymoops on IA64 2.4 will just have to live with lots of
      warnings.


------- End of Forwarded Message


_______________________________________________
Linux-IA64 mailing list
Linux-IA64@linuxia64.org
http://lists.linuxia64.org/lists/listinfo/linux-ia64

-------------------------------------------------------
