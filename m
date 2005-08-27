From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Latest 2.6.13-rc6-pa2 test pr :_(
Date: Sat, 27 Aug 2005 22:40:53 +0800
Message-ID: <43107B75.80301@tausq.org>
References: <200508261342.j7QDgMCk015398@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200508261342.j7QDgMCk015398@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> After another couple of hours of poking at this with gdb, I think
> we have a kernel bug.  The saved r2 value in the signal context
> appears to contain the pc where the exception occurred instead of
> the r2 value when the exception occured.  As a result, the unwind
> process goes into a loop when an exception occurs in a function
> which hasn't saved r2 in the frame.

I thought I could reproduce this, but I couldn't..... using the attached 
program, the signal handler does see the correct (different) r2 and iaoq 
in the signal frame. When compiled with -O2, bar() is a leaf function 
with no frame, r2 in the signal handler points to the return point of 
foo() inside of main().

Did I misunderstand the problem that you are describing? I am testing 
with 2.6.13-rc6-pa2 64-bit.

randolph

#include <stdio.h>
#include <strings.h>
#include <signal.h>
#include <sys/ucontext.h>

void baz(void)
{
         printf("in baz\n");
}

void sighandler(int sig, siginfo_t *info, void *data)
{
         struct ucontext *ctx = (struct ucontext *)data;
         struct sigcontext *mctx = &ctx->uc_mcontext;
         printf("in sighandler\n");
         printf("data=%p, r2 = %x, iaoq[0] = %x\n", data, 
mctx->sc_gr[2], mctx->sc_iaoq[0]);
         baz();
         exit(0);
}

void bar(void)
{
         int *x = 0;
         int r2;

         *x = 0;
}

void foo(void)
{
         printf("in foo\n");
         bar();
}

int main(int argc, char **argv)
{
         struct sigaction sact;

         memset(&sact, 0, sizeof(sact));
         sact.sa_flags = SA_SIGINFO;
         sact.sa_sigaction = sighandler;
         sigaction(SIGSEGV, &sact, NULL);
         foo();

         return 0;
}
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
