Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00045aedab24-CM.cpe.net.cable.rogers.com [24.112.227.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 81E8D482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Mar 2003 12:33:36 -0700 (MST)
Date: Mon, 24 Mar 2003 14:19:00 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [akpm@digeo.com: arch changes for file-offset-in-pte's]
Message-ID: <20030324191900.GA6324@systemhalted>
References: <200303241328.GAA02336@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200303241328.GAA02336@udlkern.fc.hp.com>
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

> Another possibility would be to split out the SWP_TYPE, SWP_OFFSET
> and SWP_ENTRY macros in order to have a 32 bit kernel version and a
> 64 bit kernel version. Then we could go with 16 swap devices for the
> 32 bit kernel and even increase the number of swap devices for the
> 64 bit kernel, since we have a huge number of bits for the offset.

My $0.02

a) Keep the swap size the same, and reduce the number of entries.

	= Offers better compatiblity in most situations

b) Split the macro's, keeping the swap size the same, and increase 
   the number of possible devices.

	= Offers size consistency, and benefits to 64-bit kernels.

c.
