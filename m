Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A8A804895
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Mar 2002 06:15:12 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16jKDF-00044D-00; Fri, 08 Mar 2002 13:15:09 +0000
Date: Fri, 8 Mar 2002 13:15:09 +0000
From: Matthew Wilcox <willy@debian.org>
To: Duraid Madina <duraid@fl.net.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 'foreign' PCI cards in an rp2430
Message-ID: <20020308131509.D22831@parcelfarce.linux.theplanet.co.uk>
References: <000301c1c654$78ae35c0$022a17ac@simplex>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000301c1c654$78ae35c0$022a17ac@simplex>; from duraid@fl.net.au on Fri, Mar 08, 2002 at 02:51:03PM +1100
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

On Fri, Mar 08, 2002 at 02:51:03PM +1100, Duraid Madina wrote:
> 	I'm wondering: Would I be able to use non-HP PCI cards in these
> systems, if they're supported under Linux? In particular, I'm wondering
> about 3ware IDE RAID cards (these work in (at least) alpha and x86
> linux) and Intel gigabit ethernet NICs (based on the 82554 chip).

*puts kernel hacker's hat on*
Sure!  All that stuff should work and if it doesn't it can be fixed.

*puts HP employee hat on*
Well, it might invalidate your warranty to put non-HP certified cards
in your system.

> 	And (no laughter, please) what's the maximum swap partition size
> parisc linux supports? Can parisc linux swap over NFS?

Forget about swapping over NFS.  It's prone to deadlock under
stress.  I think we support 2GB/file and up to 8 files, but I may be
underestimating... John would know.

-- 
Revolutions do not require corporate support.
