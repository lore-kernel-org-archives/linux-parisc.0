Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from imailg1.svr.pol.co.uk (imailg1.svr.pol.co.uk [195.92.195.179])
	by dsl2.external.hp.com (Postfix) with ESMTP id C22A9482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Sep 2002 17:35:07 -0600 (MDT)
Received: from modem-115.engineer-fish.dialup.pol.co.uk ([62.137.7.115] helo=there)
	by imailg1.svr.pol.co.uk with smtp (Exim 3.35 #1)
	id 17oY3b-0004rg-00
	for parisc-linux@lists.parisc-linux.org; Tue, 10 Sep 2002 00:35:05 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Will Newton <will@misconception.org.uk>
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 10 Sep 2002 00:36:17 +0100
MIME-Version: 1.0
Message-Id: <E17oY3b-0004rg-00.2002-09-10-00-35-05@imailg1.svr.pol.co.uk>
Subject: [parisc-linux] C++ crash on hppa
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

(This is a repost of a message to debian-hppa, sorry if I hit anyone with it 
twice.)

I have a package that works perfectly on i386 but crashes on hppa. The code
is not anything that would be directly affected by the underlying hardware -
it makes no assumptions based on endianess or word size - and the crash
occurs because of a free of a null pointer inside the STL. I have attached
the backtrace. I'm really quite stumped by this one, so any help would be
greatly appreciated.

(Maybe something to do with static init order in dynamic libs?)

(gdb) bt
#0  0x4071210c in __libc_free (mem=0x0) at malloc.c:3142
#1  0x0002e95c in std::__malloc_alloc_template<0>::deallocate(void*,
 unsigned) ()
#2  0x0002de54 in std::__default_alloc_template<true, 0>::deallocate(void*,
unsigned) ()
#3  0x0002cd40 in std::allocator<char>::deallocate(char*, unsigned) ()
#4  0x0002aa20 in std::string::_Rep::_M_destroy(std::allocator<char> const&)
()
#5  0x00028230 in std::string::_Rep::_M_dispose(std::allocator<char> const&)
()
#6  0x00028a58 in std::string::assign(std::string const&) ()
#7  0x4019e93c in Aqsis::CqOptions::InitialiseDefaultOptions() (
    this=0x402c2a9c) at /usr/include/c++/3.2/bits/basic_string.h:338
#8  0x4019d9dc in CqOptions (this=0x402c2a9c) at options.cpp:193
#9  0x401e81c0 in __static_initialization_and_destruction_0
 (__initialize_p=1, __priority=65535) at renderer.cpp:50
#10 0x402061ec in _GLOBAL__I__ZN5Aqsis13pCurrRendererE ()
    at /usr/include/c++/3.2/bits/stl_iterator.h:622
#11 0x40272be8 in __do_global_ctors_aux () from /usr/lib/libaqsis.so.0
#12 0x4015dc4c in _init () from /usr/lib/libaqsis.so.0
#13 0x4000cf8c in call_init () from /lib/ld.so.1
#14 0x4000d0fc in _dl_init () from /lib/ld.so.1
#15 0x400023dc in _dl_start_user () from /lib/ld.so.1
(gdb)

Thanks,

-------------------------------------------------------
