Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id QAA11576
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 16:24:42 -0700
Date: Tue, 16 Jan 2001 15:28:23 -0800
Message-Id: <200101162328.PAA11178@elmo.cygnus.com>
From: Nick Clifton <nickc@redhat.com>
To: alan@linuxcare.com.au
CC: binutils@sourceware.cygnus.com, parisc-linux@puffin.external.hp.com
Subject: Re: Build hppa unwind info for more than .text
List-ID: <linux-parisc.vger.kernel.org>

Hi Alan,

: > Won't this create unwind info for read only data sections ?
: 
: Only if the assembler sees
: 
:  .proc
:  .callinfo
:  .entry
: 
:  function body
: 
:  .exit
:  .procend
: 
: You're unlikely to get unwanted unwind info.

OK - just checking.

Cheers
	Nick
