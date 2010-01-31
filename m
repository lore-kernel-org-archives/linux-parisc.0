From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Sun, 31 Jan 2010 19:26:12 +73900 (EST)
Message-ID: <20100201002612.F0A754EA9@hiauly1.hia.nrc.ca>
References: <4B65F2AD.3060408@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4B65F2AD.3060408@gmx.de> from "Helge Deller" at Jan 31, 2010 10:14:21 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> >> Actually I did tested this with the minifail test program, and changed
> >> thread_run() to call _exit(0) at the end instead of "return 0":
> >> void* thread_run(void* arg) {
> >>         ...
> >> /*      return (void *)&status;  */
> >>         _exit(0);
> >> }
> >> With strace I then suddenly got exit_group() which seems more correct:
> >> [pid  1910] write(1, "Thread OK.\n", 11) = 11
> >> [pid  1910] exit_group(0)               = ?

Did this fix minifail?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
