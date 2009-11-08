From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: gcj port to hppa...
Date: Sun, 8 Nov 2009 13:40:51 -0500 (EST)
Message-ID: <20091108184052.43E3A4E38@hiauly1.hia.nrc.ca>
References: <119aab440911071348t16198843q37757d25dc6a4691@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org,
	dave.anglin@nrc-cnrc.gc.ca
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440911071348t16198843q37757d25dc6a4691@mail.gmail.com> from "Carlos O'Donell" at Nov 7, 2009 04:48:42 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The gcj port to hppa uses a locking implementation
> (libjava/sysdeps/pa/locks.h) which is not signal safe.

Yes.  Is this the gcj problem that you were seeing with nptl?

> The assembly can be interrupted by a signal which if it calls
> compare_and_swap again will deadlock. However, I can't tell if this
> will ever happen.
> 
> The fix for this is to port the lock implementation to use the
> light-weight in-kernel compare-and-swap, which is thread-safe and
> signal-safe. However, this is only available for Linux.

I would say the linux implementation should uses the gcc atomic builtins.
They are based on the kernel compare-and-swap.

> Does locks.h also need to work for HPUX?

Yes.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
