Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 464CC4845
	for <parisc-linux@lists.parisc-linux.org>; Tue, 30 Sep 2003 07:30:03 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h8UDHNq08517;
	Tue, 30 Sep 2003 09:17:23 -0400
Subject: Re: [parisc-linux] MAX_ADDRESS.
From: James Bottomley <James.Bottomley@steeleye.com>
To: knaresh@india.hp.com
Cc: Matthew Wilcox <willy@debian.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <3F7975FE.58C276D9@india.hp.com>
References: <3F7915A7.1F54379@india.hp.com>
	<20030930120636.GV24824@parcelfarce.linux.theplanet.co.uk>
	<3F7975FE.58C276D9@india.hp.com>
Content-Type: text/plain
Date: 30 Sep 2003 08:17:22 -0500
Message-Id: <1064927843.2065.3.camel@mulgrave>
Mime-Version: 1.0
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

On Tue, 2003-09-30 at 07:24, Naresh wrote:
> MAX_ADDRESS has nothing to do with DISCONTIGMEM. Its definition is generic(
> pgtable.h), although it is not used anywhere. I just happened to see the comment in
> the DISCONTIGMEM code. Even if DISCONTIGMEM is turned off, there is no check for
> MAX_ADDRESS before the call to 'map_pages()' in 'pagetable_init( )', which is why I
> would like to know if MAX_ADDRESS can be ignored.

No.  It does represent the highest virtual address possible.

Linux has 3 levels of page tables, so on a 64 bit kernel (8 bytes per
pte and 8 bytes per pte page pointer etc), we can address a maximum of
512GB with 4k pages.

James
