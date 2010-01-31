From: Helge Deller <deller@gmx.de>
Subject: Re: futex wait failure
Date: Sun, 31 Jan 2010 22:14:21 +0100
Message-ID: <4B65F2AD.3060408@gmx.de>
References: <20100108163756.48BDE5183@hiauly1.hia.nrc.ca>	 <4B47A130.8060603@gmx.de>	 <119aab441001081344j38000314p1931df34149eabd3@mail.gmail.com>	 <4B524912.4070204@gmx.de> <119aab441001290953r74009887x7be7173bfad95d1e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441001290953r74009887x7be7173bfad95d1e@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 01/29/2010 06:53 PM, Carlos O'Donell wrote:
> On Sat, Jan 16, 2010 at 6:17 PM, Helge Deller<deller@gmx.de>  wrote:
>> This coding seems to indicate that we call _exit(), but we aren't (as
>> you see above in the strace).
>> So I'm wondering if the "bl _exit,%rp" needs changing.
>> Something with HIDDEN_JUMPTARGET(_exit) or similar, so that
>> _exit() instead of exit() is called?
>>
>> Actually I did tested this with the minifail test program, and changed
>> thread_run() to call _exit(0) at the end instead of "return 0":
>> void* thread_run(void* arg) {
>>         ...
>> /*      return (void *)&status;  */
>>         _exit(0);
>> }
>> With strace I then suddenly got exit_group() which seems more correct:
>> [pid  1910] write(1, "Thread OK.\n", 11) = 11
>> [pid  1910] exit_group(0)               = ?
>
> I agree with this analysis. I'm testing a change which uses
> HIDDEN_JUMPTARGET(). I will tell you how it goes.

I think I tested it once, and it doesn't help.
Threads are started by calling start_thread(), and I think we need changes there, e.g. (untested):

diff -up ./nptl/pthread_create.c.org ./nptl/pthread_create.c
--- ./nptl/pthread_create.c.org 2010-01-17 20:54:19.000000000 +0100
+++ ./nptl/pthread_create.c     2010-01-17 20:56:24.000000000 +0100
@@ -316,7 +316,7 @@ start_thread (void *arg)
       is no thread left.  */
    if (__builtin_expect (atomic_decrement_and_test (&__nptl_nthreads), 0))
      /* This was the last thread.  */
-    exit (0);
+    _exit (0);
                                                                                                                                            
    /* Report the death of the thread if this is wanted.  */
    if (__builtin_expect (pd->report_events, 0))
  

> Calling exit_group is important for threads.

Yep.

Helge
