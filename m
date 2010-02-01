From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Mon, 1 Feb 2010 14:11:41 -0500 (EST)
Message-ID: <20100201191141.EE51F4EA9@hiauly1.hia.nrc.ca>
References: <4B67252A.2000501@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4B67252A.2000501@gmx.de> from "Helge Deller" at Feb 1, 2010 08:02:02 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On 02/01/2010 01:26 AM, John David Anglin wrote:
> >>>> Actually I did tested this with the minifail test program, and changed
> >>>> thread_run() to call _exit(0) at the end instead of "return 0":
> >>>> void* thread_run(void* arg) {
> >>>>          ...
> >>>> /*      return (void *)&status;  */
> >>>>          _exit(0);
> >>>> }
> >>>> With strace I then suddenly got exit_group() which seems more correct:
> >>>> [pid  1910] write(1, "Thread OK.\n", 11) = 11
> >>>> [pid  1910] exit_group(0)               = ?
> >
> > Did this fix minifail?
> 
> No, sadly it didn't fixed it.

I tend to think clone/fork syscalls need to be guarded to ensure a stable
configuration while the syscall executes.  It may be the problem arises
because we use clone for fork.  Do any other targets do this?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
