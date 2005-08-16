From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Re: gsyprf11 and 2.6.13-rc3-pa1
Date: Tue, 16 Aug 2005 11:02:47 +0800
Message-ID: <43015757.2080207@tausq.org>
References: <20050812180551.GA32609@colo.lackof.org>	<200508130000.j7D00oKW005186@hiauly1.hia.nrc.ca>	<20050813050211.GE32609@colo.lackof.org>
	<1123940428.5037.2.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 PARISC list <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1123940428.5037.2.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Can somebody with a 32-bit machine try this slightly modified test case?
In the presence of a signal handler for SIGSEGV, the program will loop
segfaulting because there's not enough stack space left for the signal
handler. On an a500, this program just loops, but perhaps on a 32-bit
machine it crashes the machine if run long enough. Seems to suggest a
problem in our kernel entry/exit paths?

randolph

================================================================

#include <stdio.h>
#include <signal.h>
#include <stdlib.h>

char *stack_base_estimate;

static void sighandler(int sig)
{
        printf("Got signal %d\n", sig);
        exit(0);
}

void
recurse(void)
{
        char a[256];

        memset(a, '\0', sizeof(*a));
        printf("Estimating stack consumed 0x%lx\n",
               (unsigned long)(a - stack_base_estimate));
        recurse();
}

int
main(int argc, char *argv[])
{
        char b;

        signal(SIGSEGV, sighandler);

        stack_base_estimate = &b;
        printf("Estimating stack base at 0x%p\n", stack_base_estimate);
        recurse();
        return 0;
}

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
