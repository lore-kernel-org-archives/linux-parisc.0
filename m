Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6C4C0483E
	for <parisc-linux@parisc-linux.org>; Tue, 25 Feb 2003 11:50:11 -0700 (MST)
Message-Id: <200302251850.h1PIo5ji002929@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
To: jsoe0708@tiscali.be (Joel Soete)
Date: Tue, 25 Feb 2003 13:50:04 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@parisc-linux.org
In-Reply-To: <3E5A232800000729@ocpmta8.freegates.net> from "Joel Soete" at Feb 25, 2003 07:32:24 pm
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

> int main(int argc, char * * argv, char * * env) {
> 
>     spinlock_t MySpinLock __attribute__((__aligned__(64))) =SPIN_LOCK_UNLOCKED;
>     rwlock_t MyRWLock __attribute__((__aligned__(64))) = RW_LOCK_UNLOCKED;

This does not work.  The aligned attribute doesn't work for automatic
variables and never has.  Structures allocated on the stack are allocated
with alignment BIGGEST_ALIGNMENT.  This should be a FAQ.

BIGGEST_ALIGNMENT is 128 bits on the 64-bit ports.  It is 64 on the 32-bit
port.  It is 128 in debian gcc 3.0.4 but this broke the hpux ABI regarding
the placement of long doubles in structures.  Thus, this change was
reverted the GCC CVS source.

Spinlocks on PA 2.0 machines don't need special alignment, although you
may want to keep them in separate cache lines.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
