Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF4B5482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Apr 2001 11:22:24 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14n1d6-00023Z-00; Tue, 10 Apr 2001 18:08:36 +0100
Date: Tue, 10 Apr 2001 18:08:36 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Ulrich Drepper <drepper@cygnus.com>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	Matthew Wilcox <matthew@wil.cx>,
	Matt Taggart <taggart@carmen.fc.hp.com>, randolph@tausq.org,
	lamont@hp.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] rpc.lockd hangs  (was Re: portmap deb)
Message-ID: <20010410180836.A25123@parcelfarce.linux.theplanet.co.uk>
References: <20010406210401.7685C37CDB@carmen.fc.hp.com> <20010407001500.Z9198@linuxcare.com> <20010408202046.B19712@parcelfarce.linux.theplanet.co.uk> <20010409105606.C5790@linuxcare.com> <20010409152125.A15015@parcelfarce.linux.theplanet.co.uk> <20010410150351.N6992@linuxcare.com> <m3snjghesu.fsf@otr.mynet.cygnus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <m3snjghesu.fsf@otr.mynet.cygnus.com>; from drepper@redhat.com on Tue, Apr 10, 2001 at 09:58:57AM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Apr 10, 2001 at 09:58:57AM -0700, Ulrich Drepper wrote:
> Why should you need two macros?

I think you're missing the context here, Ulrich.  I'd prefer not to have
multiple implementations of syscall.  This discussion was about how to
have only _one_ implementation in glibc, not two.  I'm not sure we have
a solution to that yet.

-- 
Revolutions do not require corporate support.
