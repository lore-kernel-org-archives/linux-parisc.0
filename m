Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5167B487A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 31 Aug 2003 14:23:37 -0600 (MDT)
Date: Sun, 31 Aug 2003 16:22:03 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly3.hia.nrc.ca>
Cc: randolph@tausq.org, dave.anglin@nrc-cnrc.gc.ca,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [glibc] tststatic failues, reduced to simp le testcase.
Message-ID: <20030831202203.GN5194@systemhalted>
References: <200308311910.PAA04875@hiauly3.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200308311910.PAA04875@hiauly3.hia.nrc.ca>
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

> Another possibility might be to define another couple of offsets in the
> task struct.  It looks as if there is plenty of space before an alignment
> boundary is reached.

That seems best. The sad fact though is that until I bump
min_kernel_version in glibc past the kernel version that last didn't
have this fix, I'm still forced to implement all this for people with
older kernels.

c.
