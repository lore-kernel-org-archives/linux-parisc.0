Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id B12EC487E
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 13 Feb 2004 07:35:19 -0700 (MST)
Date: Fri, 13 Feb 2004 15:35:09 +0100
Message-ID: <402A4CA500001B4D@ocpmta2.freegates.net>
In-Reply-To: <20040211162702.GI990@baldric.uwo.ca>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	James Morrison <ja2morri@csclub.uwaterloo.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Carlos,

I find a better reason why the build of glibc failed with gcc-3.5: here is
the dump of rtld.os (which would contains ref to set_dp):
with gcc-3.3
------------
palx2000:/Develop/parisc-linux/build/glibc# objdump -d ./elf/rtld.os | more

./elf/rtld.os:     file format elf32-hppa-linux

Disassembly of section .text:

00000000 <set_dp>:
       0:	4b 54 00 48 	ldw 24(,r26),r20
       4:	0e 88 10 9b 	ldw 4(,r20),dp
       8:	e8 40 c0 00 	bv r0(rp)
       c:	08 1a 02 5c 	copy r26,ret0

00000010 <_start>:
      10:	37 de 00 80 	ldo 40(sp),sp
      14:	6b d9 3f b1 	stw r25,-28(,sp)
      18:	6b d8 3f a9 	stw r24,-2c(,sp)
      1c:	ea 60 00 00 	b,l 24 <_start+0x14>,r19
      20:	d6 60 1c 1e 	depwi 0,31,2,r19
      24:	2a 60 00 00 	addil 0,r19,%r1
      28:	34 3a 00 00 	ldo 0(r1),r26
      2c:	2a 60 00 00 	addil 0,r19,%r1
      30:	48 34 00 00 	ldw 0(,r1),r20
      34:	0a 9a 04 14 	sub r26,r20,r20
      38:	0f 50 10 b3 	ldw,ma 8(,r26),r19
      3c:	86 66 20 12 	cmpib,=,n 3,r19,4c <_start+0x3c>
      40:	8e 60 3f ef 	cmpib,<>,n 0,r19,3c <_start+0x2c>
      44:	0f 50 10 b3 	ldw,ma 8(,r26),r19
      48:	04 00 00 00 	iitlbp r0,(sr0,r0)
      4c:	0f 59 10 93 	ldw -4(,r26),r19
      50:	0a 93 06 13 	add r19,r20,r19
      54:	e8 40 07 f0 	b,l 454 <_dl_start>,rp
      58:	37 1a 3f f9 	ldo -4(r24),r26

========><========

with gcc-3.5
------------
palx4000:/Develop/parisc-linux/build/glibc# objdump -d ./elf/rtld.os | more

./elf/rtld.os:     file format elf32-hppa-linux

Disassembly of section .text:

00000000 <_start>:
       0:	37 de 00 80 	ldo 40(sp),sp
       4:	6b d9 3f b1 	stw r25,-28(sp)
       8:	6b d8 3f a9 	stw r24,-2c(sp)
       c:	ea 60 00 00 	b,l 14 <_start+0x14>,r19
      10:	d6 60 1c 1e 	depwi 0,31,2,r19
      14:	2a 60 00 00 	addil 0,r19,%r1
      18:	34 3a 00 00 	ldo 0(r1),r26
      1c:	2a 60 00 00 	addil 0,r19,%r1
      20:	48 34 00 00 	ldw 0(r1),r20
      24:	0a 9a 04 14 	sub r26,r20,r20
      28:	0f 50 10 b3 	ldw,ma 8(,r26),r19
      2c:	86 66 20 12 	cmpib,=,n 3,r19,3c <_start+0x3c>
      30:	8e 60 3f ef 	cmpib,<>,n 0,r19,2c <_start+0x2c>
      34:	0f 50 10 b3 	ldw,ma 8(,r26),r19
      38:	04 00 00 00 	iitlbp r0,(sr0,r0)
      3c:	0f 59 10 93 	ldw -4(,r26),r19
      40:	0a 93 06 13 	add r19,r20,r19
      44:	e8 41 02 84 	b,l 318c <_dl_start>,rp
      48:	37 1a 3f f9 	ldo -4(r24),r26

Why ref to <set_dp> is removed by gcc-3.5?
Is there a new optimization in gcc which remove "defined but not used" in
resulting obj?

Should I log a pb near gcc team?

Thanks again,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
