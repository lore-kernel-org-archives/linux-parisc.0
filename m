Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 76C884A19
	for <parisc-linux@parisc-linux.org>; Fri,  2 Feb 2001 18:17:54 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14OrKm-0006rh-00; Sat, 03 Feb 2001 01:17:48 +0000
Date: Sat, 3 Feb 2001 01:17:48 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Christoph Plattner <christoph.plattner@dot.at>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Source of this version of rbootd-2.0-2
Message-ID: <20010203011748.F26452@parcelfarce.linux.theplanet.co.uk>
References: <3A7B5605.C08AA191@dot.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A7B5605.C08AA191@dot.at>; from christoph.plattner@dot.at on Sat, Feb 03, 2001 at 01:51:17AM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Feb 03, 2001 at 01:51:17AM +0100, Christoph Plattner wrote:
> Hi PA-RISCers !
> 
> Is there a source code of "your" binary version of the rbootd.
> Alle source of debian has the problem, that the file pcap.h is not
> found.

you need to `apt-get install libpcap-dev', then you will have a pcap.h
and can rebuild rbootd.

-- 
Revolutions do not require corporate support.
