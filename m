Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4F1494841
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Feb 2002 11:05:26 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16fPV6-0006SV-00; Mon, 25 Feb 2002 18:05:24 +0000
Date: Mon, 25 Feb 2002 18:05:24 +0000
From: Matthew Wilcox <willy@debian.org>
To: "FAUCHER,DENNIS (HP-USA,ex1)" <dennis_faucher@hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] tsocks Error
Message-ID: <20020225180524.C20667@parcelfarce.linux.theplanet.co.uk>
References: <2F1E6AB90ECAD311943700A0C9E3B15408002AA8@xatl03.atl.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <2F1E6AB90ECAD311943700A0C9E3B15408002AA8@xatl03.atl.hp.com>; from dennis_faucher@hp.com on Mon, Feb 25, 2002 at 08:51:57AM -0800
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

On Mon, Feb 25, 2002 at 08:51:57AM -0800, FAUCHER,DENNIS (HP-USA,ex1) wrote:
> Hello,
> 
> Has anyone used tsocks successfully?  I just installed the latest with
> apt-get (tsocks version 1.7-4) and receive the following error on use:
> 
> relocation error: /usr/lib/libtsocks.so: undefined symbol: $$dyncall

This tends to indicate the package was built wrongly -- eg linked with ld
instead of with gcc.  everyone around here uses dante rather than tsocks.
Unfortunately, this package was built before anyone was using the build
log system, so I can't tell what it did.

-- 
Revolutions do not require corporate support.
