Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id QAA10789
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 16:10:59 -0700
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA27829;
	Wed, 17 Jan 2001 10:14:18 +1100
Date: Wed, 17 Jan 2001 10:14:18 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Nick Clifton <nickc@redhat.com>
cc: binutils@sourceware.cygnus.com, parisc-linux@puffin.external.hp.com
Subject: Re: Build hppa unwind info for more than .text
In-Reply-To: <200101161820.KAA24567@elmo.cygnus.com>
Message-ID: <Pine.LNX.4.21.0101170918130.4272-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 16 Jan 2001, Nick Clifton wrote:

> : -  if (now_seg != text_section)
> : +  if ((bfd_get_section_flags (stdoutput, now_seg)
> : +       & (SEC_ALLOC | SEC_LOAD | SEC_READONLY))
> : +      != (SEC_ALLOC | SEC_LOAD | SEC_READONLY))
> :      return;
> 
> Won't this create unwind info for read only data sections ?

Only if the assembler sees

 .proc
 .callinfo
 .entry

 function body

 .exit
 .procend

You're unlikely to get unwanted unwind info.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
