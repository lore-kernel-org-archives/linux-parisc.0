Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 5 Jul 2003 22:12:10 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: jsoe0708@tiscali.be, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] warning: minor abi change
Message-ID: <20030706041210.GA16894@dsl2.external.hp.com>
References: <20030705230834.GB9682@dsl2.external.hp.com> <200307052353.h65NrZF4025169@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200307052353.h65NrZF4025169@hiauly1.hia.nrc.ca>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sat, Jul 05, 2003 at 07:53:34PM -0400, John David Anglin wrote:
> Instead of adding (void *) to each comparison,

This is just a temporary workaround and I have no plans of committing
any (void *) casts to fix this problem.

> you could add a kernel
> version of __canonicalize_funcptr_for_compare:
> 
> __canonicalize_funcptr_for_compare:
> 	bv %r0(%r2)
> 	copy %r26,%r28
> 
> or for PA 2.0
> 
> __canonicalize_funcptr_for_compare:
>         bve (%r2)
> 	copy %r26,%r28
> 
> I think there was a possible solution along these lines posted on the list
> a few months ago (joel?).

Ok.  I didn't see it when trolling the mail archive.
No matter, I'll try it.
Anyone have an opinion on which arch/parisc file this should go in?

> This solution assumes that canonicalization is unnecessary in the kernel.
> Probably, in most cases it is.  However, if you really need to canonicalize
> a function pointer from user space, then you are going to have to figure
> out how to call into the dynamic loader from the kernel.  This obviously
> isn't very safe.  So, possibly this implies that function pointers passed
> in syscalls should be canonicalized before the kernel is entered (i.e.,
> glibc should do the canonicalization).
> 
> As far as kernel modules go, I don't know how function pointers are
> handled.  If you pass a function pointer from one module to another,
> does it need canonicalization?

I depend on willy/tausq/amodra/et al to understand stuff like this.

> If canonicalization is never necessary
> in the kernel, possibly I could add a GCC option to disable canonicalization.

I think willy suggested privately that might be case.

> Sorry, about the lack of documentation.  To see what the function does,
> it's currently necessary to look in the GCC gcc/config/pa directory.

oh no problem. Kernel has lots of stale/missing documentation too.
Just need guidance on where to find the relevant code and which
path to take.

thanks,
grant
