Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B75F482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Jan 2002 11:18:43 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16QYAT-0000O4-00; Tue, 15 Jan 2002 18:18:41 +0000
Date: Tue, 15 Jan 2002 18:18:41 +0000
From: Matthew Wilcox <willy@debian.org>
To: Randolph Chung <randolph@tausq.org>
Cc: Jochen Friedrich <jochen@scram.de>, linux-tr@linuxtr.net,
	HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] IBM TR patch
Message-ID: <20020115181841.G19567@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.43.0201142041450.7418-200000@alpha.bocc.de> <20020115181158.GT3247@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020115181158.GT3247@tausq.org>; from randolph@tausq.org on Tue, Jan 15, 2002 at 10:11:58AM -0800
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

On Tue, Jan 15, 2002 at 10:11:58AM -0800, Randolph Chung wrote:
> > Additionally, i added a switch to turn off IPv4 summing. This might be 
> > needed for IPv6 and is absolutely necessary on HP PARISC platform with the 
> > current broken ioremap implementation. The IPv4 summing is the only place 
> > in the driver that accesses memory directly without the readX or 
> > memcpy_fromio macros.
> 
> How is ioremap broken? (Just curious). From what I understand ioremap is
> currently a nop in the parisc-linux vm/io design.

it's not broken, the assumptions in ibmtr are.  after you've ioremapped
a region, you can call readb/writeb on it.  ibmtr assumes you can just
do direct memory accesses.  now, this is something we want to fix,
but it's not a bug in the PA code.

-- 
Revolutions do not require corporate support.
