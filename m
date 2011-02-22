From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: binutils change break glibc build
Date: Tue, 22 Feb 2011 11:27:00 -0500
Message-ID: <20110222162700.GA7636@hiauly1.hia.nrc.ca>
References: <20110210200044.203164E01@hiauly1.hia.nrc.ca> <20110212161846.GA24076@hiauly1.hia.nrc.ca> <20110213193934.GA28834@hiauly1.hia.nrc.ca> <20110215015852.GA6615@hiauly1.hia.nrc.ca> <AANLkTimZntmJQ5msVr56=V7P8pYGXizpVGinZYrvBsSt@mail.gmail.com> <20110217003032.GA26155@hiauly1.hia.nrc.ca> <20110218184030.GA15510@hiauly1.hia.nrc.ca> <AANLkTimD=2ESSMormpZ+coo40GyLDYGeNPrwvdYVM61G@mail.gmail.com> <20110222001355.GA21523@hiauly1.hia.nrc.ca> <AANLkTi=noWe9hcpQotdCXz-K2kQL935Ha8rR6f1Lwt-h@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	James.Bottomley@hansenpartnership.com, linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=noWe9hcpQotdCXz-K2kQL935Ha8rR6f1Lwt-h@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 22 Feb 2011, Carlos O'Donell wrote:

> Excellent, does that mean that glibc does not create inequivalent
> aliases with all of its tom-foolery with mmap?

It's hard to say for sure.  The kernel message only occurs when a
data cache flush is needed for a specific page.  Typically, that's
when a segv or abort occurs.

I believe that we are still doing full cache flushes on exec, exit
and fork.  I tried recently to kill the flush on fork but the kernel
tried to kill init.  This needs more study.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
