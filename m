Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A361F492D
	for <parisc-linux@parisc-linux.org>; Fri, 26 Oct 2001 19:22:14 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15xIAp-0006cl-00; Sat, 27 Oct 2001 02:22:07 +0100
Date: Sat, 27 Oct 2001 02:22:07 +0100
From: Matthew Wilcox <willy@debian.org>
To: Paul Bame <bame@fc.hp.com>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: python (toolchain really) problems
Message-ID: <20011027022207.B23520@parcelfarce.linux.theplanet.co.uk>
References: <E15xFJt-0006F5-00@noam.fc.hp.com> <20011027104824.C1050@bubble.sa.bigpond.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011027104824.C1050@bubble.sa.bigpond.net.au>; from amodra@bigpond.net.au on Sat, Oct 27, 2001 at 10:48:24AM +0930
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

On Sat, Oct 27, 2001 at 10:48:24AM +0930, Alan Modra wrote:
> BTW, I don't think lazy linking has ever been tested because dl-machine.h
> failed to define ELF_MACHINE_PLTREL_OVERLAP.  This had the unfortunate
> effect of always fully relocating .plt.

Ah, that explains why the glibc tests that required lazy linking to work
always failed.

-- 
Revolutions do not require corporate support.
