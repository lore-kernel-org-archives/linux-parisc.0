Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id A1B50483E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Nov 2003 08:33:32 -0700 (MST)
Date: Wed, 12 Nov 2003 16:32:55 +0100
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] what's up with the ipc syscalls?
Message-ID: <20031112153255.GB11192@solo.franken.de>
References: <20031101082451.GJ28967@tausq.org> <20031102180150.GA14554@solo.franken.de> <20031102181252.GY28967@tausq.org> <20031102214200.GA5299@solo.franken.de> <20031102225626.GF26916@systemhalted> <20031103085601.GA9083@solo.franken.de> <20031103214119.GD778@systemhalted> <20031110234414.GA27527@solo.franken.de> <20031111214610.GJ18512@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031111214610.GJ18512@systemhalted>
From: tsbogend@alpha.franken.de (Thomas Bogendoerfer)
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

On Tue, Nov 11, 2003 at 04:46:10PM -0500, Carlos O'Donell wrote:
> > I had some thoughts about the conversion stuff, I've added to work
> > around problems introduced because of the change of some structures in
> > glibc/kernel. I finally realized, that these conversion only works,
> > if the "old glibc" is still installed together with the old binary.
> > That's because the newer glibcs don't set the IPC_64 bit when doing 
> > the syscall, but the old binary still uses the wrong structs, so the
> > conversion routine never triggers. I think it's really time to remove that
> > crap. Below is an compiled but not booted patch, which removes it and also
> > forward ports the necessary bits in ipc/util.c from 2.4. 
> 
> The following things confuse me.
> 
> a. Our glibc never set IPC_64, we had pass-thru assembly syscall
>    wrappers. Why? Because we don't have an IPC multiplexor, none of the
>    generic glibc code can be used by hppa.

IPC_64 has nothing to do with the x86 IPC multiplexor. It's for
selecting the IPC structures with bigger uid/gid/etc. . This is
only needed for x86, because there are structs with 16bit uid/gid.
Linux/PARISC always used 32bit uid/gid.

> So I don't understand some of your comments about "old glibc setting
> IPC_64."

glibc 2.2.x (don't know the exact number, if someone cares about the
version, I will try to find it out) has set IPC_64, because someone 
used a template from another architecture, maybe even x86. I've changed
that at the time, I changed the kernel code.

> a. Old glibc never called with IPC_64.

correct. NOTE: old means older than 2.2.x; woody glibc doesn't do that.

> b. Kernel turned IPC_64 on for us so we get the new style structs.

yes.

> c. Apps get new style structs without calling IPC_64.

right, but that's not done from the *_broken wrapper in sys_parisc.c,
but from the ipc_parse_version() in util.h. We use the same way
as x86_64 and ia64 already do. If we use the x86, we would need to
add stuff for IPC_OLD. This IMHO adds not needed bloat.

If we want to make that bullet proof, we should mask the IPC_64 bit
like the ipc_parse_version() function in ipc/util.c, but return always
IPC_64. Then it doesn't matter what glibc does. But we waste a bit
for IPC_EVEN_MORE_FUNKY_STRUCTS.

> Now we wish to have the hack in the kernel removed, but apps exist that
> expect newstyle structs without calling IPC_64. Thus glibc has to
> call the syscall with IPC_64 to get the right value back to userspace.

why ? The kernel knows it only supports IPC_64. It's the only thing it
knows and has to know right now.

> a. Remove kernel hacks (Thanks Thomas!).
> b. Add glibc code to turn IPC_64 on for all the afflicted syscalls.

no, just leave glibc alone. If you would do that and install this glibc
on a 2.4 kernel, the ipc syscalls will break, because of the hacks
there. Of course I'm also removing the hacks from the 2.4 kernel, but
there is an installed base of 2.4 kernel...

My patch just keeps the kernel ABI consistent between 2.4 and 2.6.
That's an strong argument in my eyes. Which means no kernel ABI
change, no need for a glibc change. And even better no broken
applications, because the kernel ABI hasn't changed.

> c. Eventually when all the apps disappear we can toss out the code from
>    glibc.
