Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B12034850
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Jun 2002 07:36:36 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17KfdL-0003oG-00; Wed, 19 Jun 2002 14:36:27 +0100
Date: Wed, 19 Jun 2002 14:36:27 +0100
From: Matthew Wilcox <willy@debian.org>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] hppa64-linux-gcc not in gcc dpkg?
Message-ID: <20020619143627.K9435@parcelfarce.linux.theplanet.co.uk>
References: <1024493288.3d1086e89dfd2@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1024493288.3d1086e89dfd2@webmail.tiscalinet.be>; from joel.soete@freebel.net on Wed, Jun 19, 2002 at 03:28:08PM +0200
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

On Wed, Jun 19, 2002 at 03:28:08PM +0200, joel.soete@freebel.net wrote:
> To verify my ioctl32 patch for 64bit kernel I am just trying to compile last cvs
> kernel in 64bits on my b2000 (PA8600?). To do so, in make menu config, i choose
> procesor type PA8x00, 64bits kernel && 32bits PDC (because b2000).

what makes you think that you should use 32-bit PDC on b2000?

> But when I launch make dep, it failled because it did not find hpp64-linux-gcc?
> I search on http://www.debian.org/distrib/packages but no success?

get the packages from ftp://ftp.parisc-linux.org/unofficial-debs.

-- 
Revolutions do not require corporate support.
