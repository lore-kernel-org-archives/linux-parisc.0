Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B1B4482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Apr 2001 18:29:35 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14kEhK-0007bc-00; Tue, 03 Apr 2001 01:29:26 +0100
Date: Tue, 3 Apr 2001 01:29:26 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: "van de Werken, Matthew (DEM, PH)" <M.Vandewerken@cat.csiro.au>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Getting Started...
Message-ID: <20010403012926.L11435@parcelfarce.linux.theplanet.co.uk>
References: <A8566E157F5FD411BCFB00D0B7816D514459E4@ntexchange.cat.csiro.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <A8566E157F5FD411BCFB00D0B7816D514459E4@ntexchange.cat.csiro.au>; from M.Vandewerken@cat.csiro.au on Tue, Apr 03, 2001 at 09:38:41AM +1000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Apr 03, 2001 at 09:38:41AM +1000, van de Werken, Matthew (DEM, PH) wrote:
> * These machines have no graphics output, how can I tell if they're alive?
> Serial cable to a terminal (9600-N-1)?

And disable both HW & SW flow control.  we use null-modem cables to our
PCs and minicom here, mostly.

-- 
Revolutions do not require corporate support.
