Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA30481
	for <parisc-linux@puffin.external.hp.com>; Wed, 23 Aug 2000 04:41:52 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 23 Aug 2000 10:41:43 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id UAA06225;
	Wed, 23 Aug 2000 20:41:02 +1000
Date: Wed, 23 Aug 2000 20:41:02 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: binutils@sourceware.cygnus.com
cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com,
        Jeffrey A Law <law@cygnus.com>
Message-ID: <Pine.LNX.4.21.0008231914440.11816-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] hppa .reg
List-ID: <linux-parisc.vger.kernel.org>

Hi,
   I've just spent a bit of time modifying tc-hppa.c:pa_parse_number and
sundry places where it's called to allow: 

pte: .reg %r16
 depd    pte,31,32,pte

Previously, gas would barf on lack of a `%' followed by one of the
predefined regs for any FLAG_STRICT insn like the above `depd'.

All well and good, but my patch puts these register alias symbols into
reg_section, the natural place for them to go, and this happens to kill
one of the hppa tests.  gas/testsuite/gas/hppa/parse/regpopbug.s is like
this:
 --------
        .code

r0:     .reg    %r0
shift:  .reg    %sar
fpreg10: .reg   %fr10
shift2: .reg    shift

; Make sure we didn't botch .equ...
yabba:  .equ    r0 + shift
 ---------

and adding two register symbols ain't an absolute expression for the
`.equ', so I've "botched .equ"

Now the question is, does adding two reg symbols make sense (it doesn't 
to me), or is this particular case a backwards compatibility issue?  Can 
someone tell me what the current hp assembler does with the above test?

Regards, Alan Modra
-- 
Linuxcare.  Support for the Revolution.
