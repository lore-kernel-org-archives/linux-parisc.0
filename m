Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0BF1E4852
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Nov 2003 02:01:24 -0700 (MST)
Date: Mon, 3 Nov 2003 09:56:01 +0100
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] what's up with the ipc syscalls?
Message-ID: <20031103085601.GA9083@solo.franken.de>
References: <20031101082451.GJ28967@tausq.org> <20031102180150.GA14554@solo.franken.de> <20031102181252.GY28967@tausq.org> <20031102214200.GA5299@solo.franken.de> <20031102225626.GF26916@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031102225626.GF26916@systemhalted>
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

On Sun, Nov 02, 2003 at 05:56:27PM -0500, Carlos O'Donell wrote:
> On Sun, Nov 02, 2003 at 10:42:00PM +0100, Thomas Bogendoerfer wrote:
> > On Sun, Nov 02, 2003 at 10:12:52AM -0800, Randolph Chung wrote:
> > > anyway, if we are only supporting IPC_64, then why mask off the IPC64
> > > bit in the wrapper? if the ipc/utils.c stuff isn't there, wouldn't it
> > > default to doing the right thing when IPC_64 is set?
> > 
> > look at the switch statements in msg.c/sem.c/shm.c. If you don't mask
> > off IPC_64, the cases don't match.
> > 
> > > right now glibc *doesn't* call the syscall with IPC_64, but i'm about to
> > > make it do that again.
> > 
> > I don't think this is a good idea, because by checking for IPC_64 we
> > could see, whether an old glibc is used and could convert structs
> > (see sys_parisc.c:sys_shmctl_broken()).
> 
> There is no such thing as that "old glibc" we have always had
> __ASSUME_IPC64. What support are we looking to preserve?

glibc 2.2.x, some weeks before woody went final. For a closer date
check the date of my sys_parisc.c commit.

Since there might be still binaries in woody, which are compiled
with an such an "old" glibc, we will break this binaries. The suggested
change is an change of the kernel ABI, so I would avoid it. The problem
with this "old" glibc was, that the structs for shmctl and friends
weren't properly aligned for 64bit. I've changed that and also decided
to get rid of IPC_64, because that's x86 crap.

Adding the 2.4 changes to the 2.6 kernel should fix everything.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
