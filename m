Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from student.cs.ucc.ie (student.cs.ucc.ie [143.239.211.125])
	by dsl2.external.hp.com (Postfix) with ESMTP id 79E84482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Nov 2001 07:10:18 -0700 (MST)
Received: from localhost (xam@localhost)
	by student.cs.ucc.ie (8.9.3/8.9.3) with SMTP id OAA22119
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Nov 2001 14:08:56 GMT
Date: Thu, 15 Nov 2001 14:08:46 +0000 (GMT)
From: Markus Grabert <xam@student.cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.OSF.3.96.1011115140754.20078A-100000@student.cs.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Linux/PA-RISC speed (was Re: C240 Graphics, 64bit kernel and more)
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

Jurriaan Kalkman wrote:


>>Are you aware of any other gcc/binutils bugs or should
>>gcc/binutils NOW create proper executables for pa2.0 and
>>pa1.1 (including the old CPUs like 730's PCX-S CPU) ?
>>
> 
> There are still bugs.


But Grand Grundler wrote:

| Yes - should work fine. Note one can build 32-bit PA2.0 binaries.
| The scheduling and insns are optimized for PA2.0 CPU but will
| run in "narrow" mode.

Mhh who's right ? I tend to believe Grand.

Of course there are bugs in binutils/gcc. But are there KNOW bugs/issues
a software developer (not a kernel freak) has to be aware of ?
What about glibc ?
Are threads fully supported ? Are gcc's ObjC, Java and C++ compilers
also working ?


>>I can imagine that the Linux/HPPA kernel is not very optimized yet
>>(can't compare the speed on my 730 with HP/UX since I don't
>>have the OS software anymore ...). Is the speed difference just a
>>few percent or can you 'feel' it (mhh, fuzzy question) ?
>>
>>
> I can only say that compiling a kernel on my C200 takes about 2 times
> as long as on my alpha (21164, 500 Mhz, 2 Mb cache). I feel it should
> be faster.


That's odd.
A 21164/500MHz (not 21164A or 21164PC) is slower according to
Spec_INT95, Spec_FP95 and the Spec_base(INT|FP)95 variants.

Indeed the benchmarks say that the Alpha is about 50% slower for FP stuff

and just a little bit slower for INT stuff (compared to a C240 HP/UX).

Moreover, according to SPEC:
If you compare it to a Intel CPU, the PA8200/236Mhz seem to be as fast as
a Pentium II 400-450 for integer operations and as fast as a
Pentium III 750-800 for floating point operations.

Well, lies, bigger lies/statistics and benchmarks.
Don't trust them.
Nevertheless a factor of 2 shouldn't occur. It's a too big number.
Is it just for compiling the kernel or for every application ?

greetings Max


> Good luck,
> Jurriaan
