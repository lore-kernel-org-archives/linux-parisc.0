From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Fri, 9 Apr 2010 11:13:31 -0400
Message-ID: <20100409151330.GA23889@hiauly1.hia.nrc.ca>
References: <20100408215453.GA18445@hiauly1.hia.nrc.ca> <20100408224446.96F294FA3@hiauly1.hia.nrc.ca> <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dave.anglin@nrc-cnrc.gc.ca, deller@gmx.de, gniibe@fsij.org,
	linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 09 Apr 2010, Carlos O'Donell wrote:

> We need to start splitting up your giant "stability" patch into
> manageable chunks.

I agree.  What I posted was not intended as a submission.  Some
of the changes aren't mine, some are cleanups, some are "obvious",
some are not obvious and may well be wrong, or inefficient.

I posted the change to not clobber r19 on fork/clone syscalls,
but there has been no response to it.

I will try split up the change this weekend.

> For example, are the futex fixes anywhere for Kyle to pickup?

The futex fixes are Helge's and were posted to the list on Wed,
03 Feb 2010 23:03:49 +0100 along with Helge's minifail3.c.

The change to syscall.S in the above post included two hunks from me.
I removed Helge's portion so that I could enable LWS locking on UP
builds because of the concern that a page fault on COW memory could
cause user code to be scheduled in the locking code.

I think there is merit in using __atomic_user_hash, etc, but it
will take a bit of work to make it available in UP kernels.
I think Helge's change to fork.c is probably not necessary.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
