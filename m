Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5A9494852
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 21 Feb 2004 11:24:38 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1Aubno-0006oS-Hg; Sat, 21 Feb 2004 18:24:36 +0000
Date: Sat, 21 Feb 2004 18:24:36 +0000
From: Matthew Wilcox <willy@debian.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] Hanging with kernels >= 2.4.22
Message-ID: <20040221182436.GM11824@parcelfarce.linux.theplanet.co.uk>
References: <20040218235225.GA1623@calypso>
	<20040219062907.GC13916@colo.lackof.org>
	<20040221075849.GA1642@calypso>
	<20040221170508.GB14198@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040221170508.GB14198@baldric.uwo.ca>
Sender: <willy@www.linux.org.uk>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Feb 21, 2004 at 12:05:09PM -0500, Carlos O'Donell wrote:
> > Thanks! Changing NCR_700_MAX_TAGS to 1 in drivers/scsi/53c700.h did the
> > trick. Will I now have poor disk performance? If so, might I get away
> > with setting it to something higher, like 2 or 4, maybe?
> 
> I could never run IO stably at anything higher than 1. The drives don't
> seem to handle it properly, the error recovery mechanisms seem less
> than perfect, and the box just hangs.

So, um, maybe we should change the default?  Nobody seems to be
investigating why this happens, so I don't see why our users should
suffer.  I doubt anyone's going to be terribly motivated to track this
problem down for such old machines, so let's just sacrifice a little
performance for stability.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
