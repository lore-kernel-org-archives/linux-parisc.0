From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] glibc 2.3.2-9 for hppa - "when hell freezes over" release
Date: Mon, 20 Oct 2003 19:43:46 -0400
Message-ID: <20031020234345.GC5606__30175.1348808923$1416622896$gmane$org@systemhalted>
References: <20031017181252.GE27289@systemhalted> <20031019181341.GF8642@systemhalted> <20031019235005.GI8642@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
	LaMont Jones <lamont@debian.com>
To: debian-glibc@lists.debian.org, Jeff Bailey <jbailey@nisa.net>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20031019235005.GI8642@systemhalted>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sun, Oct 19, 2003 at 07:50:05PM -0400, Carlos O'Donell wrote:
> Will produce a new patch and new testing debs. Thanks go to all the
> testers that turned up these problems.

New debs fix reported problems:
a. Six argument syscall faiulres.
b. feraiseexcept(FE_INEXACT) doesn't raise FE_INEXACT excption.

New patch available at:
http://www.baldric.uwo.ca/~carlos/glibc232-hppa-full-2003-10-20.dpatch

Follow the instructions provided in the original email:
1. Remove all previous hppa patches.
2. Add this .dpatch as the only hppa patch.

Upload requested :) Lets make userspace churn...

Cheers,
Carlos.
