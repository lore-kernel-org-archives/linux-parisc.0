Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4E4BB483C
	for <parisc-linux@lists.parisc-linux.org>;
	Sun,  4 Apr 2004 15:39:51 -0600 (MDT)
Date: Sun, 4 Apr 2004 15:39:49 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Domain Validation or gcc 3.3.3 bug?
Message-ID: <20040404213949.GA14004@colo.lackof.org>
References: <20040404072311.GA2650@colo.lackof.org>
	<20040404141353.GS16469@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040404141353.GS16469@parcelfarce.linux.theplanet.co.uk>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Apr 04, 2004 at 03:13:53PM +0100, Matthew Wilcox wrote:
> 2.1.18f doesn't have domain validation

ah ok.
>  ... you must have downgraded to
> an earlier version of the sym2 driver.

Certainly not intentionally.
I'm using "cvs up" with "update -Pd" in my .csvrc.
My linux-2.6 source tree on ion also has (2.6.5-rc3-pa3 based) "sym-2.1.18f".
I just ran cvs up again on "ios" and now have 2.6.5-pa0 with sym-2.1.18j.

thanks,
grant
