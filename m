Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from phnxpop4.phnx.uswest.net (phnxpop4.phnx.uswest.net [206.80.192.4])
	by dsl2.external.hp.com (Postfix) with SMTP id 707F94A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Mar 2001 23:34:43 -0700 (MST)
Date: Wed, 21 Mar 2001 23:32:19 -0700
From: Randolph Chung <randolph@tausq.org>
To: alan@linuxcare.com.au
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] new g++ debs and oddities...
Message-ID: <20010321233219.B6912@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20010321213541.A6912@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010321213541.A6912@tausq.org>; from randolph@tausq.org on Wed, Mar 21, 2001 at 09:35:41PM -0700
List-ID: <linux-parisc.vger.kernel.org>

In reference to a message from Randolph Chung, dated Mar 21:
> So I've been playing with taggart's new g++ debs. definitely work a lot
> better than the old ones, but still seeing some weird behavior:
> 
> 1. i'm compiling apt, and got a problem with undefined symbols for
> things like Hashes::Add(). Now, Hashes::Add is an inline method defined
> in hashes.h .... moving that to a non-inlined method in the .cc resolves
> the undefined symbol problem... seems like a compiler bug?
> 
> I'm compiling with -g -O0 -DHAVE_CONFIG_H -D_REENTRANT -fno-rtti -fpermissive

compiling with -O1 or -O2 fixes this....

> 2. I'm getting a lot of warnings like this that weren't there with 2.97.
> Not sure what the deal is yet:
> 
> /home/randolph/cvs/apt/build/include/apt-pkg/configuration.h: In member
>    function `int Configuration::FindI(std::basic_string<char,
>    std::char_traits<char>, std::allocator<char> >, bool) const':
>    /home/randolph/cvs/apt/build/include/apt-pkg/configuration.h:75: warning: choosing 
>    `int Configuration::FindI(const char*, int) const' over `int
>    Configuration::FindI(std::basic_string<char, std::char_traits<char>, 
>    std::allocator<char> >, bool) const'
> /home/randolph/cvs/apt/build/include/apt-pkg/configuration.h:75: warning:
>    because worst conversion for the former is better than worst conversion for
>    the latter

compiling with -O1 or -O2 eliminates these warnings as well... 

after lots of changes i got apt to compile with the new compilers,
however, the binaries segfault immediately on startup. i'm not sure
what's happening yet. they are dying in _start-0x??? (when i matched IAOQ
against objdump output).... looks like some kind of jump table?

000025d0 <_start-0x360>:
    25d0:       2b 60 00 00     addil 0,dp,%r1
    25d4:       48 35 0f 00     ldw 780(sr0,r1),r21
    25d8:       ea a0 c0 00     bv r0(r21)
    [...]
    288c:       48 33 0b a8     ldw 5d4(sr0,r1),r19
    2890:       2b 60 00 00     addil 0,dp,%r1
    2894:       48 35 0e 90     ldw 748(sr0,r1),r21       <--- segfaulting here
    2898:       ea a0 c0 00     bv r0(r21)

other C++ apps seem to work fine -- i've tried a simple "hello world" and the
more complex bonnie++ so far... i wonder if it matters that apt links in
c++ libraries of its own? of course, apt also uses a lot more c++
features like templates and such.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
