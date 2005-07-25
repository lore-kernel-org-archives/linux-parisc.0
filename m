From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [Testers wanted] New glibc with profiling fixed.
Date: Sun, 24 Jul 2005 18:09:19 -0600
Message-ID: <20050725000919.GA18659@colo.lackof.org>
References: <1122036994.10454.131.camel@thor.tres.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Tres Melton <tres@mindspring.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1122036994.10454.131.camel@thor.tres.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jul 22, 2005 at 06:56:34AM -0600, Tres Melton wrote:
> | Here's "apps/openssl speed rsa" gprof output from my c3000.
> | (2.6.0-pa7, Debian testing)
> |  
> | TBH, it looks wrong.
> 
> It is wrong.  For details please see:
> 
> http://bugs.gentoo.org/show_bug.cgi?id=90090

Ugh. user space vs kernel space HZ battles.

> 	If you have any more information on the subject

Sorry - I really don't.
I'm happy to run more tests on kernel patches if that would help.

>  I would appreciate it
> as a number of us are preparing to take this issue to the LKML.  I'm
> specifically looking at a convincing reason to put forth to Linus to
> export the correct clock-ticks/second.  Linus has stated in the past
> that user space has no need for the information.  A couple of other
> kernel devs are going to back me up here but we need a good argument to
> get Linus to change his mind.

I'm certainly not the one who has a solid grasp of the problem.
I just recognized the output looked wrong.

Another kernel developer has suggested this is a gprof bug.
I was told the kernel has two types of ticks: one for kernel and another
for users space - some conversation needs to take place by gprof
that I know nothing about.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
