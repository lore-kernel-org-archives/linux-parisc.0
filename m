Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.web.de (smtp02.web.de [217.72.192.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0893B4829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 Jan 2003 06:05:44 -0700 (MST)
Received: from c-180-204-119.n.dial.de.ignite.net ([62.180.204.119] helo=web.de)
	by smtp.web.de with asmtp (WEB.DE(Exim) 4.93 #1)
	id 18VtQI-0005Ui-00
	for parisc-linux@lists.parisc-linux.org; Tue, 07 Jan 2003 14:05:38 +0100
Message-ID: <3E1AD095.FA5CF165@web.de>
Date: Tue, 07 Jan 2003 14:05:25 +0100
From: "b.gunreben" <b.gunreben@web.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] Problem with weak symbols
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

I have a problem with weak symbols on parisc. If I use the following
small program, the result should be always (nil), but it isn=B4t:

> cat weak.c
#include <stdio.h>
#include <ctype.h>
 =

asm (".weak linux_bla");
asm (".weak linux_foo");
 =

extern const char * linux_bla;
extern const int linux_foo[];
 =

int
main ()
{
  printf("linux_bla: %p\n", &linux_bla);
  printf("linux_foo: %p\n", &linux_foo);
  return 0;
}

> ./weak
linux_bla: 0x205f0
linux_foo: (nil)

The main difference in compiling seems to be the different relocation
type for both symbols:

> readelf -r weak.o
 =

Relocation section '.rela.text' at offset 0x410 contains 10 entries:
  Offset    Info  Type            Symbol's Value  Symbol's Name         =

Addend
  00000010  00502 R_PARISC_DIR21L       00000000 =

=2ELC0                      + 0
  00000014  00506 R_PARISC_DIR14R       00000000 =

=2ELC0                      + 0
  00000018  00912 R_PARISC_DPREL21L     00000000 =

linux_bla                 + 0
  0000001c  00916 R_PARISC_DPREL14R     00000000 =

linux_bla                 + 0
  00000020  00c0c R_PARISC_PCREL17F     00000000 =

printf                    + 0
  00000028  00602 R_PARISC_DIR21L       00000010 =

=2ELC1                      + 0
  0000002c  00606 R_PARISC_DIR14R       00000010 =

=2ELC1                      + 0
  00000030  00a02 R_PARISC_DIR21L       00000000 =

linux_foo                 + 0
  00000034  00a06 R_PARISC_DIR14R       00000000 =

linux_foo                 + 0
  00000038  00c0c R_PARISC_PCREL17F     00000000 =

printf                    + 0

I am currently using gcc version 3.2.1, binutils version 2.13.90.0.16
20021126, glibc version 2.3.1, but I had this problem already with gcc
3.0.4 and all compilers inbetween. Is there a possibility to work around
this?


Berthold
