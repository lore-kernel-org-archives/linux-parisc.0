From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: No drives come online in 2.6.32?
Date: Sat, 26 Dec 2009 12:40:22 -0700
Message-ID: <20091226194022.GA3521@parisc-linux.org>
References: <119aab440912231819x621898d2lf2b58a3e27b86047@mail.gmail.com> <20091225234654.GA23763@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091225234654.GA23763@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Dec 25, 2009 at 04:46:55PM -0700, Grant Grundler wrote:
> On Wed, Dec 23, 2009 at 09:19:19PM -0500, Carlos O'Donell wrote:
> > When booting 2.6.32, my scsi drives don't come online, all I see during boot is:
> > ~~~
> > sym53c8xx 0000:00:01.0: enabling device (0000 -> 0003)
> > sym53c8xx 0000:00:01.0: enabling SERR and PARITY (0003 -> 0143)
> > sym53c8xx 0000:00:01.1: enabling device (0000 -> 0003)
> > sym53c8xx 0000:00:01.1: enabling SERR and PARITY (0003 -> 0143)
> > sym53c8xx 0000:00:02.0: enabling device (0000 -> 0003)
> > sym53c8xx 0000:00:02.0: enabling SERR and PARITY (0003 -> 0143)
> > sym53c8xx 0000:00:02.1: enabling device (0146 -> 0147)
> > ~~~
> > When booting 2.6.32-rc6 the drives come online right away after they
> > are enabled.
> > 
> > No amount of waiting helps.
> 
> Do you have CONFIG_SCSI_SCAN_ASYNC=y ?
> 
> If so, add CONFIG_SCSI_WAIT_SCAN=m or disable SCAN_ASYNC.
> 
> While this should work, it sounds like it's not working.

Huh?  The wait scan module will wait for scans to complete.  This sounds
like the scans are never starting.

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
