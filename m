From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Segmentation fault in __libc_start_main with -static
Date: Sun, 31 Jan 2010 12:13:07 -0500 (EST)
Message-ID: <20100131171307.E17D85145@hiauly1.hia.nrc.ca>
References: <119aab441001310852u687139b3rf711997e4e2e4b83@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441001310852u687139b3rf711997e4e2e4b83@mail.gmail.com> from "Carlos O'Donell" at Jan 31, 2010 11:52:21 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> We define it like this:
> glibc-ports/sysdeps/hppa/libgcc_s.h
> /* Name of libgcc_s library provided by gcc.  */
> #define LIBGCC_S_SO "libgcc_s.so.4"
> 
> If you bump the version number you need to tell me, and then we
> coordinate with debian to release a new libgcc_s.so, followed by an
> updated glibc.

Ugh!  This means that the change in unwind behavior (signal frames)
would need to be backported to all active GCC versions.  libgcj would
also need fixing.  In principle, the whole application base would
need recompilation to update to the new glibc version.

I guess the minimal impact is to accept that the change in unwind
behavior will break a few programs.  The java exception support
compensated for the bug.  I'll back out the version bump.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
