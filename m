Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id C800B4830
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Sep 2003 00:07:15 -0600 (MDT)
Date: Mon, 1 Sep 2003 02:05:40 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly3.hia.nrc.ca>
Cc: randolph@tausq.org, dave.anglin@nrc-cnrc.gc.ca,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [glibc] tststatic failues, reduced to simp le testcase.
Message-ID: <20030901060540.GA19107@systemhalted>
References: <20030831202203.GN5194@systemhalted> <200308312047.QAA05245@hiauly3.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200308312047.QAA05245@hiauly3.hia.nrc.ca>
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

On Sun, Aug 31, 2003 at 04:47:59PM -0400, John David Anglin wrote:
> > That seems best. The sad fact though is that until I bump
> > min_kernel_version in glibc past the kernel version that last didn't
> > have this fix, I'm still forced to implement all this for people with
> > older kernels.
> 
> Why?  Things are broken now and people have lived with the bug for
> sometime.  While it is possible to work around the problem in userspace,
> the best fix is to do it in the kernel.  I wouldn't fix anything but
> a regression.

It's best to use an example. Debian supports HPPA as an architecture.
I provide Debian with patches to make upstream glibc cvs buildable for
this distribution. If I make all the glibc fixes in the kernel, and
submit to debian minimal patches, glibc will build and subsequent
updates will render all userspace broken. As a happy medium I need to
make, atleast for all usable distributions, a set of patches that fix it
in such a way that we don't force a kernel update (people don't like to
update their kernel). The patches I send upstream will be different.
They will, to the best of my ability, be as clean as possible. I balance
users on one side, and the "right thing" on the other.

I agree, that the kernel, sharing the context switch path, and already
saving r19 should be held responsible for restoring r19. I've already
begun to run into a number of cases where userspace restores aren't
going so well.

c.
