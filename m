From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Mon, 8 Dec 2008 10:30:00 -0500 (EST)
Message-ID: <20081208153000.C69664F30@hiauly1.hia.nrc.ca>
References: <119aab440812080702k6ab8c0f4k772f0f0bc9eb2893@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, linux-parisc@vger.kernel.org,
	grundler@parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440812080702k6ab8c0f4k772f0f0bc9eb2893@mail.gmail.com> from "Carlos O'Donell" at Dec 8, 2008 10:02:47 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > How long have futex's been used on hppa?  I guess we really need to try
> > run the glibc testsuite on a new kernel.
> 
> The futex function has been available almost since futex's first appeared
> 
> The futex API is exported to userspace and can be used by any application.
> 
> e.g. man futex
> ~~~
> NAME
>        futex - Fast Userspace Locking system call

This is only supposition but a broken futex call might cause the type of
problems we are seeing.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
