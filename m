Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id ACFC1482A
	for <parisc-linux@parisc-linux.org>; Fri,  4 May 2001 15:02:29 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14vmiM-0006RF-00; Fri, 04 May 2001 22:02:14 +0100
Date: Fri, 4 May 2001 22:02:14 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] glibc 2.2.3: setjmp/longjmp
Message-ID: <20010504220214.I32445@parcelfarce.linux.theplanet.co.uk>
References: <20010504210518.G32445@parcelfarce.linux.theplanet.co.uk> <200105042018.QAA06091@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200105042018.QAA06091@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Fri, May 04, 2001 at 04:18:42PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, May 04, 2001 at 04:18:42PM -0400, John David Anglin wrote:
> > i think i've traced the problem down to setjmp/longjmp not working.
> 
> My first guess would be the pic offset table register is not being

Thinking about it some more, I don't see how this can be the case.  Here's
the assembly:

    ea18:       e8 42 11 c4     b,l 14300 <_setjmp>,rp
    ea1c:       6b dc 3c 91     stw ret0,-1b8(sr0,sp)
    ea20:       34 1a 00 02     ldi 1,r26
    ea24:       4b d3 3f 11     ldw -78(sr0,sp),r19
    ea28:       08 1c 02 43     copy ret0,r3
    ea2c:       08 03 02 58     copy r3,r24
    ea30:       2a 60 00 00     addil 0,r19,%r1
    ea34:       48 21 07 d0     ldw 3e8(sr0,r1),r1
    ea38:       e8 40 02 6c     b,l fb74 <_dl_dprintf>,rp

after calling longjmp, that _dl_dprintf doesn't get called.  I can't
explain that.

-- 
Revolutions do not require corporate support.
