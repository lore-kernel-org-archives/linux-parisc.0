From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: No drives come online in 2.6.32?
Date: Sun, 27 Dec 2009 01:02:36 -0700
Message-ID: <20091227080236.GB29557@lackof.org>
References: <119aab440912231819x621898d2lf2b58a3e27b86047@mail.gmail.com> <20091225234654.GA23763@lackof.org> <20091226194022.GA3521@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Carlos O'Donell <carlos@systemhalted.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Matthew Wilcox <matthew@wil.cx>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091226194022.GA3521@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Dec 26, 2009 at 12:40:22PM -0700, Matthew Wilcox wrote:
> > > ~~~
> > > When booting 2.6.32-rc6 the drives come online right away after they
> > > are enabled.
> > > 
> > > No amount of waiting helps.
> > 
> > Do you have CONFIG_SCSI_SCAN_ASYNC=y ?
> > 
> > If so, add CONFIG_SCSI_WAIT_SCAN=m or disable SCAN_ASYNC.
> > 
> > While this should work, it sounds like it's not working.
> 
> Huh?  The wait scan module will wait for scans to complete.  This sounds
> like the scans are never starting.

Doh...you are right. WAIT_SCAN won't matter/help.
He should still disable SCAN_ASYNC as a test.

thanks,
grant
