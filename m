Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 59559482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Jan 2002 16:53:48 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16Vi4R-0007tN-00; Tue, 29 Jan 2002 23:53:47 +0000
Date: Tue, 29 Jan 2002 23:53:47 +0000
From: Matthew Wilcox <willy@debian.org>
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] STI Video stuff dependant on PCI?
Message-ID: <20020129235347.C26142@parcelfarce.linux.theplanet.co.uk>
References: <20020129174125.K1945@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020129174125.K1945@systemhalted>; from carlos@baldric.uwo.ca on Tue, Jan 29, 2002 at 05:41:25PM -0500
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

On Tue, Jan 29, 2002 at 05:41:25PM -0500, Carlos O'Donell Jr. wrote:
> STI Console is dependant on PCI
> 
> -> General Options -> PCI Support
> (CONFIG_PCI=n)
> 
> -> Console Drivers -> STI Console
> (CONFIG_STI_CONSOLE=y)

Heh, you're right, I was wondering about that earlier :-)

Actually, a recent change renamed pci_hwpath and moved the implementation
to drivers.c so it may well work now... try a cvs update.

-- 
Revolutions do not require corporate support.
