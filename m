From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Mon, 8 Dec 2008 09:54:50 -0500 (EST)
Message-ID: <20081208145451.2116F4EDA@hiauly1.hia.nrc.ca>
References: <119aab440812080439l12c2feb8u500eeea3ad5bbd20@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: grundler@parisc-linux.org, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440812080439l12c2feb8u500eeea3ad5bbd20@mail.gmail.com> from "Carlos O'Donell" at Dec 8, 2008 07:39:55 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > So, the code is using the thread register (cr27).  Not sure what syscall
> > this is.  However, the problem might be TLS releated.
> 
> The thread register has always been used to track thread specific
> information, even in linuxthreads.
> 
> The syscall is __NR_futex.
> 
> If you can produce a synthetic testcase that calls __NR_futex and
> crashes the kernel then we'll have something for the kernel hackers to
> look at?

How long have futex's been used on hppa?  I guess we really need to try
run the glibc testsuite on a new kernel.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
