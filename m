From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Improve ptrace support for gdb single-step
Date: Sat, 29 Dec 2012 11:42:06 -0500
Message-ID: <BLU0-SMTP58FCCC37C2B6CE2B604655973E0@phx.gbl>
References: <BLU0-SMTP34ED8A5FC4451C5BECF0F6973F0@phx.gbl> <CAE2sS1ikAfRfQQkRqzXU3TLL74BjSyh_euBFcbqcZwQxEE+bqg@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-59-535004512"
Cc: jejb@parisc-linux.org, Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAE2sS1ikAfRfQQkRqzXU3TLL74BjSyh_euBFcbqcZwQxEE+bqg@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-59-535004512
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

On 29-Dec-12, at 8:31 AM, Carlos O'Donell wrote:

>
> On Dec 28, 2012 6:18 PM, "John David Anglin" <dave.anglin@bell.net>  
> wrote:
> >
> > Various GCC tests use gdb to simulate a multithreaded  
> application.  Many
> > of these tests have been failing on parisc linux.
> >
> > GCC does this by using gdb to single-step the application, then  
> gdb is used to
> > call other test specific code.  Where this fails is when the  
> application is stepped
> > into the delay slot of a taken branch.  This sets the PSW B bit.   
> When the test
> > specific code is executed, this usually clears the PSW B bit.   
> Currently, gdb is
> > not allowed to set the B bit.  So, the code falls through what  
> should be a taken
> > branch.
>
> How exactly does this trigger? Step into delay slot, then what, call  
> an inferior function, then resume?
>
Yes.

I have attached a test case and gdb script which show bug.

Compile testcase with something like the following:
Executing on host: /home/dave/gnu/gcc/objdir/gcc/xgcc -B/home/dave/gnu/ 
gcc/objdir/gcc/ /home/dave/gnu/gcc/gcc/gcc/testsuite/gcc.dg/simulate- 
thread/speculative-store-4.c  -fno-diagnostics-show-caret   -O0 -g  -- 
param allow-store-data-races=0  -lm   -o speculative-store-4.exe

Execute with something like:
gdb -nx -nw -x /home/dave/gnu/gcc/gcc/gcc/testsuite/gcc.dg/simulate- 
thread/simulate-thread.gdb ./speculative-store-4.exe

You can see that the gdb script executes inferior functions to  
simulate thread behavior and to determine
whether the test is done.

I debugged this by adding extra print and disp statements to the  
kernel, gdb and the gdb script.

According to the PA 2.0 arch, a non sequential iaoq queue without the  
B bit being set invokes undefined
behavior.  Possibly, this should be checked for when the return is  
setup after pt_regs_ok.  However, I
think it is ok to let gdb play with the B bit.  See the definition of  
USER_PSW_MASK in psw.h:

#define USER_PSW_MASK (WIDE_PSW | PSW_T | PSW_N | PSW_X | PSW_B |  
PSW_V | PSW_CB)

This defines the PSW bits that the user can change using exception  
support.  Probably, the two sets
should be the same.

> > The attached patch adds the PSW B bit to the set of bits that gdb  
> is allowed to
> > set.  In order to set the B bit, the trace system call must return  
> using an interrupt
> > restore.  The patch also modifies this code to use the saved IAOQ  
> values when
> > they are saved by a ptrace syscall or interruption.
> >
> > Signed-off-by: John David Anglin <dave.anglin@bell.net>
>
> What testing did you do with patch?
>
I have been running the change with 3.7.x kernels for a couple of  
weeks.  I checked that strace still works
and GCC test results for tests using gdb are now similar to the  
results on hpux.

I believe gdb still has problems regarding delay slots, PSW bits and  
inferior function calls.  This mainly shows
up in the GCC guality tests.  Of course, there are hundreds of FAILs  
in the gdb testsuite...

Dave
--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-59-535004512
Content-Disposition: attachment; filename="speculative-store-4.c.txt"
Content-Type: text/plain; x-unix-mode=0644; name="speculative-store-4.c.txt"
Content-Transfer-Encoding: 7bit

/* { dg-do link } */
/* { dg-options "--param allow-store-data-races=0" } */
/* { dg-final { simulate-thread } } */

#include <stdio.h>
#include <stdlib.h>

#include "simulate-thread.h"

/* PR 54139 */
/* Test that speculative stores do not happen for --param
   allow-store-data-races=0.  */

int g_13=1, insns=1;

__attribute__((noinline))
void simulate_thread_main()
{
  int l_245;

  /* Since g_13 is unilaterally set positive above, there should be
     no store to g_13 below.  */
  for (l_245 = 0; l_245 <= 1; l_245 += 1)
    for (; g_13 <= 0; g_13 = 1)
      ;
}

int main()
{
  simulate_thread_main ();
  simulate_thread_done ();
  return 0;
}

void simulate_thread_other_threads ()
{
  ++g_13;
  ++insns;
}

int simulate_thread_step_verify ()
{
  return 0;
}

int simulate_thread_final_verify ()
{
  if (g_13 != insns)
    {
      printf("FAIL: g_13 was incorrectly cached\n");
      return 1;
    }
  return 0;
}

--Apple-Mail-59-535004512
Content-Disposition: attachment; filename="simulate-thread.gdb.txt"
Content-Type: text/plain; x-unix-mode=0644; name="simulate-thread.gdb.txt"
Content-Transfer-Encoding: 7bit

set height 0
break simulate_thread_main
# disp/i $pc
run

set $ret = 0
while (simulate_thread_fini != 1) && (! $ret)
  set $ret |= simulate_thread_wrapper_other_threads()
  stepi
  set $ret |= simulate_thread_step_verify()
end

if (! $ret)
  set $ret |= simulate_thread_wrapper_final_verify()
end
continue
quit $ret

--Apple-Mail-59-535004512--
