Return-Path: <soete.joel@tiscali.be>
Received: from spoolo3.tiscali.be (spoolo3.tiscali.be [62.235.13.169])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1AD1348BE
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 14 Mar 2004 09:20:15 -0700 (MST)
Message-ID: <40548691.7090300@tiscali.be>
Date: Sun, 14 Mar 2004 16:21:37 +0000
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

Carlos,

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
> Why do you use "new_env" at all? Just use saved_env. Then you don't have
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
Taken into account of your remarks here is the final patch:
--- glibc-2.3.3-20040314/sysdeps/hppa/fpu/feupdateenv.c.orig    2003-12-18 04:57:50.000000000 +0100
+++ glibc-2.3.3-20040314/sysdeps/hppa/fpu/feupdateenv.c 2004-03-14 12:06:13.286349000 +0100
@@ -23,15 +23,15 @@
  int
  feupdateenv (const fenv_t *envp)
  {
-  unsigned int sw[2];
+  fenv_t tmp_env;

    /* Get the current exception status. */
-  __asm__ ("fstd %%fr0,0(%1)" : "=m" (*sw) : "r" (sw));
-  sw[0] &= FE_ALL_EXCEPT;
-  envp->__status_word = envp->__status_word | sw[0];
+  fegetenv(&tmp_env);
+  tmp_env.__status_word &= FE_ALL_EXCEPT;
+  tmp_env.__status_word |= envp->__status_word;

    /* Install new environment.  */
-  fesetenv (envp);
+  fesetenv (&tmp_env);

    /* Success.  */
    return 0;
=========><=========

it compiles well with gcc-3.3.

I hope it will not break anything :)

Joel
