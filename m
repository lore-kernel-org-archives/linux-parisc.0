Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id E8A7B482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Jun 2002 09:46:19 -0600 (MDT)
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] kdb_v21 branch updated to -pa26, and kallsyms cross-compile
Message-ID: <1023378071.3cff8297db5f6@webmail.tiscalinet.be>
Date: Thu, 06 Jun 2002 17:41:11 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
References: <20020529132631.B3691@systemhalted> <20020529180739.GL9919@tykepenguin.com> <20020530143626.GF810@tykepenguin.com> <20020530133515.B15631@systemhalted> <20020531072849.GD1145@tykepenguin.com> <20020531085419.B18658@systemhalted> <20020604115547.GB1808@tykepenguin.com> <20020604084440.A24973@systemhalted> <20020604154954.GA29187@tausq.org> <1023292640.3cfe34e07e65b@webmail.tiscalinet.be> <20020605145928.I29135@systemhalted>
In-Reply-To: <20020605145928.I29135@systemhalted>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Hi Carlos,

Quoting "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>:

> > 
> > Well I come back to you to see what should be the useable kdb config
> (to
> > investigate the network problem with kernel compiled with gcc-3.1 or
> -3.2).
> > 
> > Mine is now:
> > CONFIG_MAGIC_SYSRQ=Y
> > CONFIG_KDB=Y
> > CONFIG_KDB_MODULES=Y
> > # CONFIG_KDB_OFF IS NOT SET
> > CONFIG_KALLSYMS=Y
> > 
> > Thanks a lot,
> >     Joel
> >
> 
> Does you system boot with kdb enabled?

Now I had a kdb kernel (cvs branch KDB_21) compile with gcc-3.2 and also #define
EARLY_BOOTUP_DEBUG 1. But this kernel hang on:
...
Search for devices...

And the green diode on the ide-cdrom of my b2000 stay on continuously.


Joel.

Here is the full output:
Command line for kernel: 'root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102
palo_kernel=3/vmlinux-kdb-gcc32'
Selected kernel: /vmlinux-kdb-gcc32 from partition 3
ELF32 executable
Entry 00100000 first 00100000 n 5
Segment 0 load 00100000 size 1989640 mediaptr 0x1000
Segment 1 load 002e6000 size 767080 mediaptr 0x1e7000
Segment 2 load 003a4000 size 396036 mediaptr 0x2a3000
Segment 3 load 00408000 size 8192 mediaptr 0x304000
Segment 4 load 00410000 size 32768 mediaptr 0x306000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.4.18-pa26 (root@palx2000) (gcc version 3.2 20020530
(experimental)) #1 Thu Jun 6 16:50:34 CEST 2002
FP[0] enabled: Rev 1 Model 16
The 32-bit Kernel has started...
unwind_init: start = 0x10387405, end = 0x103a1468, entries = 6662

Stack: 10408600 Cannot find unwind entry for 0x1010c9c0

Call Trace: 
        [<1010c880>]
Cannot find unwind entry for 0x1010c9c0

Code: 0e a0 10 93 4b d6 3f 91 0a 78 0a 13 6b 53 00 20 0a b6 04 14 
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005d00 00000481 00000000 00000002 77e93910 100000f0 00000008 000000b2
000000b2
vers  00000301
CPUID vers 17 rev 11 (0x0000022b)
capabilities 0x3
model 9000/785/B2000
Total Memory: 256 Mb
pagetable_init
On node 0 totalpages: 65536
zone(0): 65536 pages.
zone(1): 0 pages.
zone(2): 0 pages.
LCD display at f05d0008,f05d0000 registered
Kernel command line: root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102
palo_kernel=3/vmlinux-kdb-gcc32
Console: colour dummy device 160x64
Initialized PDC Console for debugging.
Calibrating delay loop... 799.53 BogoMIPS
Memory: 254520k available
kdb version 2.1 by Scott Lurndal, Keith Owens. Copyright SGI, All Rights Reserved
Dentry-cache hash table entries: 32768 (order: 6, 262144 bytes)
Inode-cache hash table entries: 16384 (order: 5, 131072 bytes)
Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
Buffer-cache hash table entries: 16384 (order: 4, 65536 bytes)
Page-cache hash table entries: 65536 (order: 6, 262144 bytes)
Searching for devices...



-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
