Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rover.gag.com (rover.gag.com [192.133.104.32])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9845482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Nov 2001 10:38:08 -0700 (MST)
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
References: <20011119210811.E11431@linuxcare.com>
From: Bdale Garbee <bdale@gag.com>
Date: 20 Nov 2001 01:20:26 -0700
In-Reply-To: <20011119210811.E11431@linuxcare.com>
Message-ID: <874rnpg8fp.fsf@rover.gag.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: hppa kernel-headers.deb and offset.h
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

Richard Hirst <rhirst@linuxcare.com> writes:

> Our kernel-headers debs are missing asm/offset.h, which is created
> late on in a kernel build.

Ewww.

> Maybe the kernel should build offset.h as part of make dep, or something.

Yes.  Building the file during make dep, and *not* removing it during make
clean (remove it during distclean, leave it present during clean) would fix
the problem.

> glibc build should use kernel-headers, but I guess libc6-dev_2.2.4-6
> was built using some local kernel tree for the headers, and has picked
> up a 64 bit offset.h.  so, anyone trying to build gdb will have to
> replace their offset.h.

So, we've never had a real kernel-headers package before.  I guess once we get
one that's right, we should re-spin glibc even if it's a binNMU.

Bdale
