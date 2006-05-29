From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Close to mainline for hppa-linux TLS.
Date: Mon, 29 May 2006 11:41:48 -0400
Message-ID: <119aab440605290841p284b297eo85f7031afbca421d@mail.gmail.com>
References: <119aab440605260729m1fad24ccta84a2ada06c82c7a@mail.gmail.com>
	<1148677068.21405.5.camel@localhost.localdomain>
	<119aab440605261416q7997e5d5x3e4bd642cb662ccd@mail.gmail.com>
	<1148784620.5626.0.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Jeff Bailey" <jbailey@raspberryginger.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1148784620.5626.0.camel@localhost.localdomain>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > It's unverified, and should not be changed blindly because it's an ABI =
change.
>
> Right.  I'm trolling for patches for Ubuntu. =3D)  The ABI change is what
> caught my eye.
>
> Any sorts of testing reports that you're looking for?

Nothing yet. Thanks to Randolph we caught a bug in asm/unistd.h that I
introduce 2 years ago, and the include chain changes revealed the bug
during the build.

TLS + Linuxthreads is our first target.
NPTL is the next target.

All patches upstream is the goal.
This will never happen for linuxthreads.
This will happen for NPTL.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
