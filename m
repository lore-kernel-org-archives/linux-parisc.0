Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 683CB4852
	for <parisc-linux@lists.parisc-linux.org>;
	Sat,  6 Mar 2004 15:13:06 -0700 (MST)
Message-ID: <404A4D34.1000106@tiscali.be>
Date: Sat, 06 Mar 2004 22:14:12 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] glibc-2.3.3: a warning with gcc-3.3 become an
	error with gcc-3.5
References: <20040301193815.GG21769@baldric.uwo.ca>
	<402A4CA50000D57D@ocpmta2.freegates.net>
	<20040302195050.GE19402@baldric.uwo.ca>
In-Reply-To: <20040302195050.GE19402@baldric.uwo.ca>
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
> Joel,
> 
> Could you lookup the C99 specification please?
> 
> 
>>--- ./feupdateenv.c.orig	2004-03-02 15:21:25.959085856 +0100
>>+++ ./feupdateenv.c	2004-03-02 07:53:27.938166120 +0100
>>@@ -28,11 +28,16 @@
>>   /* Get the current exception status. */
>>   __asm__ ("fstd %%fr0,0(%1)" : "=m" (*sw) : "r" (sw));
>>   sw[0] &= FE_ALL_EXCEPT;
>>-  envp->__status_word = envp->__status_word | sw[0];
>>+/*  envp->__status_word = envp->__status_word | sw[0]; */
> 
> 
> This is required to set the flags. Please review the specfications.
> 
> 
>>   /* Install new environment.  */
>>   fesetenv (envp);
>> 
>>+  /* Raise the safed exception.  Incidently for us the implementation
>>+     defined format of the values in objects of type fexcept_t is the
>>+     same as the ones specified using the FE_* constants.  */
>>+  feraiseexcept (sw[0]);
>>+
> 
> 
> AFAIK, this is not correct, the spec says that it will be an OR of the
> raised exceptions, e.g. an OR of the raised flags. 
> 
> Calling feraiseexcept could fault the program.
> 
> 
>>   /* Success.  */
>>   return 0;
>> }
> 
Taken into account of your relevant remarks here is my new proposal:
=========><=========
--- sysdeps/hppa/fpu/feupdateenv.c.orig 2004-03-06 21:18:40.789605000 +0100
+++ sysdeps/hppa/fpu/feupdateenv.c      2004-03-06 21:22:21.839605000 +0100
@@ -23,15 +23,16 @@
  int
  feupdateenv (const fenv_t *envp)
  {
-  unsigned int sw[2];
+  struct fenv_t saved_env, new_env;

    /* Get the current exception status. */
-  __asm__ ("fstd %%fr0,0(%1)" : "=m" (*sw) : "r" (sw));
-  sw[0] &= FE_ALL_EXCEPT;
-  envp->__status_word = envp->__status_word | sw[0];
+  fegetenv(&saved_env);
+  saved_env.__status_word &= FE_ALL_EXCEPT;
+  new_env.__status_word = envp->__status_word | saved_env.__status_word;
+  for (i = 0; i < 7; i++) new_env.__exception[i] = envp->__exception[i];

    /* Install new environment.  */
-  fesetenv (envp);
+  fesetenv (&new_env);

    /* Success.  */
    return 0;
=========><=========

Joel
