Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id AD88A482A
	for <parisc-linux@parisc-linux.org>; Fri, 31 May 2002 09:16:02 -0600 (MDT)
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-cvs problem
Message-ID: <1022858049.3cf793414fbf4@webmail.tiscalinet.be>
Date: Fri, 31 May 2002 17:14:09 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@parisc-linux.org
References: <200205301751.g4UHpl5f003168@hiauly1.hia.nrc.ca>
In-Reply-To: <200205301751.g4UHpl5f003168@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Hi Dave,

It seems to be well comited in last cvs update this morming I got in
src/gcc/gcc/fixinc/inclhack.def:
...
/*
 * __thread is now a keyword.
 */
fix = {
    hackname  = thread_keyword;
    files     = "pthread.h";
    files     = "bits/sigthread.h";
    select    = " __thread([,)])";
    c_fix     = format;
    c_fix_arg = " __thr%1";

    test_text =
        "extern int pthread_create (pthread_t *__restrict __thread,\n"
        "extern int pthread_kill (pthread_t __thread, int __signo);\n"
        "extern int pthread_cancel (pthread_t __thread);";
};
...

But do not seems to be applied as I got the same error?

What do I wrong or forget to do?

Thanks for add help,
    Joel


Quoting John David Anglin <dave@hiauly1.hia.nrc.ca>:

> > In file included from ../include/pthread.h:1,
> >                  from
> ../linuxthreads/sysdeps/pthread/bits/libc-lock.h:23,
> >                  from ../sysdeps/generic/ldsodefs.h:34,
> >                  from ../sysdeps/unix/sysv/linux/ldsodefs.h:25,
> >                  from ../sysdeps/unix/sysv/linux/init-first.c:32:
> > ../linuxthreads/sysdeps/pthread/pthread.h:163: parse error before
> "__thread"
> 
> See <http://gcc.gnu.org/ml/gcc-patches/2002-05/msg01780.html> for fix.
> 
> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc.ca
> National Research Council of Canada              (613) 990-0752 (FAX:
> 952-6605)
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
