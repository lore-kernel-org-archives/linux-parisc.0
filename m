From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Thu, 20 Apr 2006 15:21:55 -0500
Message-ID: <200604201521.55966.mszick@morethan.org>
References: <200604201932.k3KJWgKJ023738@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604201932.k3KJWgKJ023738@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu April 20 2006 14:32, John David Anglin wrote:
> > > > > (here) insn, an interruption occures which in turn launch the
> > > > > fixup_put_user_skip_1()
> > > > 
> > > > A couple more questions for research :)
> > > > 
> > > > Q: Does the process of interruption clobber registers?
> > > 
> > Joel,
> > 
> > The machine should switch a small sub-set of the general
> > registers to an alternate set, called the 'shadow registers'
> > for the interruption routine to use.
> 
> fixup_put_user_skip_1() runs after the interruption, so the
> shadow registers don't matter. 
>
I was unclear, I was answering the second question, my bad.

> Look at the registers used 
> by fixup_put_user_skip_1() and where it returns.  
>
Ah, the first question...

> Note that 
> GCC is only concerned about registers used in the current
> function (i.e., if an asm changes sections and generates code
> using registers in that section, this is all black magic to
> GCC and it doesn't need to know about it).
> 
Giving that a little though, and it should be obvious...

GCC only compiles a single flow of execution at a time,
the ::: information fields only apply to what the compiler
is doing at the moment.

If the author of the code writes instructions inside of the
current black box (__asm block) that are on a different path
of execution, then it is up to the author to ensure that 
the _other_ path (section in this case) observes proper
register usage.

It is the _other_ path of execution that needs its register
usage audited.

Mike
> It's clear that the __get* and __put* macros need brief comments
> about the register use of the fixup routines.  Also, the fixup
> routines need corresponding comments.
> 
> > I do not know if r1 is shadowed or not.
> 
> Yes.
> 
> Dave
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
