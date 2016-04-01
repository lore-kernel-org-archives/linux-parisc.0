From: Simone Mannori <simone.mannori@gmail.com>
Subject: Re: Kernel Panic on 4 cores hp c8000
Date: Fri, 1 Apr 2016 08:41:31 +0200
Message-ID: <CACrbsaACL9zoO1pt5KFCSzkWhPvddsK7CFwsM1yJNLA+OsGjfQ@mail.gmail.com>
References: <CACrbsaA0fw4KeKkcO5zZ50yMLsoysqJE6+ShfejCxDG9Zhns1Q@mail.gmail.com>
	<56FD5C30.4020409@gmx.de>
	<CACrbsaD4S7mPZcLT79FHU=fR+ecD6qaDyk1enHZ4zwG6y53MiA@mail.gmail.com>
	<56FD65FC.9030201@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <56FD65FC.9030201@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Success: successfull update and boot with new kernel (please see below
for the details)

Respect the instruction presents on:

https://parisc.wiki.kernel.org/index.php/Debian_Ports_Installation

I have only few observations:

- the "/etc/apt/sources.list" must contains ONLY one repository
reference, yours:

    deb http://ftp.debian-ports.org/debian unstable main

- after the "apt-get install debian-ports-archive-keyring" and the
"apt-get update" I was obliged to run

- "apt-get dist-upgrade" because the simple "apt-get upgrade" was not
sufficient.

For the newbie: login as normal user, then switch to "root" using the
"su" command.

Thanks a lot for your very helpful support. I will start to put the
details of this voyage on a wiki page as soon as possible (ASAP).

  Simone Mannori - Italy

//**---------------------------------------------------------------------------------------------------------

NEW KERNEL
simone@blsw:~$ uname -a
Linux blsw 4.4.0-1-parisc64-smp #1 SMP Debian 4.4.6-1 (2016-03-17) parisc64 GNU/
Linux

FOUR CORES ACTIVE
simone@blsw:~$ cat /proc/cpuinfo
processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8800 (Mako)
cpu MHz         : 1000.000000
capabilities    : os64 iopdir_fdc needs_equivalent_aliasing (0x35)
model           : 9000/785/C8000
model name      : Crestone Peak Fast?
hversion        : 0x000088b0
sversion        : 0x00000491
I-cache         : 32768 KB
D-cache         : 32768 KB (WB, direct mapped)
ITLB entries    : 240
DTLB entries    : 240 - shared with ITLB
bogomips        : 1988.60
software id     : 6267540911694045181

processor       : 1
cpu family      : PA-RISC 2.0
cpu             : PA8800 (Mako)
cpu MHz         : 1000.000000
capabilities    : os64 iopdir_fdc needs_equivalent_aliasing (0x35)
model           : 9000/785/C8000
model name      : Crestone Peak Fast?
hversion        : 0x000088b0
sversion        : 0x00000491
I-cache         : 32768 KB
D-cache         : 32768 KB (WB, direct mapped)
ITLB entries    : 240
DTLB entries    : 240 - shared with ITLB
bogomips        : 1988.60
software id     : 6267540911694045181

processor       : 2
cpu family      : PA-RISC 2.0
cpu             : PA8800 (Mako)
cpu MHz         : 1000.000000
capabilities    : os64 iopdir_fdc needs_equivalent_aliasing (0x35)
model           : 9000/785/C8000
model name      : Crestone Peak Fast?
hversion        : 0x000088b0
sversion        : 0x00000491
I-cache         : 32768 KB
D-cache         : 32768 KB (WB, direct mapped)
ITLB entries    : 240
DTLB entries    : 240 - shared with ITLB
bogomips        : 1988.60
software id     : 6267540911694045181

processor       : 3
cpu family      : PA-RISC 2.0
cpu             : PA8800 (Mako)
cpu MHz         : 1000.000000
capabilities    : os64 iopdir_fdc needs_equivalent_aliasing (0x35)
model           : 9000/785/C8000
model name      : Crestone Peak Fast?
hversion        : 0x000088b0
sversion        : 0x00000491
I-cache         : 32768 KB
D-cache         : 32768 KB (WB, direct mapped)
ITLB entries    : 240
DTLB entries    : 240 - shared with ITLB
bogomips        : 1988.60
software id     : 6267540911694045181

simone@blsw:~$
