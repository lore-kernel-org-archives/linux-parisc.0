Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <20011225090742.8E013482B@dsl2.external.hp.com>
Date: Tue, 25 Dec 2001 02:07:42 -0700 (MST)
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] 2.4.16-pa24 crashes on c3k
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

Hi all,
I can't boot 2.4.16-pa24 on my c3k.
2.4.16-pa20 was working fine.
I'll put the defective .config, vmlinux, System.map on
ftp://gsyprf10.external.hp.com/pub/c3000/2.4.16-pa24-crash.tgz

I'm using serial console. But I can't capture output on my OB500 laptop.
It doesn't want to talk to the serial port - no input or output. 
I'm not understanding why since the same settings/cable work with
the OB600 (much older machine).  I'll try to get a full dump available
in the next couple of days one way or another. Maybe try yet another laptop.

Last couple of lines before stack trace are:

...
SuperIO: Found NS87560 Legacy I/O device at 00:0e.1 (IRQ 64)
SuperIO: Serial port 1 at 0x3f8
SuperIO: Serial port 2 at 0x2f8
SuperIO: Parallel port at 0x378
SuperIO: Floppy controller at 0x3f0
WARNING! Stack pointer and cr30 do not correspond

Dumping Stack from 12298000 to 1229c740:
...
[ does not look like a valid stack trace - data patterns don't look
like what I've seen before and too long ]

Kernel Fault: Code=26 regs=1229c740 (Addr=00000074)

GR02: 1010d51c
GR30: 1229c740
IOAQ: 1010e798
IIR 4b5300e8
CR30: 1229c000 CR31: 10318000
ORIG_R28: 10326dbf

grant
