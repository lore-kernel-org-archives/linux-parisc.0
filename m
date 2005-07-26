From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [Testers wanted] New glibc with profiling fixed.
Date: Tue, 26 Jul 2005 07:24:02 -0600
Message-ID: <20050726132402.GA32722@colo.lackof.org>
References: <1122036994.10454.131.camel@thor.tres.org>
	<20050725000919.GA18659@colo.lackof.org>
	<1122272788.10644.71.camel@thor.tres.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Tres Melton <tres@mindspring.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1122272788.10644.71.camel@thor.tres.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Tres,
please keep this conversation on the parisc-linux mailing list.
I've added them back into the CC list.

On Mon, Jul 25, 2005 at 12:26:28AM -0600, Tres Melton wrote:
> > I'm happy to run more tests on kernel patches if that would help.
> 
> There is a patch to the kernel in the above bug report that makes Linux
> put the right value in the elf header.  That is going to be one of the
> proposed patches.  I've been running a patched kernel for about a week
> with no noticeable side effects.  If you would like you could try that
> and note any breakage in user space.

I can do that in August...thanks for pointing that out.
I read the first parts of the report but don't recall seeing
the kernel patch.

> When you said 'conversation' did you mean 'conversion'?

Yes - thanks for catching that.

> If so, there is no way for gprof to due that
> conversion without knowing what the conversion rate is.  The HZ is now
> set at compile time, as of 2.6.13-rc3, and the conversion rate to
> USER_HZ is not available to user space.

Right. That's why jiffies exported to user space has to be "normalized"
for whatever rate user space *thinks* the kernel is running.

> You spoke of another kernel
> dev, could you ask him if he is opposed to exporting the correct value
> in the elf header (or /proc) and to give a quick justification for his
> response, pro or con.  Thanks.

He's already flown back to germany and it was just incidental that
he was available. I'd rather not pester him about this since it
seems to be a fairly well understood issue...at least to some people.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
