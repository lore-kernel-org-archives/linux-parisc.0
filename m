Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id D13674829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Oct 2002 01:28:42 -0600 (MDT)
Received: from iws1pb05.france.hp.com (unknown [15.124.72.14])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 9F7B9339A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Oct 2002 09:28:38 +0200 (METDST)
Message-ID: <3D9AA07A.4B994F44@hpfrcu81.france.hp.com>
Date: Wed, 02 Oct 2002 09:30:03 +0200
From: phi <phi@hpfrcu81.france.hp.com>
MIME-Version: 1.0
Cc: parisc-linux@lists.parisc-linux.org
References: <20021002034059.34434.qmail@web12505.mail.yahoo.com> <3D9A94D3.8010009@itp.bg>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] gcc and ++
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi,

Working on an endian neutral file reader, I bumped into sometihng strange with
gcc.

basically I got to read a 32 unsigned int from a file that is mmap'ed, I have
a unsigned char * that is supposed to be at the unsigned int addr but possibly
unaligned.

I have a macro defined like this, then allowing the unsigned int getter from
file to expression.

#define get_4(p) ( ((uint32)(*p++)<<24)| \
                   ((uint32)(*p++)<<16)| \
                   ((uint32)(*p++)<<8 )| \
                   ((uint32)(*p++)) )

It assume the given p is
unsigned char *p;
then produce an uint32 expression.

Now using this macro on hpux/hpc linux/i386 linux/hppa gives 3 different
result with the linux/hppa particularly wrong IMHO. I wonder if this funny
could endup in kernel bugs?

==============================================================
Here is my test prog, get2_4 is a workaround attempt...

typedef unsigned char uint8;
typedef unsigned int  uint32;

#define get_4(p) ( ((uint32)(*p++)<<24)| \
                   ((uint32)(*p++)<<16)| \
                   ((uint32)(*p++)<<8 )| \
                   ((uint32)(*p++)) )

#define get2_4(p) ( p+=4, ((uint32)(p[-4])<<24)| \
                          ((uint32)(p[-3])<<16)| \
                          ((uint32)(p[-2])<<8 )| \
                          ((uint32)(p[-1])) )
main()
{ uint32 i;
  uint8 *p;
  p="abcd"; printf("p=%#x ",p);
  i=get_4(p);
  printf("i=%#x p=%#x\n",i,p);
  p="abcd"; printf("p=%#x ",p);
  i=get2_4(p);
  printf("i=%#x p=%#x\n",i,p);
}

==============================================================
Results:

HPUX/HPC:
---------
$ ./c
p=0x40001028 i=0x61626364 p=0x4000102c
p=0x40001048 i=0x61626364 p=0x4000104c

In both case i is loaded with the integer "abcd" (as expected I would say) and
after the expression p is bumped by 4 that is for sure expected.
Note the bad const re-use, hpc use 2 different "abcd" one at 0x40001028 the
other at 0x40001048 (but that's not a problem, +Osomething would eventually
get it right)

LINUX/i386:
---------- 
(red-hat 6.2 then very old compiler, may be someone can try on a very last
gcc?)

$ ./c
p=0x8048500 i=0x61616161 p=0x8048504
p=0x8048500 i=0x61626364 p=0x8048504

Here get_4(p) don't compute the expression corectly IMHO, but yet purist will
claim that KnR sez that side effect expression can't rely on order of
evaluation (bad practice programing), yet I wonder how the parse tree look
like here.
So i is semi wrong/right and p is bumped by 4 after the expression that is
expected.

get2_4(p), got i computed correctly and p bumped by 4, this is the workaround
I would use for the time being.

LINUX/hppa:
-----------
GNU C version 3.0.2 (Debian)
hpfrcw12:/tmp# ./c
p=0x10734 i=0x61616161 p=0x10735
p=0x10734 i=0x61626364 p=0x10738

Here get_4(p) is plain dead, i isn't computed correctly but as before one can
argue it is ok, but the pointer bump is completly wrong, there are 4 ++, and
no matter how we order the expression, p must be bumped by 4 it is bumped by
1!!!

So beside the scholastic discusion about when ++ should occur, I fear a bug in
the compiler that may have ramification in our kernel?

What do you think?

=============================================================================

Challenge.

If someone can come with a better definition for get_4(p) i.e can force the ++
at correct place, I would grab, right now I use get2_4() that seems to be
portable.

Cheers,
Phi
