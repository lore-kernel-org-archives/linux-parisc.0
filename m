Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1546C482A
	for <parisc-linux@parisc-linux.org>; Fri,  4 May 2001 14:05:35 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14vlpG-000555-00
	for parisc-linux@parisc-linux.org; Fri, 04 May 2001 21:05:18 +0100
Date: Fri, 4 May 2001 21:05:18 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010504210518.G32445@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] glibc 2.2.3: setjmp/longjmp
List-ID: <linux-parisc.vger.kernel.org>

i think i've traced the problem down to setjmp/longjmp not working.

here's what happens:

__libc_dlsym calls
dlerror_run(do_dlsym) calls
_dl_catch_error -> setjmp, then calls
do_dlsym which calls
_dl_lookup_symbol which fails and calls
_dl_signal_cerror which calls
_dl_signal_error which calls longjmp

At this point, we should expect to get back to where we called setjmp, however that appears to not work.  If I add:

  errcode = setjmp (c.env);
_dl_printf("after setjmp, errcode = %u\n", errcode);
  if (__builtin_expect (errcode, 0) == 0)

the output from my debug logs looks like:

__libc_dlsym gconv_end
after setjmp, errcode = 0
current_value = 0 0
in the if... *ref = 0
in the if... not checking ELFW(ST_BIND)
in _dl_signal_cerror, receiver = 0
_dl_signal_error(0, /home/willy/cvs/glibc-build/iconvdata/SJIS.so, undefined symbol: gconv_end)
_dl_signal_error: lcatch = 7ff01300
_dl_signal_error: about to longjmp to 7ff01308
dlerror_run: errstr = (null)
Segmentation fault

so it's returning to the _caller_ of _dl_catch_error instead.  Ugh.
I'll be trying to decode assembler now...

-- 
Revolutions do not require corporate support.
