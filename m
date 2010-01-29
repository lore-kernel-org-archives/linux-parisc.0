From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Segmentation fault in __libc_start_main with -static
Date: Fri, 29 Jan 2010 11:08:16 -0500
Message-ID: <119aab441001290808g51a80822m91ff468cc07fa0ed@mail.gmail.com>
References: <20100127170625.0E6F54EA9@hiauly1.hia.nrc.ca>
	 <119aab441001290555k38c84cfdq2907d50e75f2c123@mail.gmail.com>
	 <20100129145437.GA7819@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100129145437.GA7819@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 29, 2010 at 9:54 AM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> Think you missed that I said the application was being linked with
> -static. =A0As a result, pthread_create.o won't be loaded from libpth=
read.a
> just to resolve __nptl_nthreads.

I linked with -static, and it was resolved to pthread_create.o from
libpthread.a. However, my application called pthread_create *before*
calling pthread_exit.

> This is the application:
>
> // This test only applies to glibc (NPTL) targets.
> // { dg-do run { target *-*-linux* } }
> // { dg-options "-pthread" }
>
> #include <pthread.h>
> #include <cxxabi.h>
> extern "C" int printf (const char *, ...);
>
> int main()
> {
> =A0try
> =A0 =A0{
> =A0 =A0 =A0pthread_exit (0);
> =A0 =A0}
> =A0catch (abi::__forced_unwind &)
> =A0 =A0{
> =A0 =A0 =A0printf ("caught forced unwind\n");
> =A0 =A0 =A0throw;
> =A0 =A0}
> =A0catch (...)
> =A0 =A0{
> =A0 =A0 =A0printf ("caught ...\n");
> =A0 =A0 =A0return 1;
> =A0 =A0}
> }
>
> This is the gcc link command:
>
> /home/dave/gnu/gcc/objdir/gcc/testsuite/g++/../../collect-ld -static =
-o ./forced.xgs /usr/lib/crt1.o /usr/lib/crti.o /home/dave/gnu/gcc/objd=
ir/gcc/testsuite/g++/../../crtbeginT.o -L/home/dave/gnu/gcc/objdir/hppa=
-linux/./libstdc++-v3/src/.libs -L/home/dave/gnu/gcc/objdir/hppa-linux/=
=2E/libstdc++-v3/src/.libs -L/home/dave/gnu/gcc/objdir/hppa-linux/./lib=
iberty -L/home/dave/gnu/gcc/objdir/gcc/testsuite/g++/../.. -L/home/dave=
/gnu/gcc/objdir/hppa-linux/./libstdc++-v3/src/.libs /tmp/ccmLwpAe.o -ls=
tdc++ -lm --start-group -lgcc -lgcc_eh -lpthread -lc --end-group /home/=
dave/gnu/gcc/objdir/gcc/testsuite/g++/../../crtend.o /usr/lib/crtn.o
>
> Compile with:
>
> g++ -o xx -static -pthread xx.C
>
> Given what you said, the same fault would likely occur on x86.

This isn't supported by glibc. You must pull in pthread_create.o if
you call pthread_exit(). Otherwise nothing defines __nptl_nthreads.

This test crashes on x86.
carlos@crasus:~$ readelf -a test | grep __nptl_nthreads
  1863: 00000000     0 NOTYPE  WEAK   DEFAULT  UND __nptl_nthreads

carlos@crasus:~$ ./test
caught forced unwind
Segmentation fault

I don't know why it crashes so late on x86, perhaps during another
operation that manipulate ptr_nthreads?

We blow up in nptl-ini.c during the static initialization that sets
ptr_nthreads to &__nptl_nthreads e.g.
~~~
static const struct pthread_functions pthread_functions =3D
  {
    .ptr_pthread_attr_destroy =3D __pthread_attr_destroy,
=2E..
    .ptr_nthreads =3D &__nptl_nthreads,
    .ptr___pthread_unwind =3D &__pthread_unwind,
    .ptr__nptl_deallocate_tsd =3D __nptl_deallocate_tsd,
    .ptr__nptl_setxid =3D __nptl_setxid,
    /* For now only the stack cache needs to be freed.  */
    .ptr_freeres =3D nptl_freeres
  };
~~~

This is technically a generic glibc bug.

Does linking with `-u pthread_create` fix the testcase? It fixes the
failure on x86.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
