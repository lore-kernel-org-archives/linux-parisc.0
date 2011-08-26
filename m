From: "Rolf Eike Beer" <eike-kernel@sf-tec.de>
Subject: Re: Link error in CMake for HPPA1.1, wrong result for HPPA 2.0
Date: Fri, 26 Aug 2011 10:00:46 +0200
Message-ID: <b9feb64c39e0d12d4b6740ea0507f58a.squirrel@webmail.sf-mail.de>
References: <99a9e4b224dc9020d16d0a33fea6096f.squirrel@webmail.sf-mail.de>
    <4E5656E4.8000102@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: "linux-parisc" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4E5656E4.8000102@systemhalted.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On 8/25/2011 6:37 AM, Rolf Eike Beer wrote:
>> const&)]+0xbc): cannot reach
>> 00004abb__ZNSt8_Rb_treeIN5cmsys6StringESt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_S_rightEPSt18_Rb_tree_node_base+0,
>> recompile with -ffunction-sections
>
> So did you recompile with -ffunction-sections?
>
> The basic problem is that the linker was unable to insert a jump
> to the requested function because it was too far away. Some targets
> like hppa have short branch distances and we use intermediate stub
> tables to get around that. However, we can't insert stub tables just
> anywhere, they need to go between sections. Therefore you need to
> break up this object file.

If I add -ffunction-section then ccmake (and cmake and cpack) build fine,
but ctest fails:

Linking CXX executable ../bin/ctest
/usr/lib/gcc/hppa2.0-unknown-linux-gnu/4.5.3/../../../../hppa2.0-unknown-linux-gnu/bin/ld:
libCMakeLib.a(cmMakefile.cxx.o)(.text._ZN10cmMakefile14AddSourceGroupEPKcS1_+0x40):
cannot reach 00008647__ZNSaIcEC1Ev@@GLIBCXX_3.4+0, recompile with
-ffunction-sections
/usr/lib/gcc/hppa2.0-unknown-linux-gnu/4.5.3/../../../../hppa2.0-unknown-linux-gnu/bin/ld:
libCMakeLib.a(cmMakefile.cxx.o)(.text._ZN10cmMakefile14AddSourceGroupEPKcS1_+0x40):
cannot handle R_PARISC_PCREL17F for
std::allocator<char>::allocator()@@GLIBCXX_3.4
/usr/lib/gcc/hppa2.0-unknown-linux-gnu/4.5.3/../../../../hppa2.0-unknown-linux-gnu/bin/ld:
final link failed: Bad value
collect2: ld returned 1 exit status

This is the same static library that causes problems, but this time on a
different executable. So I think John is right and there is really a bug
somewhere.

Just for reference, this are the sizes of the binaries that I currently
have on my system:

-rwxr-xr-x 1 root root 3080228 Apr 26 12:51 /usr/bin/ccmake
-rwxr-xr-x 1 root root 3050408 Apr 26 12:51 /usr/bin/cmake
-rwxr-xr-x 1 root root 4092940 Apr 26 12:51 /usr/bin/ctest

And this is what happens with -ffunction-sections for those that compile:

-rwxr-xr-x 1 buildbot buildbot  9738726 Aug 26 09:15 ccmake
-rwxr-xr-x 1 buildbot buildbot  9608066 Aug 26 09:16 cmake
-rwxr-xr-x 1 buildbot buildbot 10302152 Aug 26 09:16 cpack

I have no idea how big the current results would get as every of the 4
possible candidates fails to link. libCMakeLib.a is 21149998 bytes.

Eike
