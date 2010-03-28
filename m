From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Question about execve.
Date: Sun, 28 Mar 2010 11:42:42 -0400
Message-ID: <20100328154241.GA2782@hiauly1.hia.nrc.ca>
References: <119aab441003272026o55db5202sd345df270f3b0e1f@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441003272026o55db5202sd345df270f3b0e1f@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 27 Mar 2010, Carlos O'Donell wrote:

> Helge,
> 
> On PARISC I'm seeing the following reproducible behvaiour:
> 
> * Parent calls vfork()
> * Child of vfork() calls execve()
> * Child returns from execve() and starts corrupting parent state
> eventually leading to a segmentation fault.
> * New process (as a result of execve) runs to completion.
> 
> What code in the Linux kernel prevents the child, which calls
> execve(), from returning?

All the execute a file commands can return if an error occurs.  Thus,
I question the fact that the execve wrapper doesn't save registers.

The vfork child runs using the parent's stack.  Thus, even the call
to execve potentially corrupts the parent's stack, and depending on
scheduling, this might cause a segmentation fault in either parent or
child.

Here's a couple of excerpts from the vfork man page for HP-UX:

Series 800

Process times for the parent and child processes within the [vfork,exec]
window may be inaccurate.

    * Parent and child processes share the same stack space within the
    [vfork,exec] window. If the size of the stack has been changed within
    this window by the child process (return from or call to a function,
    for example), it is likely that the parent and child processes will
    be killed with signal SIGSEGV or SIGBUS.

The [vfork,exec] window begins at the vfork() call and ends when the child
completes its exec() call.

The Open Group man page says:

The use of vfork() for any purpose except as a prelude to an immediate call
to a function from the exec  family, or to _exit(), is not advised.  On HP-UX,
it's not supported.

I see that this is not a new issue for linux:
http://lkml.indiana.edu/hypermail/linux/kernel/9902.0/0256.html

It is ok to treat vfork() identically to fork(), and the HP-UX
manpage indicates that this may be the case for certain HP-UX
implementations (maybe Series 700).

> Test case attached.

I was not able to save your pt-fork.S file.   mutt didn't understand
the encoding.

I tried the vfork.c test case on my c3750 with 32-bit kernel.  It
didn't segv in a limited number of runs.  However, I did notice that
getpid() is broken after vfork().

The printf call in the child path probably isn't legit.  It's also not
legit to simply return if execve fails.  _exit must be called.

My guess would be that the parent is not blocked leading to corruption.

> #include <stdio.h>
> #include <stdlib.h>
> #include <errno.h>
> #include <unistd.h>
> 
> #define CALL_EXIT 0
> 
> int main (void)
> {
>   pid_t child;
>   char *cmd[] = { "bash", "-c", "echo In child $$;", (char *)0 };
>   char *env[] = { "HOME=/tmp", (char *)0 };
>   int ret;
> 
>   child = vfork();
> 
>   if (child == 0)
>     {
>       ret = execve("/bin/bash", cmd, env);
>       printf ("ret = %d\n", ret);
> #if CALL_EXIT == 1
>       _exit(1);
> #endif
>     }
>   else
>     {
>       printf("child != 0\n");
>     }
> 
>   printf("parent is %d\n", (unsigned int)getpid());
>   printf("child is %d\n", (unsigned int)child);
> 
>   return 0;
> }

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
