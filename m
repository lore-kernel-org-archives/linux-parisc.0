Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.cern.ch (smtp1.cern.ch [137.138.128.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 823454A19
	for <parisc-linux@parisc-linux.org>; Sun, 11 Mar 2001 21:31:31 -0700 (MST)
Sender: Jes.Sorensen@cern.ch
To: Alan Modra <alan@linuxcare.com.au>
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] segfaults with new binutils
References: <Pine.LNX.4.21.0103121021450.23407-100000@front.linuxcare.com.au>
From: Jes Sorensen <jes@linuxcare.com>
Date: 12 Mar 2001 05:31:17 +0100
In-Reply-To: Alan Modra's message of "Mon, 12 Mar 2001 10:41:39 +1100 (EST)"
Message-ID: <d3y9ub6222.fsf@lxplus015.cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Alan" == Alan Modra <alan@linuxcare.com.au> writes:

Alan> Huh?  My builds don't try to build crti.o for linuxthreads.
Alan> crti.o is built in csu/ from sysdeps/hppa/elf/initfini.c.
Alan> Perhaps you have a configuration problem.  What options did you
Alan> pass to configure?  Hmm, more importantly, what source are you
Alan> compiling?  I don't have a pt-initfini.c in my source tree!

pt-initfini.c was added to glibc-2.2.2 recently, you need it to build
a working LinuxThreads library now. Unless someone has synced the
parisc tree recently it shouldn't be an issue, as long as noone tries
to compile the Cygnus tree for parisc.

Jes
