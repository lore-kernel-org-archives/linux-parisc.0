Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 931274845
	for <parisc-linux@lists.parisc-linux.org>; Wed,  1 Oct 2003 00:48:55 -0600 (MDT)
Date: Wed, 1 Oct 2003 08:48:27 +0200
Message-ID: <3F5CC41F0000B5FA@ocpmta3.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] N Class SMP pb ?  (follow up)
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>>
>> In summary:
>> -------  Processor 1 HPMC Information - PDC Version: 41.28  ------
>
>Did you TOC the machine or did it HPMC?
>I was under the impression the SW had hung and one needed to TOC
>to regain control. TOC info is seperate from HPM
 info.

Exact, but TOC info only contains 0 so I suposed that system do actualy
a HPMC but do not seems to be managed by handle_interruption() as at its
begining I put a printk() which was suposed to write the 'code' value?

to be more accurate:

[...]
    struct siginfo si;

    printk(KERN_ERR "%s(%d, ...).\n", __FUNCTION__, code);
    mdelay(100);
[...]

which allowing me to read a lot of 6, 15, 26 codes but never 1?

>
>If it's in fact HPMC, then look at IOAQ/GR02 for both CPUs
>and see which functions they were executing in when HPMC occurred.

which were for cpu[1]:
GR[02] == rp = 000000001014dbf0

Func: zap_page_range, Off: 0xe0, Addr: 0x1014dbf0

    1014dbf0:  08 0e 02 5b   copy r14,dp
    1014dbf4:  03 c0 08 b4   mfctl tr6,r20
    1014dbf8:  4a 93 00 b0   ldw 58(r20),r19
    1014dbfc:  29 c5 20 00   addil b000,r14,%r1

[...]
Parse IAOQ = 0x000000001014dea0 for CPU[1]

Func: zap_page_range, Off: 0x390, Addr: 0x1014dea0

    1014dea0:  06 a0 52 00   pdtlb
r0(sr1,r21)
    1014dea4:  37 39 3f ff   ldo -1(r25),r25
    1014dea8:  bf 33 3f e5   cmpb,*<> r19,r25,1014dea0 <zap_page_range+0x390>
    1014deac:  36 b5 20 00   ldo 1000(r21),r21

And for cpu[3]:
GR[02] == rp = 000000001010cdd0

Func: handle
interruption, Off: 0xb0, Addr: 0x1010cdd0

    1010cdd0:  08 05 02 5b   copy r5,dp
    1010cdd4:  02 00 08 b4   mfctl itmr,r20
    1010cdd8:  02 00 08 b3   mfctl itmr,r19
    1010cddc:  0a 93 04 33   sub r19,r20,r19
  ...

Parse IAOQ = 0x000000
01010cde4 for CPU[3]

Func: handle_interruption, Off: 0xc4, Addr: 0x1010cde4

    1010cde0:  be 7c bf e5   cmpb,*>> ret0,r19,1010cdd8 <handle_interruption+0xb8>
    1010cde4:  08 00 02 40   nop
    1010cde8:  34 63 3f ff   ldo -1(r3),r3
    1010
dec:  ec 7f bf c5   cmpib,*<> -1,r3,1010cdd4 <handle_interruption+0xb4>


Am i wrong if I presume that the nop isn would be harmless on cpu[3] OTC
'pdtlb r0(sr1,r21)' ?  But I do not read any code 10 printout by printk()
anyway it is the only exception: Privileged operation trap.

Thanks again,
    Joel




-------------------------------------------------------------------------
L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro
pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr 
