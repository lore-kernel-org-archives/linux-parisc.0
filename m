From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Re: [LTP] [PATCH] shmt02-shmt10 tests on PARISC/hppa
Date: Thu, 15 Mar 2007 21:47:07 +0100
Message-ID: <200703152147.08100.deller__32206.9413531155$1416624327$gmane$org@gmx.de>
References: <200612202344.08356.deller@gmx.de>
	<200703131628.04648.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: ltp-list@lists.sourceforge.net,
 parisc-linux@lists.parisc-linux.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200703131628.04648.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Mike,

On Tuesday 13 March 2007, Mike Frysinger wrote:
> can i assume your other e-mail included everything needed to resolve this ?

yes, and thanks a lot for applying them !

I've updated to latest CVS version of LTP, and now the PARISC Linux port finally survives all tests beside one:
  getcontext01    1  FAIL  :  getcontext - Sanity test :  Fail errno=251 : Function not implemented
That's correct, since we don't have the getcontext() call in glibc yet....

Thanks again,
Helge

-------------------
Summary:

/etc/issue:
Debian GNU/Linux 4.0 \n \l

Linux c3000 2.6.20 #341 Wed Mar 7 22:23:17 CET 2007 parisc GNU/Linux

Gnu C                  gcc (GCC) 4.1.2 20061115 (prerelease) (Debian 4.1.1-21)
Gnu make               3.81
util-linux             2.12r
mount                  2.12r
modutils               3.3-pre2
e2fsprogs              1.40-WIP
Linux C Library        2.3.6
Dynamic linker (ldd)   2.3.6
Linux C++ Library      5..
Procps                 3.2.7
Net-tools              1.60
Console-tools          0.2.3
Sh-utils               5.97
Modules Loaded

free reports:
             total       used       free     shared    buffers     cached
Mem:       2069792     108588    1961204          0      20292      46744
-/+ buffers/cache:      41552    2028240
Swap:      2216928          0    2216928

/proc/cpuinfo
processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8700 (PCX-W2)
cpu MHz         : 750.000000
model           : 9000/785/C3700
model name      : Allegro W2
hversion        : 0x00005dc0
sversion        : 0x00000481
I-cache         : 768 KB
D-cache         : 1536 KB (WB, direct mapped)
ITLB entries    : 240
DTLB entries    : 240 - shared with ITLB
BTLB            : not supported
bogomips        : 1495.04
software id     : 2004631172

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
