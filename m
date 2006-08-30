From: Matthias Klose <doko@cs.tu-berlin.de>
Subject: [parisc-linux] Re: build failure of stlport 5.0.2 on hppa
Date: Wed, 30 Aug 2006 09:27:38 +0200
Message-ID: <17653.15850.943986.966989@gargle.gargle.HOWL>
References: <a90bfcf0608291318y2d2c3072j3a7463ce3fcc730b@mail.gmail.com>
	<200608301028.01941.ptr@island.corbina.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Petr Ovtchenkov <ptr@island.corbina.net>,
 parisc-linux@parisc-linux.org
To: "Torsten Werner" <mail.twerner@googlemail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200608301028.01941.ptr@island.corbina.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

[ CCing parisc-linux ]

  Matthias

Petr Ovtchenkov writes:
> On Wednesday 30 August 2006 00:18, you wrote:
> > Hi Petr,
> > 
> > 
> > compiling the library with USE_STATIC_LIBGCC=1 leads to other error messages:
> > 
> > obj/gcc/shared/test_main.o: In function `main':
> > ../../../test/unit/cppunit/test_main.cpp:138: undefined reference to
> > `_Unwind_Resume'
> > obj/gcc/shared/test_main.o: In function `~Reporter':
> > ../../../test/unit/cppunit/cppunit_mini.h:31: undefined reference to
> > `_Unwind_Resume'
> > ../../../test/unit/cppunit/cppunit_mini.h:31: undefined reference to
> > `_Unwind_Resume'
> > obj/gcc/shared/accum_test.o: In function `~TestFixture':
> > ../../../test/unit/cppunit/cppunit_mini.h:41: undefined reference to
> > `_Unwind_Resume'
> > obj/gcc/shared/accum_test.o: In function
> > `stlpmtx_std::__node_alloc<false, 0>::deallocate(void*, unsigned
> > int)':
> > ../../../stlport/stl/_alloc.h:311: undefined reference to `_Unwind_Resume'
> > obj/gcc/shared/accum_test.o:../../../test/unit/accum_test.cpp:42: more
> > undefined references to `_Unwind_Resume' follow
> > 
> > Do you have an idea, what is wrong?
> 
> During modern gcc build process, depends on --enable-shared/--disable-shared options
> it produces following libs:
> 
> 1. --enable-shared: 
>    a) link with shared
>       libgcc_s.so --- runtime gcc support
>       libsupc++.a --- C++ language support
>    b) link with static
>       libgcc.a    --- runtime gcc support
>       libgcc_eh.a --- C++ exceptions support, if you use static libgcc
>       libsupc++.a --- C++ language support
> 
> 2. --disable-shared:
>       libgcc.a    --- runtime gcc support, C++ exceptions support
>       libsupc++.a --- C++ language support
> 
> But on some platform (I treat it as bug in gcc build) not all support
> functions present in correct place. Looks like this is you case.
> 
> See gmake/lib/gcc.mak and gmake/app/gcc.mak for link sequence and my
> comments. Note, that when we build libstlport*, we import whole
> libsupc++.a, so no needs to mention libsupc++.a when link application
> with libstlport*.
> 
>   - ptr
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
