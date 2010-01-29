From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Segmentation fault in __libc_start_main with -static
Date: Fri, 29 Jan 2010 09:54:38 -0500
Message-ID: <20100129145437.GA7819@hiauly1.hia.nrc.ca>
References: <20100127170625.0E6F54EA9@hiauly1.hia.nrc.ca> <119aab441001290555k38c84cfdq2907d50e75f2c123@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441001290555k38c84cfdq2907d50e75f2c123@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 29 Jan 2010, Carlos O'Donell wrote:

> On Wed, Jan 27, 2010 at 12:06 PM, John David Anglin
> > The original code:
> >
> > =A0258: =A0 2b 60 00 00 =A0 =A0 addil L%0,dp,r1
> > =A025c: =A0 34 23 00 00 =A0 =A0 ldo 0(r1),r3
> > =A0260: =A0 0c 60 10 82 =A0 =A0 ldw 0(r3),rp
> >
> > __nptl_nthreads is undefined weak:
> >
> > =A0 =A0 =A0 =A0 w __nptl_nthreads
>=20
> The symbol is defined in libpthread.so, specifically by
> nptl/pthread_create.c "unsigned int __nptl_nthreads =3D 1;"
>=20
> Application link map shows:
>  .data          0x000a1648       0x14
> /usr/lib/gcc/hppa-linux-gnu/4.3.4/../../../libpthread.a(pthread_creat=
e.o)
>                 0x000a1648                __nptl_nthreads
>=20
> I don't see any segmentation fault, nor do I see an undefined weak
> __nptl_nthreads:

Think you missed that I said the application was being linked with
-static.  As a result, pthread_create.o won't be loaded from libpthread=
=2Ea
just to resolve __nptl_nthreads.

This is the application:

// This test only applies to glibc (NPTL) targets.
// { dg-do run { target *-*-linux* } }
// { dg-options "-pthread" }

#include <pthread.h>
#include <cxxabi.h>
extern "C" int printf (const char *, ...);

int main()
{
  try
    {
      pthread_exit (0);
    }
  catch (abi::__forced_unwind &)
    {
      printf ("caught forced unwind\n");
      throw;
    }
  catch (...)
    {
      printf ("caught ...\n");
      return 1;
    }
}

This is the gcc link command:

/home/dave/gnu/gcc/objdir/gcc/testsuite/g++/../../collect-ld -static -o=
 ./forced.xgs /usr/lib/crt1.o /usr/lib/crti.o /home/dave/gnu/gcc/objdir=
/gcc/testsuite/g++/../../crtbeginT.o -L/home/dave/gnu/gcc/objdir/hppa-l=
inux/./libstdc++-v3/src/.libs -L/home/dave/gnu/gcc/objdir/hppa-linux/./=
libstdc++-v3/src/.libs -L/home/dave/gnu/gcc/objdir/hppa-linux/./libiber=
ty -L/home/dave/gnu/gcc/objdir/gcc/testsuite/g++/../.. -L/home/dave/gnu=
/gcc/objdir/hppa-linux/./libstdc++-v3/src/.libs /tmp/ccmLwpAe.o -lstdc+=
+ -lm --start-group -lgcc -lgcc_eh -lpthread -lc --end-group /home/dave=
/gnu/gcc/objdir/gcc/testsuite/g++/../../crtend.o /usr/lib/crtn.o

Compile with:

g++ -o xx -static -pthread xx.C

Given what you said, the same fault would likely occur on x86.

Dave
--=20
J. David Anglin                                  dave.anglin@nrc-cnrc.g=
c.ca
National Research Council of Canada              (613) 990-0752 (FAX: 9=
52-6602)
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
