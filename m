Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id LAA06379
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 11:17:22 -0700
Date: Tue, 16 Jan 2001 10:20:56 -0800
Message-Id: <200101161820.KAA24567@elmo.cygnus.com>
From: Nick Clifton <nickc@redhat.com>
To: alan@linuxcare.com.au
CC: binutils@sourceware.cygnus.com, parisc-linux@puffin.external.hp.com
Subject: Re: Build hppa unwind info for more than .text
List-ID: <linux-parisc.vger.kernel.org>

Hi Alan,

: We were missing lots of unwind info, especially when using
: -ffunction-sections, which confuses gdb.
: 
: gas/ChangeLog
: 	* config/tc-hppa.c (pa_build_unwind_subspace): Build unwind
: 	depending on section flags, not just for .text.

: Index: gas/config/tc-hppa.c
: ===================================================================
: RCS file: /cvs/src/src/gas/config/tc-hppa.c,v
: retrieving revision 1.76
: diff -u -p -r1.76 tc-hppa.c
: --- tc-hppa.c	2001/01/14 07:03:49	1.76
: +++ tc-hppa.c	2001/01/16 12:23:05
: @@ -6053,7 +6053,9 @@ pa_build_unwind_subspace (call_info)
:    int reloc;
:    char c, *p;
:  
: -  if (now_seg != text_section)
: +  if ((bfd_get_section_flags (stdoutput, now_seg)
: +       & (SEC_ALLOC | SEC_LOAD | SEC_READONLY))
: +      != (SEC_ALLOC | SEC_LOAD | SEC_READONLY))
:      return;

Won't this create unwind info for read only data sections ?  Would
that be a bad thing ?

Cheers
	Nick
