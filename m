Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7B02B4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Sep 2002 20:19:59 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17uOFw-0007N5-00; Thu, 26 Sep 2002 03:19:56 +0100
Date: Thu, 26 Sep 2002 03:19:56 +0100
From: Matthew Wilcox <willy@debian.org>
To: Steve.Grady@csiro.au
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] EISA 100 Base-T Ethernet card drivers
Message-ID: <20020926031956.A5179@parcelfarce.linux.theplanet.co.uk>
References: <49AA3A3C863E5B4C911320AEF99E5DA3010CCCE0@wing-ep.tip.csiro.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <49AA3A3C863E5B4C911320AEF99E5DA3010CCCE0@wing-ep.tip.csiro.au>; from Steve.Grady@csiro.au on Thu, Sep 26, 2002 at 11:05:31AM +1000
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

On Thu, Sep 26, 2002 at 11:05:31AM +1000, Steve.Grady@csiro.au wrote:
> Are there drivers available for EISA 100 Base-T cards such are the HP
> A4308A.
> If there are what is the driver called and is there anything I need to know
> in
> getting it to work on my D370.

this chip is the 82556, which is apparently AKA the "EtherExpress PRO/100
Smart".  I don't know what's so smart about it, but the eepro100 driver
doesn't claim to support it.  I think you're out of luck.

-- 
Revolutions do not require corporate support.
