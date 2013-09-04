From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Does there exists any 32bit-only PARISC SMP machines?
Date: Wed, 04 Sep 2013 11:41:03 -0400
Message-ID: <5227548F.5090909@bell.net>
References: <521F9848.4010404@gmx.de> <1377830541.2331.5.camel@dabdike> <20130903155643.GA1430@glitch> <trinity-b7a0d82a-16b9-4204-be6e-2873db548248-1378282389073@3capp-gmx-bs28> <20130904140705.GA30223@glitch> <20130904142847.GA2893@glitch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130904142847.GA2893@glitch>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 9/4/2013 10:28 AM, Domenico Andreoli wrote:
> BTW, this is the most detailed investigation I'm aware of:
>
> https://lkml.org/lkml/2008/4/20/251
I have the sense that MEM_RENDEZ_HI may not be set correctly for your 
machine:

         /* Set the smp rendezvous address into page zero.
         ** It would be safer to do this in init_smp_config() but
         ** it's just way easier to deal with here because
         ** of 64-bit function ptrs and the address is local to this file.
         */
         load32          PA(smp_slave_stext),%r10
         stw             %r10,0x10(%r0)  /* MEM_RENDEZ */
         stw             %r0,0x28(%r0)   /* MEM_RENDEZ_HI - assume addr 
< 4GB */

This is possibly due to a change in memory range detection:

--- dmesg.txt 2008-04-21 11:19:16.000000000 +0200
+++ dmesg2.txt 2008-04-21 15:27:46.000000000 +0200
@@ -1,6 +1,7 @@
-Linux version 2.6.22-3-parisc64-smp (Debian 2.6.22-6) (maks@debian.org) 
(gcc version 4.1.3 20071019 (prerelease) (Debian 4.1.2-17)) #2 SMP Mon 
Nov 12 21:04:20 CET 2007
+Linux version 2.6.25 (cavok@ska) (gcc version 4.1.3 20080308 
(prerelease) (Debian 4.1.2-21)) #8 SMP Mon Apr 21 12:25:50 CES8
FP[0] enabled: Rev 1 Model 16
The 64-bit Kernel has started...
+console [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005d10 00000491 00000000 00000002 77b406fc 100000f0 00000008 
000000b2 000000b2
@@ -8,41 +9,28 @@
CPUID vers 17 rev 10 (0x0000022a)
capabilities 0x3
model 9000/785/J5600
-Memory Ranges:
- 0) Start 0x0000000000000000 End 0x00000000efffffff Size 3840 MB
- 1) Start 0x00000010f0000000 End 0x00000010ffffffff Size 256 MB
-Total Memory: 4096 MB
-initrd: 7fa75000-7ffee77e
-initrd: reserving 3fa75000-3ffee77e (mem_max 100000000)
-On node 0 totalpages: 983040
- Normal zone: 13440 pages used for memmap
- Normal zone: 0 pages reserved
- Normal zone: 969600 pages, LIFO batch:31
-On node 1 totalpages: 65536
- Normal zone: 896 pages used for memmap
- Normal zone: 0 pages reserved
- Normal zone: 64640 pages, LIFO batch:15
+Total Memory: 3840 MB

Dave

-- 
John David Anglin    dave.anglin@bell.net

