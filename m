Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA26658
	for <parisc-linux@puffin.external.hp.com>; Thu, 11 Nov 1999 09:46:06 -0700
Message-Id: <199911111646.LAA19701@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] _end symbol in parisc linux?
To: bame@debian.fc.hp.com (Paul Bame)
Date: Thu, 11 Nov 1999 11:46:15 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <199911111536.IAA19092@debian.fc.hp.com> from "Paul Bame" at Nov 11, 99 08:36:14 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> I'm also worried about why there are data symbols following BSS in
> our current palinux kernel...

I presume that the method of using the linker to define _end isn't
working.  Possibly, it is because the sort order for the sections $ANS$
and $CI$ is wrong.

164 (hiauly1)dave> objdump --headers vmlinux

vmlinux:          file format som

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 $TEXT$        0007a658  c0010000  00000000  00035000  2**3

  1 $FIRST$       00000208  c0010000  00000000  00035000  2**3
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  2 $SHLIB_INFO$  00000000  c0010208  00000000  00035208  2**3
		  ALLOC, LOAD, READONLY, CODE
  3 $MILLICODE$   00001ab8  c0011000  00000000  00036000  2**4
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  4 $LIT$         0000e340  c0012ab8  00000000  00037ab8  2**3
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  5 $CODE$        00062c28  c0020df8  00000000  00045df8  2**3
	          CONTENTS, ALLOC, LOAD, READONLY, CODE
  6 $UNWIND_START$ 000063d0  c0083a20  00000000  000a8a20  2**3
		  CONTENTS, ALLOC, LOAD, READONLY, CODE
  7 $UNWIND_END$  00000868  c0089df0  00000000  000aedf0  2**3
	          CONTENTS, ALLOC, LOAD, READONLY, CODE
  8 $PRIVATE$     0006f2c8  c008b000  00000000  000b0000  2**3

  9 $GLOBAL$      00000008  c008b000  00000000  000b0000  2**3
		  CONTENTS, ALLOC, LOAD, READONLY, CODE
 10 $DATA_START$  00000000  c008b008  00000000  000b0008  2**3
		  ALLOC, LOAD, DATA
 11 .data.cacheline_aligned 00000020  c008c000  00000000  000b1000  2**3
		  CONTENTS, ALLOC, LOAD, DATA
 12 $DATA$        0006d2c8  c008d000  00000000  000b2000  2**12
		  CONTENTS, ALLOC, LOAD, DATA
 13 $BSS$         00015930  c00fa2c8  00000000  00000000  2**3
		  ALLOC
 14 $ANS$         00000a42  00000000  00000000  00120000  2**2
		  DEBUGGING
 15 $CI$          00000a42  00000000  00000000  00120000  2**2
	          CONTENTS, DATA, DEBUGGING

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
