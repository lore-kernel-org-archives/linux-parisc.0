From: "Rolf Eike Beer" <eike@sf-mail.de>
Subject: Link error in CMake for HPPA1.1, wrong result for HPPA 2.0
Date: Thu, 25 Aug 2011 12:37:31 +0200
Message-ID: <99a9e4b224dc9020d16d0a33fea6096f.squirrel@webmail.sf-mail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: "linux-parisc" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

First something to the machine: C3600 running Gentoo.

Kernel: 2.6.38.4
Glibc: 2.12.2
Binutils: 2.21.1
Gcc: 4.5.3

I tried to compile CMake, branch next, revision
60b6b190cb569a18b6cf415d85ff59fa120a1035. The exact version isn't really
important as I remember that problem for quite a while, it's just for
reference.

I have a working version of CMake 2.8.4 installed, no idea with which
compiler that was built (I updated gcc every now and then as they became
stable on Gentoo). Binutils used to build that CMake was very likely
2.20.1.

If I just use "cmake /path/to/cmake/source/ && make" I get this result:

Linking CXX executable ../bin/ccmake
/usr/lib/gcc/hppa2.0-unknown-linux-gnu/4.5.3/../../../../hppa2.0-unknown-linux-gnu/bin/ld:
libCMakeLib.a(cmGlobalGenerator.cxx.o)(.text._ZNSt8_Rb_treeIN5cmsys6StringESt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE16_M_insert_uniqueERKS4_[std::_Rb_tree<cmsys::String,
std::pair<cmsys::String const, int>,
std::_Select1st<std::pair<cmsys::String const, int> >,
std::less<cmsys::String>, std::allocator<std::pair<cmsys::String const,
int> > >::_M_insert_unique(std::pair<cmsys::String const, int>
const&)]+0xbc): cannot reach
00004abb__ZNSt8_Rb_treeIN5cmsys6StringESt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_S_rightEPSt18_Rb_tree_node_base+0,
recompile with -ffunction-sections
/usr/lib/gcc/hppa2.0-unknown-linux-gnu/4.5.3/../../../../hppa2.0-unknown-linux-gnu/bin/ld:
libCMakeLib.a(cmGlobalGenerator.cxx.o)(.text._ZNSt8_Rb_treeIN5cmsys6StringESt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE16_M_insert_uniqueERKS4_[std::_Rb_tree<cmsys::String,
std::pair<cmsys::String const, int>,
std::_Select1st<std::pair<cmsys::String const, int> >,
std::less<cmsys::String>, std::allocator<std::pair<cmsys::String const,
int> > >::_M_insert_unique(std::pair<cmsys::String const, int>
const&)]+0xbc): cannot handle R_PARISC_PCREL17F for
std::_Rb_tree<cmsys::String, std::pair<cmsys::String const, int>,
std::_Select1st<std::pair<cmsys::String const, int> >,
std::less<cmsys::String>, std::allocator<std::pair<cmsys::String const,
int> > >::_S_right(std::_Rb_tree_node_base*)
/usr/lib/gcc/hppa2.0-unknown-linux-gnu/4.5.3/../../../../hppa2.0-unknown-linux-gnu/bin/ld:
final link failed: Bad value
collect2: ld returned 1 exit status

If I hack the master CMakeLists.txt to contain
"ADD_DEFINITIONS(-march=2.0)" at the very beginning everything compiles
fine. But if I run the compiled cmake it will hang in an endless loop
somewhere. It does not do any system calls then, but it eats up 100% CPU.

I very much doubt that this is a CMake breakage as CMake has many nightly
builds and tests on different platforms that work and I see this bug since
a while (likely months).

Can someone have a look or give some hints?

Eike
