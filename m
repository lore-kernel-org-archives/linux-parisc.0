From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Segmentation fault in __libc_start_main with -static
Date: Sun, 31 Jan 2010 13:52:50 -0500 (EST)
Message-ID: <20100131185251.1A9305145@hiauly1.hia.nrc.ca>
References: <119aab441001311003j480f6e4u741ae15df2899b32@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441001311003j480f6e4u741ae15df2899b32@mail.gmail.com> from "Carlos O'Donell" at Jan 31, 2010 01:03:17 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Could you explain the change in more detail?

The change is to set fs->signal_frame = 1 in signal frames in
pa32_fallback_frame_state.  This affects the determination as to whether
the IP is before or after the first not yet fully executed instruction
in a frame.  This feature was added in 2006 by Jakub Jelinek, but
pa32_fallback_frame_state was not changed.

This fixes unwinding in Ada (corner case).  It probably fixes corner
causes for other languages.  However, it breaks a number of Java testcases.
The problem is compensated for in the definition used for MAKE_THROW_FRAME
in libjava/include/pa-signal.h and hppa-signal.h.

The Ada testcase that exposed this problem is new for 4.5.

I'd hoped to bump the libgcc_s version so as to not break existing
applications, but that appears impossible.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
