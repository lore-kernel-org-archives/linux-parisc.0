From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: gcj port to hppa...
Date: Sat, 7 Nov 2009 16:48:42 -0500
Message-ID: <119aab440911071348t16198843q37757d25dc6a4691@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>,
	Debian HPPA Port List <debian-hppa@lists.debian.org>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Dave,

The gcj port to hppa uses a locking implementation
(libjava/sysdeps/pa/locks.h) which is not signal safe.

The assembly can be interrupted by a signal which if it calls
compare_and_swap again will deadlock. However, I can't tell if this
will ever happen.

The fix for this is to port the lock implementation to use the
light-weight in-kernel compare-and-swap, which is thread-safe and
signal-safe. However, this is only available for Linux.

Does locks.h also need to work for HPUX?

Cheers,
Carlos.
