Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8465A482E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Nov 2002 15:45:42 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18FMYL-0005wF-00; Fri, 22 Nov 2002 22:45:37 +0000
Date: Fri, 22 Nov 2002 22:45:37 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Leif Harcke <lharcke@Stanford.EDU>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Tulip driver fails to advertise 100baseTx media capability
Message-ID: <20021122224537.D29028@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.44.0211221116130.28782-100000@chirp.Stanford.EDU> <lharcke@Stanford.EDU> <20021122220937.29082482B@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021122220937.29082482B@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Fri, Nov 22, 2002 at 03:09:37PM -0700
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

On Fri, Nov 22, 2002 at 03:09:37PM -0700, Grant Grundler wrote:
> On my a500 (64-bit) I get:
> gsyprf11:/usr/src/linux# mii-tool -v eth0
> SIOCGMIIPHY on 'eth0' failed: Invalid argument
> 
> Looks like we have some work to do for 64-bit.

SIOCGMIIPHY is unsupportable through ioctl32 -- the ioctl number is not
unique so we can't translate the arguments.  ethtool doesn't suffer from
this problem.

-- 
Revolutions do not require corporate support.
