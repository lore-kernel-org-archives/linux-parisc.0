Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA12597
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Jan 2001 09:56:03 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 22 Jan 2001 16:59:54 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 3D026B005; Mon, 22 Jan 2001 16:50:14 +0000 (GMT)
Date: Mon, 22 Jan 2001 16:50:14 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20010122165014.O3571@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] tar hangs on 715/75
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  tar (and nscd) hang on my 715/75.  Same binaries/libraries work on
the B180.  The hang is in __pthread_acquire() called from
pthread_initialize().  On the B180 the code sequence goes like this
(tracing branches):

IAOQ: 40161eff 4015df47         <pthread_initialize+348>
IAOQ: 4015df53 4006b63f         <_init+1136>
IAOQ: 4006b65f 00000103         <__sigprocmask+32>
>>>> Heading for space 0 <<<<
IAOQ: 4006b66f 4006b687         <__sigprocmask+48>
IAOQ: 4006b693 40161f03         <__sigprocmask+84>
IAOQ: 40161f37 4015df37         <pthread_initialize+404>
IAOQ: 4015df43 4006e983         <_init+1120>
IAOQ: 4006e9af 4006e82f         <__cxa_atexit+44>
IAOQ: 4006e867 400860cf         <__new_exitfn+56>
IAOQ: 400860db 40160ed7         <____strtod_l_internal+15484>
IAOQ: 40160f07 40160f0b         <__pthread_mutex_lock+48>
IAOQ: 40160f0f 4016107f         <__pthread_mutex_lock+56>
IAOQ: 40161083 40164c63         <__pthread_mutex_lock+428>
IAOQ: 40164c93 4016508f         <__pthread_alt_lock+48>
IAOQ: 401650cf 40165107         <__pthread_acquire+64>
IAOQ: 4016511f 40164c97         <__pthread_acquire+144>
IAOQ: 40164cab 40164d53         <__pthread_alt_lock+72>
IAOQ: 40164d57 40164d63         <__pthread_alt_lock+244>
IAOQ: 40164d7b 40161087         <__pthread_alt_lock+280>
IAOQ: 4016109b 4006e86b         <__pthread_mutex_lock+452>
IAOQ: 4006e893 4006e8c7         <__new_exitfn+100>
etc

while on the 715/75 it goes like this:

IAOQ: 40161eff 4015df47         <pthread_initialize+348>
IAOQ: 4015df53 4006b63f         <_init+1136>
IAOQ: 4006b65f 00000103         <__sigprocmask+32>
>>>> Heading for space 0 <<<<
IAOQ: 4006b66f 4006b687
IAOQ: 4006b693 40161f03
IAOQ: 40161f37 4015df37
IAOQ: 4015df43 4006e983
IAOQ: 4006e9af 4006e82f
IAOQ: 4006e867 400860cf
IAOQ: 400860db 40160ed7
IAOQ: 40160f07 40160f0b
IAOQ: 40160f0f 4016107f
IAOQ: 40161083 40164c63
IAOQ: 40164c93 4016508f         <__pthread_alt_lock+48>
IAOQ: 401650df 4015dba7         <__pthread_acquire+80>
IAOQ: 4015dbb3 400f546f         <_init+208>
IAOQ: 400f5473 00000103         <sched_yield+4>
>>>> Heading for space 0 <<<<


from which I conclude that __pthread_acquire(int *spinlock) found the
spinlock held.

Relevant bit of pthread_initialize() looks like this:

  sigprocmask(SIG_BLOCK, &mask, NULL);
  /* Register an exit function to kill all other threads. */
  /* Do it early so that user-registered atexit functions are called
     before pthread_*exit_process. */
#ifndef HAVE_Z_NODELETE
  if (__builtin_expect (&__dso_handle != NULL, 1))
    __cxa_atexit ((void (*) (void *)) pthread_atexit_process, NULL,
                  __dso_handle);
  else
#endif
    __on_exit (pthread_onexit_process, NULL);


Do other people see this problem on 715/old machines?  Just type 'tar';
if you have the problem you'll never see the usage message.

Even better, does anyone have any suggestions as to what might be
causing it?  I am using taggarts new tarball nfsroot.

Richard
