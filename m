Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6E5C2482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Aug 2001 08:33:14 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 0A325B00C; Tue, 28 Aug 2001 15:34:46 +0100 (BST)
Date: Tue, 28 Aug 2001 15:34:46 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] Users staying up to date.
Message-ID: <20010828153446.R7064@linuxcare.com>
References: <20010814154037.I25258@megatonmonkey.net> <20010815010034.K22144@parcelfarce.linux.theplanet.co.uk> <20010814215030.A26703@megatonmonkey.net> <20010815041610.M22144@parcelfarce.linux.theplanet.co.uk> <20010817155340.C8649@megatonmonkey.net> <20010828000748.G7064@linuxcare.com> <20010828002251.L28978@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010828002251.L28978@megatonmonkey.net>; from carlos@megatonmonkey.net on Tue, Aug 28, 2001 at 12:22:51AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 28, 2001 at 12:22:51AM -0400, Carlos O'Donell Jr. wrote:
> I'm currently trying to roll the toolchain from start to end, and 
> automate the process a little. BTW, is there any automation setup for
> building the toolchain? Does each developer just have their own way(tm)
> of doing the build?

Mostly we use the prebuild cross-compilers from the parisc-linux
website, or we use the prebuilt native pkgs from a debian archive.

Richard
