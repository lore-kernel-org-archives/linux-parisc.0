From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Re: glibc nptl failure baseline update.
Date: Wed, 07 Feb 2007 21:56:02 +0100
Message-ID: <eqded2$gc$1__39690.8144969077$1416624636$gmane$org@sea.gmane.org>
References: <119aab440702051913m1edfb6ecg535c80d2301c9c11@mail.gmail.com>
	<20070206122329.GA13101@parisc-linux.org>
	<119aab440702061359w376b611fm7d47d9ca7e0a9a8a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-glibc@lists.debian.org
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Carlos O'Donell wrote:

> On 2/6/07, Matthew Wilcox <matthew@wil.cx> wrote:
>> On Mon, Feb 05, 2007 at 10:13:01PM -0500, Carlos O'Donell wrote:
>> > make[2]: *** [/libc-tls-nptl/io/tst-fstatat.out] Error 1
>> > make[2]: *** [/libc-tls-nptl/io/tst-futimesat.out] Error 1
>> > make[2]: *** [/libc-tls-nptl/io/tst-renameat.out] Error 1
>> > make[2]: *** [/libc-tls-nptl/io/tst-fchmodat.out] Error 1
>> > make[2]: *** [/libc-tls-nptl/io/tst-symlinkat.out] Error 1
>> > make[2]: *** [/libc-tls-nptl/io/tst-linkat.out] Error 1
>> > make[2]: *** [/libc-tls-nptl/io/tst-mkdirat.out] Error 1
>> > make[2]: *** [/libc-tls-nptl/io/tst-mkfifoat.out] Error 1
>>
>> I guess we need to hook up the *at syscalls.
> 
> Helge hooked them up already? This build uses an old header set and
> doesn't detect the *at functions. The fallbacks have likely never been
> tested, and as always... are rotten and don't work properly.

TIF_RESTORE_SIGMASK support ?
I think the honour goes to Kyle:
http://git.parisc-linux.org/?p=linux-2.6.git;a=commitdiff;h=eeb14f5d284eacfa939153302dadfb7dc134ff9e;hp=dc914919be25ee5e98df90558c591d76d4b231d4

Helge

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
