Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id C4E75489F
	for <parisc-linux@lists.parisc-linux.org>; Fri, 19 Sep 2003 10:56:53 -0600 (MDT)
Message-Id: <200309191656.h8JGukWJ003212@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] r19 (aka pic-register akak ltp) not restored on entry back to libc from libpthread?
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Fri, 19 Sep 2003 12:56:46 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: dave.anglin@nrc-cnrc.gc.ca, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030919135606.GE18225@systemhalted> from "Carlos O'Donell" at Sep 19, 2003 09:56:07 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Hold your horses here, we made it back into libc but our ltp is still
> that which we loaded upon entry to libpthread? :(

That's ok.  It's the responsibility of the libc code to restore ltp
after a call or exception.  However, as discussed previously, there
is no restoration after a syscall.  That should be the system's job,
although I believe you were going to introduce a hack/workaround to
fix the syscalls that clobber r19.

You need to step through the libc code from the return point in
libc to see why ltp isn't being restored.  Possibly, libpthread is
being called by assembly code that doesn't restore ltp.  Normally,
r19 is restored quite soon after a call.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
