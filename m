Return-Path: <epotter@eep.burdell.org>
Received: from keymaster (dsl027-162-176.atl1.dsl.speakeasy.net
	[216.27.162.176])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D8C748B2
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 18 Feb 2004 06:41:30 -0700 (MST)
Date: Wed, 18 Feb 2004 08:36:57 -0500 (EST)
From: Elliott Potter <epotter@eep.burdell.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb
In-Reply-To: <402A42A1000052A9@ocpmta1.freegates.net>
Message-ID: <Pine.GSO.4.44.0402180830260.14838-100000@keymaster>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	James Morrison <ja2morri@csclub.uwaterloo.ca>,
	Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, 18 Feb 2004, Joel Soete wrote:

> Carlos,
> [...]
> But now I need more to try to complete job because:
> make[2]: *** [/Develop/parisc-linux/build/glibc/sunrpc/xbootparam_prot.stmp]
>
> Segmentation fault
>
> And dmesg saying:
>
> do_page_fault() pid=6547 command='ld.so.1' type=15 address=0x0016b690
> vm_start = 0x00033000, vm_end = 0x00034000
>
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001000000111100001111 Not tainted
> r00-03  0000000000000000 000000004102b6fc 000000004100721f 00000000faf02040
> r04-07  000000004102b6fc 00000000400002b8 00000000faf02158 00000000faf01d8c
> r08-11  0000000040170000 0000000000170e60 000000004016fd98 00000000faf01dc0
> r12-15  0000000040171e60 0000000000000002 00000000faf02128 ffffffffffffffff
> r16-19  00000000faf02180 0000000000000003 0000000000000004 000000004102b6fc
> r20-23  000000004102bd80 0000000000000008 000000000016b690 0000000040000000
> r24-27  000000000016b690 0000000000001e60 0000000000000003 00000000000c97f0
> r28-31  0000000040001000 0000000000000000 00000000faf02180 0000000041013fc7
> sr0-3   0000000000003580 0000000000003580 0000000000000000 0000000000003580
> sr4-7   0000000000003580 0000000000003580 0000000000003580 0000000000003580
>
> IASQ: 0000000000003580 0000000000003580 IAOQ: 0000000041007293 0000000041007297
>  IIR: 0ec01095    ISR: 0000000000003580  IOR: 000000000016b690
>  CPU:        8   CR30: 000000003a038000 CR31: 00000000104a4000
>  ORIG_R28: 0000000040170000
>  IAOQ[0]: 0x41007293
>  IAOQ[1]: 0x41007297
>  RP(r2): 0x4100721f

Interesting -- I'm getting a similar crash in a program when it calls
getopt_long() -- this do_page_fault thing.  I'm wondering if the two are
somehow related because it's only this one program that crashes, and
only on the line where getopt_long() is called.  The output in dmesg:

do_page_fault() pid=30051 command='distmk' type=6 address=0x6bc23fdb
vm_start = 0x401ca000, vm_end = 0x401cb000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 4004ca40 4002c09f bff04040
r04-07  4004d240 000d6f60 bff001b0 bff0018c
r08-11  00000008 00000008 00000001 bff03748
r12-15  000d8470 000ce5c0 00000000 00000000
r16-19  00000000 000b2248 00000004 000007ec
r20-23  4004d238 80000000 6bc23fd9 00000000
r24-27  bff001b0 4004d714 4004cb40 000cfd40
r28-31  000d6762 7efefeff bff040c0 0009cc8b
sr0-3   00001491 00001491 00000000 00001491
sr4-7   00001491 00001491 00001491 00001491

IASQ: 00001491 00001491 IAOQ: 6bc23fdb 6bc23fdf
IIR: 43ffff80    ISR: 00001491  IOR: 401a1a38
CPU:        0   CR30: 4a360000 CR31: 103f0000
 ORIG_R28: 401ca000
 IAOQ[0]: 0x6bc23fdb
 IAOQ[1]: 0x6bc23fdf
 RP(r2): 0x4002c09f


Anyway just a data point.

This is with gcc-3.0.4 and gcc-3.2.3, with kernel 2.4.* and 2.6.2-pa3,
and glibc-2.2.5 (so ... old ...)
--
Elliott
