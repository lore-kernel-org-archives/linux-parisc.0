Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id NAA03402
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 13:55:11 -0700
Sender: drepper@cygnus.com
To: Paul Bame <bame@noam.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com, parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] Help with posix_types.h
References: <E13w62o-0006Pv-00@noam.fc.hp.com>
	<E13w8KW-0006ZW-00@noam.fc.hp.com>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 15 Nov 2000 12:52:52 -0800
In-Reply-To: Paul Bame's message of "Wed, 15 Nov 2000 12:34:48 -0700"
Message-ID: <m3u299dkkb.fsf@otr.mynet.cygnus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Paul Bame <bame@noam.fc.hp.com> writes:

> FYI I just heard some pretty good reasons why both ino_t and off_t
> should be 64 bits even on 32-bit kernels.  Keep those cards and letters
> coming!

Any new port which does *not* do this is broken from the beginning.
Copying existing files is not what you have to do.  Instead look at
today's needs.  The numbers of the x86 port are those the kernel
people told me are needs, multiplied by 2 or 4.  Do the same.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
