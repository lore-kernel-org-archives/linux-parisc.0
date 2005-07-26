From: Tres Melton <tres@mindspring.com>
Subject: Re: [parisc-linux] [Testers wanted] New glibc with profiling fixed.
Date: Tue, 26 Jul 2005 07:37:16 -0600
Message-ID: <1122385036.10644.146.camel@thor.tres.org>
References: <1122036994.10454.131.camel@thor.tres.org>
	<20050725000919.GA18659@colo.lackof.org>
	<1122272788.10644.71.camel@thor.tres.org>
	<20050726132402.GA32722@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050726132402.GA32722@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, 2005-07-26 at 07:24 -0600, Grant Grundler wrote:
> I can do that in August...thanks for pointing that out.
> I read the first parts of the report but don't recall seeing
> the kernel patch.

http://bugs.gentoo.org/show_bug.cgi?id=90090#c21
It is not a patch file just in the comment.

> Right. That's why jiffies exported to user space has to be "normalized"
> for whatever rate user space *thinks* the kernel is running.

I'm advocating a way for user space to *know* what the kernel is
running.  It is this thinking crap that is messing things up.

> > You spoke of another kernel
> > dev, could you ask him if he is opposed to exporting the correct value
> > in the elf header (or /proc) and to give a quick justification for his
> > response, pro or con.  Thanks.
> 
> He's already flown back to germany and it was just incidental that
> he was available. I'd rather not pester him about this since it
> seems to be a fairly well understood issue...at least to some people.

If you happen to speak to him again I would still like any extra info.
Don't bother him explicitly for this though.  The issue will be taken to
the LKML by the end of the week.

> thanks,
> grant
-- 
Tres

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
