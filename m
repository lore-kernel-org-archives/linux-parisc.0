Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 627F54840
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Nov 2003 14:51:19 -0700 (MST)
Date: Tue, 11 Nov 2003 16:46:10 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] what's up with the ipc syscalls?
Message-ID: <20031111214610.GJ18512@systemhalted>
References: <20031101082451.GJ28967@tausq.org> <20031102180150.GA14554@solo.franken.de> <20031102181252.GY28967@tausq.org> <20031102214200.GA5299@solo.franken.de> <20031102225626.GF26916@systemhalted> <20031103085601.GA9083@solo.franken.de> <20031103214119.GD778@systemhalted> <20031110234414.GA27527@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031110234414.GA27527@solo.franken.de>
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

> I had some thoughts about the conversion stuff, I've added to work
> around problems introduced because of the change of some structures in
> glibc/kernel. I finally realized, that these conversion only works,
> if the "old glibc" is still installed together with the old binary.
> That's because the newer glibcs don't set the IPC_64 bit when doing 
> the syscall, but the old binary still uses the wrong structs, so the
> conversion routine never triggers. I think it's really time to remove that
> crap. Below is an compiled but not booted patch, which removes it and also
> forward ports the necessary bits in ipc/util.c from 2.4. 

The following things confuse me.

a. Our glibc never set IPC_64, we had pass-thru assembly syscall
   wrappers. Why? Because we don't have an IPC multiplexor, none of the
   generic glibc code can be used by hppa.

So I don't understand some of your comments about "old glibc setting
IPC_64."

> If someone also wants to change glibc, feel free. I still think changing
> glibc is a bad idea, because this new glibc won't work with a current 2.4
> kernel.

I believed we had the following scenario:

a. Old glibc never called with IPC_64.
b. Kernel turned IPC_64 on for us so we get the new style structs.
c. Apps get new style structs without calling IPC_64.

Now we wish to have the hack in the kernel removed, but apps exist that
expect newstyle structs without calling IPC_64. Thus glibc has to
call the syscall with IPC_64 to get the right value back to userspace.

AFAIK the following is required:

a. Remove kernel hacks (Thanks Thomas!).
b. Add glibc code to turn IPC_64 on for all the afflicted syscalls.
c. Eventually when all the apps disappear we can toss out the code from
   glibc.

Thomas, did I get this right?

Cheers,
Carlos.
