From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Mon, 18 Jan 2010 15:44:58 -0500 (EST)
Message-ID: <20100118204459.B95514EF1@hiauly1.hia.nrc.ca>
References: <4B524912.4070204@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4B524912.4070204@gmx.de> from "Helge Deller" at Jan 17, 2010 00:17:38 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Actually I did tested this with the minifail test program, and changed
> thread_run() to call _exit(0) at the end instead of "return 0":
> void* thread_run(void* arg) {
> 	...
> /*	return (void *)&status;  */
>          _exit(0);
> }
> With strace I then suddenly got exit_group() which seems more correct:
> [pid  1910] write(1, "Thread OK.\n", 11) = 11
> [pid  1910] exit_group(0)               = ?

The child of the fork should exit using _exit(0).  Otherwise, it messes
with the file descriptors of the parent.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
