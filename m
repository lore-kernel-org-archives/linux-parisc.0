Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (unknown [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id A4A094829
	for <parisc-linux@parisc-linux.org>; Wed, 11 Dec 2002 16:17:43 -0700 (MST)
Date: Wed, 11 Dec 2002 18:17:38 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] ["CSA Test Drive" <TestDrive@compaq.com>] FW: Some issues
Message-ID: <20021211231738.GA15513@systemhalted>
References: <20021211224404.GC15219@systemhalted> <200212112305.gBBN5Bdj021432@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200212112305.gBBN5Bdj021432@hiauly1.hia.nrc.ca>
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

> The code doesn't seem to trap on a A500 which I believe is a PA8500.

Could be a PA8600 too.

> I think we need to look at bits 0..1 of the coprocessor configuration
> register to determine instruction validity.  See table 8-6 on page 8-11.
> I can look at what the HP compiler does.  Up to now, we have assumed
> that all PA8000 machines have the same instruction set.

I'm building a new kernel right now to run the test on again.
My sociology exam is in a half-hour... I need a little break ;)

c.
