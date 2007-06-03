From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] -pie is broken on hppa
Date: Sun, 3 Jun 2007 16:49:10 -0400
Message-ID: <20070603204910.GC24868__45832.9713707373$1416624385$gmane$org@fattire.cabal.ca>
References: <200706031606.l53G6d70012984@hiauly1.hia.nrc.ca>
	<200706031828.l53ISHsf015527@hiauly1.hia.nrc.ca>
	<20070603192829.GA23062@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org,
 matthew@wil.cx
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070603192829.GA23062@fattire.cabal.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jun 03, 2007 at 03:28:29PM -0400, Kyle McMartin wrote:
> On Sun, Jun 03, 2007 at 02:28:17PM -0400, John David Anglin wrote:
> > I believe that we aren't allowed to fault on the gateway page.
> > If we have holes in the syscall table, I think we need a check
> > for this since the following code will fault if r19 is zero:
> > 
> > .Lin_syscall:
> >         ldil    L%syscall_exit,%r2
> > 	be      0(%sr7,%r19)
> > 	ldo     R%syscall_exit(%r2),%r2
> > 
> 
> This is bad. Your kernel is too old, and glibc didn't take this into
> account. I'll hack something up to return -ENOSYS.
> 

Er, we already have code to do this:

#ifdef CONFIG_64BIT
	ldil	L%sys_call_table, %r1
	or,=	%r2,%r2,%r2
	addil	L%(sys_call_table64-sys_call_table), %r1
	ldo	R%sys_call_table(%r1), %r19
	or,=	%r2,%r2,%r2
	ldo	R%sys_call_table64(%r1), %r19
#else
	ldil	L%sys_call_table, %r1
	ldo     R%sys_call_table(%r1), %r19
#endif	
	comiclr,>>=	__NR_Linux_syscalls, %r20, %r0
	b,n	.Lsyscall_nosys
[...]

The bug is that comiclr, the logic is messed.

If __NR_Linux_syscalls is greater than or equal to the syscall number,
nullify the next instruction (skip the branch) and process the syscall.

The problem with this is that when they are equal, it means we're
off-by-one past the end of the syscall table.

comiclr,>>= should be comiclr,>>

This has been broken for a very long time. :/

Cheers,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
