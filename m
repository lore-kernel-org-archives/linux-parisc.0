Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly3.hia.nrc.ca (hiauly3.hia.nrc.ca [132.246.100.195])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5B8D848C0
	for <parisc-linux@lists.parisc-linux.org>; Sun, 31 Aug 2003 14:48:02 -0600 (MDT)
From: John David Anglin <dave@hiauly3.hia.nrc.ca>
Message-Id: <200308312047.QAA05245@hiauly3.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [glibc] tststatic failues, reduced to simp le testcase.
To: carlos@baldric.uwo.ca
Date: Sun, 31 Aug 2003 16:47:59 -0400 (EDT)
Cc: randolph@tausq.org, dave.anglin@nrc-cnrc.gc.ca,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030831202203.GN5194@systemhalted> from Carlos O'Donell at Aug "31," 2003 "04:22:03" pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> That seems best. The sad fact though is that until I bump
> min_kernel_version in glibc past the kernel version that last didn't
> have this fix, I'm still forced to implement all this for people with
> older kernels.

Why?  Things are broken now and people have lived with the bug for
sometime.  While it is possible to work around the problem in userspace,
the best fix is to do it in the kernel.  I wouldn't fix anything but
a regression.

Dave
