Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D385487A
	for <parisc-linux@lists.parisc-linux.org>;
	Sun,  7 Mar 2004 04:06:17 -0700 (MST)
Message-ID: <404B0267.1020809@tiscali.be>
Date: Sun, 07 Mar 2004 11:07:19 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] glibc-2.3.3: a warning with gcc-3.3 become an
	error with gcc-3.5
References: <20040301193815.GG21769@baldric.uwo.ca>
	<402A4CA50000D57D@ocpmta2.freegates.net>
	<20040302195050.GE19402@baldric.uwo.ca>
	<404A4D34.1000106@tiscali.be> <20040306225740.GH963@baldric.uwo.ca>
In-Reply-To: <20040306225740.GH963@baldric.uwo.ca>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>



Carlos O'Donell wrote:
> On Sat, Mar 06, 2004 at 10:14:12PM +0000, Joel Soete wrote:
> 
>>Taken into account of your relevant remarks here is my new proposal:
>>=========><=========
>>--- sysdeps/hppa/fpu/feupdateenv.c.orig 2004-03-06 21:18:40.789605000 +0100
>>+++ sysdeps/hppa/fpu/feupdateenv.c      2004-03-06 21:22:21.839605000 +0100
>>@@ -23,15 +23,16 @@
>> int
>> feupdateenv (const fenv_t *envp)
>> {
>>-  unsigned int sw[2];
>>+  struct fenv_t saved_env, new_env;
>>
>>   /* Get the current exception status. */
>>-  __asm__ ("fstd %%fr0,0(%1)" : "=m" (*sw) : "r" (sw));
>>-  sw[0] &= FE_ALL_EXCEPT;
>>-  envp->__status_word = envp->__status_word | sw[0];
> 
> 
> Yeah, this is bad, because 'envp' is const, and we shouldn't be changing
> its value.
> 
> 
>>+  fegetenv(&saved_env);
>>+  saved_env.__status_word &= FE_ALL_EXCEPT;
>>+  new_env.__status_word = envp->__status_word | saved_env.__status_word;
>>+  for (i = 0; i < 7; i++) new_env.__exception[i] = envp->__exception[i];
> 
> 
> Why do you use "new_env" at all?

The reason is very simple: I just begin with glibc and my knowledge is still at stone age in this field.
This is an evidence that sun appears red in the early morning or at the end of the evening but white for the rest of a suny day, why?
The same here, hppa don't need feraiseexcept() but the alpha, i386, ia64, m68k, mips, (ppc), s390 and sparc need and I don't yet 
understand why ;)

> Just use saved_env. Then you don't have
> to have a silly loop to copy the exceptions, they'll already be there.
> Then you can call fesetenv(&saved_env);
>  
> 
>>   /* Install new environment.  */
>>-  fesetenv (envp);
>>+  fesetenv (&new_env);
>>
>>   /* Success.  */
>>   return 0;
>>=========><=========
> 
I will send you another patch which take into account your relevant remarks.

In the mean time I encounter this new pb:
/Sources/parisc-linux/xc/bin/hppa-linux-gcc dl-sym.c -c -std=gnu99 -O2 -Wall -Winline -Wstrict-prototypes -Wwrite-strings -g 
-I../include -I. -I/Sources/parisc-linux/build/glibc/elf -I.. -I../libio  -I/Sources/parisc-linux/build/glibc 
-I../sysdeps/hppa/elf -I../linuxthreads/sysdeps/unix/sysv/linux/hppa -I../linuxthreads/sysdeps/unix/sysv/linux 
-I../linuxthreads/sysdeps/pthread -I../sysdeps/pthread -I../linuxthreads/sysdeps/unix/sysv -I../linuxthreads/sysdeps/unix 
-I../linuxthreads/sysdeps/hppa -I../sysdeps/unix/sysv/linux/hppa -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu 
-I../sysdeps/unix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../sysdeps/unix/sysv -I../sysdeps/unix -I../sysdeps/posix 
-I../sysdeps/hppa/hppa1.1 -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64 
-I../sysdeps/ieee754/ldbl-128 -I../sysdeps/hppa/fpu -I../sysdeps/hppa -I../sysdeps/ieee754 -I../sysdeps/generic/elf 
-I../sysdeps/generic -nostdinc -isystem /Sources/parisc-linux/xc/lib/gcc/hppa-linux/3.5.0/include -isystem 
/Sources/parisc-linux/sources/linux/include -D_LIBC_REENTRANT -include ../include/libc-symbols.h       -o 
/Sources/parisc-linux/build/glibc/elf/dl-sym.o -MD -MP -MF
/Sources/parisc-linux/build/glibc/elf/dl-sym.o.dt
In file included from dl-sym.c:27:
../sysdeps/generic/dl-tls.h:2:2: #error "architecture-specific version of <dl-tls.h> missing"
make[2]: *** [/Sources/parisc-linux/build/glibc/elf/dl-sym.o] Error 1
make[2]: Leaving directory `/Sources/parisc-linux/sources/glibc-2.3.3-20040306/elf'
make[1]: *** [elf/subdir_lib] Error 2
make[1]: Leaving directory `/Sources/parisc-linux/sources/glibc-2.3.3-20040306'
make: *** [all] Error 2

and would suggest this patch:
--- dl-sym.c.orig       2004-03-07 11:44:11.219605000 +0100
+++ dl-sym.c    2004-03-07 11:41:21.219605000 +0100
@@ -24,10 +24,10 @@
  #include <dlfcn.h>
  #include <ldsodefs.h>
  #include <dl-hash.h>
-#include <dl-tls.h>
-

  #if defined USE_TLS && defined SHARED
+#include <dl-tls.h>
+
  /* Systems which do not have tls_index also probably have to define
     DONT_USE_TLS_INDEX.  */
=========><=========

Thanks,
	Joel
