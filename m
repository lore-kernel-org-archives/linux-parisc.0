Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id CAE16482A
	for <parisc-linux@parisc-linux.org>; Fri,  4 May 2001 19:02:18 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14vqSL-00031I-00; Sat, 05 May 2001 02:01:57 +0100
Date: Sat, 5 May 2001 02:01:57 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Alan Modra <alan@SPRI.Levels.UniSA.Edu.Au>
Cc: Matthew Wilcox <matthew@wil.cx>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] glibc 2.2.3: setjmp/longjmp
Message-ID: <20010505020157.O32445@parcelfarce.linux.theplanet.co.uk>
References: <20010505010032.N32445@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.30.0105051006540.7087-100000@mullet.itr.unisa.edu.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.30.0105051006540.7087-100000@mullet.itr.unisa.edu.au>; from alan@SPRI.Levels.UniSA.Edu.Au on Sat, May 05, 2001 at 10:19:05AM +0930
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, May 05, 2001 at 10:19:05AM +0930, Alan Modra wrote:
> Oh horrible.  Yes, the stack frame that sysdeps/generic/bsd-_setjmp.c is
> using to load rp is no longer valid.  Oh well, the comment in
> generic/bsd-_setjmp.c should have warned us,

sure, if we'd ever looked in there :-)

on this subject, there've now been three things (LFS, ELF_OSABI_LINUX
and setjmp) which people have said `oh yeah, thought we might have some
problems with those, someone mentioned that' (or similar) once the problem
was found.  would anyone care to remember anything else that they thought
`might be a problem at some point'?

> which leads to another
> question.  Why was this added to gcc/config/pa/pa-linux.h?
> 
> /* Sibcalls, stubs, and elf sections don't play well.  */
> #undef FUNCTION_OK_FOR_SIBCALL
> #define FUNCTION_OK_FOR_SIBCALL(x) 0
> 
> Seems a bit drastic to me.  The correspnding define in pa.h should be OK
> for us.

I vaguely remember that.  Searching the list archive finds:
http://lists.parisc-linux.org/pipermail/parisc-linux/2000-July/009002.html

so it's dhd's fault :-)

-- 
Revolutions do not require corporate support.
