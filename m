Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpzilla2.xs4all.nl (smtpzilla2.xs4all.nl [194.109.127.138])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2CA71482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Nov 2001 23:38:10 -0700 (MST)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtpzilla2.xs4all.nl (8.12.0/8.12.0) with ESMTP id fAG6c7W7060464
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Nov 2001 07:38:07 +0100 (CET)
Date: Fri, 16 Nov 2001 07:34:18 +0100
From: Jurriaan on Alpha <thunder7@xs4all.nl>
To: Markus Grabert <xam@student.cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Linux/PA-RISC speed (was Re: C240 Graphics, 64bit kernel and more)
Message-ID: <20011116073418.A15527@alpha.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <Pine.OSF.3.96.1011115140754.20078A-100000@student.cs.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.OSF.3.96.1011115140754.20078A-100000@student.cs.ucc.ie>
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

On Thu, Nov 15, 2001 at 02:08:46PM +0000, Markus Grabert wrote:
> Jurriaan Kalkman wrote:
> 
>> I can only say that compiling a kernel on my C200 takes about 2 times
>> as long as on my alpha (21164, 500 Mhz, 2 Mb cache). I feel it should
>> be faster.
> 
> That's odd.
> A 21164/500MHz (not 21164A or 21164PC) is slower according to
> Spec_INT95, Spec_FP95 and the Spec_base(INT|FP)95 variants.

Well, it actually is a 21164A I guess:

cpu model		: EV56
cpu variation		: 7
cpu revision		: 0
system type		: Miata
cycle frequency [Hz]	: 499784372 est.
timer frequency [Hz]	: 1024.00
page size [bytes]	: 8192
phys. address bits	: 40
max. addr. space #	: 127
BogoMIPS		: 988.76
kernel unaligned acc	: 1 (pc=fffffffc0040f064,va=fffffc8900008027)
user unaligned acc	: 0 (pc=0,va=0)
platform string		: Digital Personal WorkStation 500au
cpus detected		: 1

> 
> Indeed the benchmarks say that the Alpha is about 50% slower for FP stuff
> 
> and just a little bit slower for INT stuff (compared to a C240 HP/UX).
> 
> Moreover, according to SPEC:
> If you compare it to a Intel CPU, the PA8200/236Mhz seem to be as fast as
> a Pentium II 400-450 for integer operations and as fast as a
> Pentium III 750-800 for floating point operations.
> 
> Well, lies, bigger lies/statistics and benchmarks.
> Don't trust them.
> Nevertheless a factor of 2 shouldn't occur. It's a too big number.
> Is it just for compiling the kernel or for every application ?
> 
I'm most interested in the speed of compiling, since that what I do most :-)
Having just downloaded the angband-2.9.4-alpha.tar.gz file, I ran this
test in a fresh angband-2.9.4-alpha directory:

#!/bin/sh
# prep the cache
find . -type f -exec cat {} > /dev/null ';'
./configure > /dev/null
time sh -c "make > /dev/null"
make distclean > /dev/null

Both tests were run on systems with 512 Mb memory, the C200+ has a
Quantum UW-SCSI harddisk, the Alpha an IBM UW-SCSI harddisk, but Bonnie
shows them to be almost the same speed. I especially compiled and installed
gcc-3.0.2 20010924 on the Alpha to get as close as possible in compiler
versions, but the Alpha got even faster...

Alpha (gcc-2.95.4)        : real 5m45 user 5m13 system  9s
Alpha (gcc-3.0.2 20010924): real 4m36 user 4m12 system 10s
C200+ (gcc-3.0.2 20010922): real 8m23 user 7m48 system 33s
dual P3/700 (gcc-2.95.4)  : real 1m20 user 1m17 system  3s

and I'd like to note that I was reading mail, news and ssh'ing to the
C200+ from the alpha at the same time, the C200+ wasn't doing anything
else. Angband-2.9.4 is a set of c-sources of some 175000 lines.

The results are shocking; the C200+ is twice as slow, and uses 3 times as
much system time. The angband-2.9.4-alpha sources live at
ftp://clockwork.dementia.org/angband/Source/angband-2.9.4-alpha.tar.gz
if anyone feels like repeating this experiment.

Good luck,
Jurriaan
-- 
I expect Woman will be the last thing civilized by Man.
        George Meredith
GNU/Linux 2.4.15-pre4 on Debian/Alpha 64-bits 988 bogomips load:1.05 1.01 0.77
