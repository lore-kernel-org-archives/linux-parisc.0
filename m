Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [RFC] Patch to handle parisc-device quirks/bugs. 
In-Reply-To: Message from Ryan Bradetich <rbradetich@uswest.net>
   of "17 Nov 2002 13:22:52 MST." <1037564572.27005.20.camel@beavis>
References: <1037559910.26816.9.camel@beavis> <20021117200021.E7530@parcelfarce.linux.theplanet.co.uk>  <1037564572.27005.20.camel@beavis> 
Date: Sun, 17 Nov 2002 13:48:20 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021117204821.026C1482E@dsl2.external.hp.com>
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

Ryan Bradetich wrote:
> > This scheme doesn't fix the device name printout, but that seems less
> > important.
> 
> The quirks fixes the print-outs, plus all these problems are fixed in
> one place, drivers do not even to know there was a problem.

For users, the name printout *is* important.
It helps determine which devices are really in the box and are supported.

grant
