From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] [RFC] Non-executable stack?
Date: Sun, 12 Sep 2004 09:10:09 -0700
Message-ID: <20040912161009.GQ28659@tausq.org>
References: <20040912143555.GN1854@baldric.uwo.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040912143555.GN1854@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Can we have a non-executable stack on PA?
> 
> Why or why not?

Do you mean on the architecture? Yes, you can. afaik, hpux has a 
non-executable stack.

> The only thing that currently comes to mind is that we have return paths
> from the signal handler as stack code. This is very easy to fix, just
> put the code statically on the gateway page and allow the user to jump
> through that back into the kernel.

do you mean in general, or just in the kernel? do you really mean only
marking the stack non-executable, or also the heap?

We have various bits of trampolines in a number of applications that 
could potentially live on the stack. libffi comes to mind....  and
probably other code that needs to call between languages.

why do you want to do this?  because of the direction our stack grows,
stack overflow protection is not as useful on pa.... not that you cannot
do stack-smashing attacks on pa, of course...

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
