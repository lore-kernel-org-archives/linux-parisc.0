Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8EBFE482A
	for <parisc-linux@parisc-linux.org>; Fri,  4 May 2001 15:31:33 -0600 (MDT)
Message-Id: <200105042131.RAA15852@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc 2.2.3: setjmp/longjmp
To: matthew@wil.cx (Matthew Wilcox)
Date: Fri, 4 May 2001 17:31:30 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: matthew@wil.cx, parisc-linux@parisc-linux.org
In-Reply-To: <20010504220214.I32445@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at May 4, 2001 10:02:14 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> Thinking about it some more, I don't see how this can be the case.  Here's
> the assembly:
> 
>     ea18:       e8 42 11 c4     b,l 14300 <_setjmp>,rp
>     ea1c:       6b dc 3c 91     stw ret0,-1b8(sr0,sp)
>     ea20:       34 1a 00 02     ldi 1,r26
>     ea24:       4b d3 3f 11     ldw -78(sr0,sp),r19
>     ea28:       08 1c 02 43     copy ret0,r3
>     ea2c:       08 03 02 58     copy r3,r24
>     ea30:       2a 60 00 00     addil 0,r19,%r1
>     ea34:       48 21 07 d0     ldw 3e8(sr0,r1),r1
>     ea38:       e8 40 02 6c     b,l fb74 <_dl_dprintf>,rp
> 
> after calling longjmp, that _dl_dprintf doesn't get called.  I can't
> explain that.

Doesn't look like _setjmp comes back at all.  Put a break on ea18
and start stepping.  It might help to do a static link.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
