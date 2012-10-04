From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: what's parisc execve_wrapper doing in the end?
Date: Thu, 04 Oct 2012 10:30:19 +0100
Message-ID: <1349343019.2706.3.camel@dabdike.int.hansenpartnership.com>
References: <20121004045150.GH23473@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20121004045150.GH23473@ZenIV.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

[parisc list added just in case I get this wrong]
On Thu, 2012-10-04 at 05:51 +0100, Al Viro wrote:
> I'm really confused by that one:
>         /* If exec succeeded we need to load the args */
> 
>         ldo -1024(%r0),%r1
>         cmpb,>>= %r28,%r1,error_\execve
>         copy %r2,%r19
> 
> error_\execve:
>         bv %r0(%r19)
> 
> Just what is going on there?  That cmpb is non-nullifying, right? 

Right, it would have to have a ,n to nullify the following instruction,
so the copy is executed in both branches.

The compare and branch clearly has no effect, so it's a vestige of
something, I think.

>  So this
> assignment to %r2 happens whether condition is true or false.  And AFAICS
> IAOQ_Next is set to error_\execve in both cases.  So what the hell
> is that comparison for (and the comment about)?  Why not simply return
> via bv %r0(%r2) and be done with that?  It had been done that way since
> the initial parisc merge circa 2.4.0-test*...

Right, but no idea what it's a vestige of.

James


