Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA10325
	for <parisc-linux@puffin.external.hp.com>; Tue, 12 Dec 2000 01:40:23 -0700
To: Alan Modra <alan@linuxcare.com.au>
Cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 32-bit xc-20001206.tar.gz is foobar 
In-Reply-To: Message from Alan Modra <alan@linuxcare.com.au>
   of "Tue, 12 Dec 2000 19:37:39 EST." <Pine.LNX.4.21.0012121934480.27939-100000@front.linuxcare.com.au>
References: <Pine.LNX.4.21.0012121934480.27939-100000@front.linuxcare.com.au> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Dec 2000 01:44:49 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001212084449.EB32737CA1@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Alan Modra writes...

> On Tue, 12 Dec 2000, Matt Taggart wrote:
> 
> > Alan Modra writes...
> > 
> > 
> > I just built a new cross-compiler (xc-20001211.tar.gz) and am still getting
>  
> > similar errors when building the kernel. It doesn't seem to matter if I hav
> e 
> > -ffunction-sections in the kernel Makefile or not.
> > 
> > > On a good fs.o, "hppa-linux-readelf -h fs.o" ought to show lots of .text.
> *
> > > sections.
> 
> Oops, sorry.  "hppa-linux-objdump -h" or "hppa-linux-readelf -S"

$ hppa-linux-objdump -h fs.o

fs.o:     file format elf32-hppa-linux

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .rodata       0000c06c  00000000  00000000  00000034  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, DATA
  1 .PARISC.unwind 00003b90  00000000  00000000  0000c0a0  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, DATA
  2 __ex_table    00000530  00000000  00000000  0000fc30  2**0
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, DATA
  3 .data         00001da0  00000000  00000000  00010160  2**3
                  CONTENTS, ALLOC, LOAD, RELOC, DATA
  4 .initcall.init 00000030  00000000  00000000  00011f00  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, DATA
  5 .exitcall.exit 0000001c  00000000  00000000  00011f30  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, DATA
  6 .init.data    000007d0  00000000  00000000  00011f4c  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, DATA
  7 .setup.init   00000008  00000000  00000000  0001271c  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, DATA
  8 .bss          00001ec8  00000000  00000000  00012724  2**2
                  ALLOC
  9 .comment      00000cf9  00000000  00000000  00012724  2**0
                  CONTENTS, READONLY
 10 .text         00000008  00000000  00000000  00013420  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
 11 .init.text    00001b3c  00000000  00000000  00013428  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 12 .text.1       00005f48  00000000  00000000  00014f64  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 13 .text.2       00003078  00000000  00000000  0001aeac  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 14 .text.3       000053f0  00000000  00000000  0001df24  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 15 .text.4       000044c8  00000000  00000000  00023314  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 16 .text.5       000070b8  00000000  00000000  000277dc  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 17 .text.6       000050cc  00000000  00000000  0002e894  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 18 .text.7       00005ce0  00000000  00000000  00033960  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 19 .text.8       0000265c  00000000  00000000  00039640  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 20 .text.9       00003eec  00000000  00000000  0003bc9c  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 21 .text.10      00003e04  00000000  00000000  0003fb88  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 22 .exit.text    000000f8  00000000  00000000  0004398c  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 23 .text.11      000047f0  00000000  00000000  00043a84  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 24 .text.12      00000be4  00000000  00000000  00048274  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 25 .text.13      00000408  00000000  00000000  00048e58  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 26 .text.14      000008b0  00000000  00000000  00049260  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 27 .text.15      00000da8  00000000  00000000  00049b10  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 28 .text.16      00000390  00000000  00000000  0004a8b8  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 29 .text.17      00003280  00000000  00000000  0004ac48  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 30 .text.18      00001584  00000000  00000000  0004dec8  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 31 .text.19      000015fc  00000000  00000000  0004f44c  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 32 .text.20      0000048c  00000000  00000000  00050a48  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 33 .text.21      000000d8  00000000  00000000  00050ed4  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 34 .text.22      00000400  00000000  00000000  00050fac  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 35 .text.23      00000394  00000000  00000000  000513ac  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 36 .text.24      000002a4  00000000  00000000  00051740  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 37 .text.25      00000008  00000000  00000000  000519e4  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
 38 .text.26      00000880  00000000  00000000  000519ec  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 39 .text.27      0000025c  00000000  00000000  0005226c  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 40 .text.28      00002370  00000000  00000000  000524c8  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 41 .text.29      00000000  00000000  00000000  00054838  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
 42 .text.30      000009c4  00000000  00000000  00054838  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 43 .text.31      00000000  00000000  00000000  000551fc  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
 44 .text.32      0000056c  00000000  00000000  000551fc  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 45 .text.33      00001fb4  00000000  00000000  00055768  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 46 .text.34      00000000  00000000  00000000  0005771c  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
 47 .note         00000654  00000000  00000000  0005771c  2**0
                  CONTENTS, READONLY

-- 
Matt Taggart
taggart@fc.hp.com
