Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id DC2E6487B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Nov 2003 17:41:14 -0700 (MST)
Date: Thu, 13 Nov 2003 19:35:53 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] what's up with the ipc syscalls?
Message-ID: <20031114003553.GB11355@systemhalted>
References: <20031101082451.GJ28967@tausq.org> <20031102180150.GA14554@solo.franken.de> <20031102181252.GY28967@tausq.org> <20031102214200.GA5299@solo.franken.de> <20031102225626.GF26916@systemhalted> <20031103085601.GA9083@solo.franken.de> <20031103214119.GD778@systemhalted> <20031110234414.GA27527@solo.franken.de> <20031111214610.GJ18512@systemhalted> <20031112153255.GB11192@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031112153255.GB11192@solo.franken.de>
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

On Wed, Nov 12, 2003 at 04:32:55PM +0100, Thomas Bogendoerfer wrote:
> > The following things confuse me.
> > 
> > a. Our glibc never set IPC_64, we had pass-thru assembly syscall
> >    wrappers. Why? Because we don't have an IPC multiplexor, none of the
> >    generic glibc code can be used by hppa.
> 
> IPC_64 has nothing to do with the x86 IPC multiplexor. It's for
> selecting the IPC structures with bigger uid/gid/etc. . This is
> only needed for x86, because there are structs with 16bit uid/gid.
> Linux/PARISC always used 32bit uid/gid.

Yes it does. From userspace the glibc code calls INLINE_SYSCALL(...) and
calls the IPC multiplexor syscall directly. We can't use this code, so
we use the syscalls.list method to generate assembly wrappers, these
wrappers have no logic and merely pass-thru the users options to the
syscall. glibc for hppa could never have "turned on" IPC_64 without
cloning the associated .c files in libc/sysdeps/unix/sysv/linux/, and
AFAIK we never have. Do you know any different?
 
> > So I don't understand some of your comments about "old glibc setting
> > IPC_64."
> 
> glibc 2.2.x (don't know the exact number, if someone cares about the
> version, I will try to find it out) has set IPC_64, because someone 
> used a template from another architecture, maybe even x86. I've changed
> that at the time, I changed the kernel code.

This is the code I'm looking to find but cannot find. If you could track
down the revision I would be extremely happy since I would like to look
at the code. We essentially need to put this back into place so that the
older apps work (versioned symbol).

> > a. Old glibc never called with IPC_64.
> 
> correct. NOTE: old means older than 2.2.x; woody glibc doesn't do that.

Good. We're on the same page.

> > b. Kernel turned IPC_64 on for us so we get the new style structs.
> 
> yes.

Yes.

> > c. Apps get new style structs without calling IPC_64.
> 
> right, but that's not done from the *_broken wrapper in sys_parisc.c,
> but from the ipc_parse_version() in util.h. We use the same way
> as x86_64 and ia64 already do. If we use the x86, we would need to
> add stuff for IPC_OLD. This IMHO adds not needed bloat.
> 
> If we want to make that bullet proof, we should mask the IPC_64 bit
> like the ipc_parse_version() function in ipc/util.c, but return always
> IPC_64. Then it doesn't matter what glibc does. But we waste a bit
> for IPC_EVEN_MORE_FUNKY_STRUCTS.

That's why we have symbol versioning. We can construct some IPC syscalls
in glibc and version them so that the older apps can use them. The
newer apps can make the call directly to the kernel with the bit on or
off. Simplifies the kernel and pushes the version compat into glibc
where it should exist.

> > Now we wish to have the hack in the kernel removed, but apps exist that
> > expect newstyle structs without calling IPC_64. Thus glibc has to
> > call the syscall with IPC_64 to get the right value back to userspace.
> 
> why ? The kernel knows it only supports IPC_64. It's the only thing it
> knows and has to know right now.

Can we ignore the bit then and make the code simpler?

> > a. Remove kernel hacks (Thanks Thomas!).
> > b. Add glibc code to turn IPC_64 on for all the afflicted syscalls.
> 
> no, just leave glibc alone. If you would do that and install this glibc
> on a 2.4 kernel, the ipc syscalls will break, because of the hacks
> there. Of course I'm also removing the hacks from the 2.4 kernel, but
> there is an installed base of 2.4 kernel...
> 
> My patch just keeps the kernel ABI consistent between 2.4 and 2.6.
> That's an strong argument in my eyes. Which means no kernel ABI
> change, no need for a glibc change. And even better no broken
> applications, because the kernel ABI hasn't changed.

It only works for a glibc that *doesn't* set IPC_64?

> > c. Eventually when all the apps disappear we can toss out the code from
> >    glibc.
> 
> From my point of view, those old apps, which are covered by my hack
> are already gone, because they already stopped working after an glibc upgrade.

Untrue, we can put out a new glibc and the old apps can work again. This
glibc hasn't made it all the way up the chain.

c.
