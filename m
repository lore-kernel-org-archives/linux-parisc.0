Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id B6EA5482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Mar 2003 06:28:08 -0700 (MST)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel9.hp.com (Postfix) with ESMTP id D95711C00AF3
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Mar 2003 08:28:07 -0500 (EST)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_26305+JAGae58098)/8.9.3 SMKit7.01) id GAA02336
	for parisc-linux@lists.parisc-linux.org; Mon, 24 Mar 2003 06:28:07 -0700 (MST)
Date: Mon, 24 Mar 2003 06:28:07 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200303241328.GAA02336@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [akpm@digeo.com: arch changes for file-offset-in-pte's]
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

> FYI.  jsm, any comments?

It doesn't appear to be a problem, since the bit comes out of the swap
entry bits, not the "present" bits, which we don't have any more available
(e.g. _PAGE_FILE can overload _PAGE_ACCESSED, since _PAGE_ACCESSED is
only valid when _PAGE_PRESENT is set).

The main issue is whether to take the bit out of the swap offset or swap
type. i386 went from 24 offset bits and 6 type bits to 24 offset bits and
5 type bits, i.e. they took the bit from the type field. We are currently
at 25 offset bits and 5 type bits.

The offset bits control the maximum swap size for each swap device. The
type bits control the number of possible swap devices. So, one possibility
is to reduce the number of possible swap devices from 32 to 16, rather
than decrease the maximum swap size. But, perhaps since limiting the
maximum swap size would only really have an effect on the 32 bit kernel,
perhaps it would better to leave the maximum number of swap devices at
32 and decrease the maximum swap size (i.e. the maximum swap size
for a swap device would decrease from 128 Gb to 64 Gb for a 32 bit
kernel). This would be the same as i386.

Another possibility would be to split out the SWP_TYPE, SWP_OFFSET
and SWP_ENTRY macros in order to have a 32 bit kernel version and a
64 bit kernel version. Then we could go with 16 swap devices for the
32 bit kernel and even increase the number of swap devices for the
64 bit kernel, since we have a huge number of bits for the offset.

Any opinions?

John
