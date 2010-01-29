From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Segmentation fault in __libc_start_main with -static
Date: Fri, 29 Jan 2010 08:55:42 -0500
Message-ID: <119aab441001290555k38c84cfdq2907d50e75f2c123@mail.gmail.com>
References: <20100127170625.0E6F54EA9@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100127170625.0E6F54EA9@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Jan 27, 2010 at 12:06 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> In trying to debug a new gcc testsuite failure, I tried to link the
> application with -static to simplify debugging. =A0It turns out we ha=
ve
> a couple of problems in linking threaded applications with -static.

Thanks for looking into this.

> The first problem is the linker does change r19 to dp for various TLS
> relocations using the global pointer. =A0I've attached a patch below
> to which I think fixes this problem.

OK.

> The second issue is the handling of the symbol __nptl_threads.
> We get a segmentation fault at startup here:
>
> 0x000223bc <__libc_start_main+600>: =A0 =A0 addil L%0,r0,r1
> 0x000223c0 <__libc_start_main+604>: =A0 =A0 ldo 0(r1),r3
> 0x000223c4 <__libc_start_main+608>: =A0 =A0 ldw 0(r3),rp
>
> The relocations are:
>
> 00000258 R_PARISC_DPREL21L =A0__nptl_nthreads
> 0000025c R_PARISC_DPREL14R =A0__nptl_nthreads
>
> The original code:
>
> =A0258: =A0 2b 60 00 00 =A0 =A0 addil L%0,dp,r1
> =A025c: =A0 34 23 00 00 =A0 =A0 ldo 0(r1),r3
> =A0260: =A0 0c 60 10 82 =A0 =A0 ldw 0(r3),rp
>
> __nptl_nthreads is undefined weak:
>
> =A0 =A0 =A0 =A0 w __nptl_nthreads

The symbol is defined in libpthread.so, specifically by
nptl/pthread_create.c "unsigned int __nptl_nthreads =3D 1;"

Application link map shows:
 .data          0x000a1648       0x14
/usr/lib/gcc/hppa-linux-gnu/4.3.4/../../../libpthread.a(pthread_create.=
o)
                0x000a1648                __nptl_nthreads

I don't see any segmentation fault, nor do I see an undefined weak
__nptl_nthreads:

  1600: 000a1648     4 OBJECT  GLOBAL DEFAULT   21 __nptl_nthreads

You need to provide me with more data about how the application is
built, it looks like your link might be incorrect.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
