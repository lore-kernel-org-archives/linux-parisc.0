Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout05.sul.t-online.com (mailout05.sul.t-online.com [194.25.134.82])
	by dsl2.external.hp.com (Postfix) with ESMTP id 96B6448B1
	for <parisc-linux@parisc-linux.org>; Sun,  3 Aug 2003 14:22:45 -0600 (MDT)
From: Alexander Gabert <pappy@nikita.ath.cx>
Date: Sun, 3 Aug 2003 22:22:18 +0200
To: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Message-ID: <20030803202217.GA16476@nikita.ath.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] grsecurity 1.9.11 patches for 2.4.21pa8
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

hi lists,

i just finished and tested the grsecurity porting of 1.9.11 to parisc.

http://nikita.ath.cx/users/pappy/grsecurity-parisc/parisc-linux-2.4.21-pa8-grsecurity-1.9.11.patch

it is supposed to be one of the last (if not the last) splitbrain grsecurity kernel patch to parisc-linux source.

Thanks to Randolph Chung (tausq), Matthew Wilcox (willy), pipacs, spender and all the other developers who helped me getting used to parisc-linux and the grsecurity patches, thus bridging the gap between the parisc-linux.org kernel and the vanilla tree for this security oriented linux patch.

i hope that 2.6.x will have parisc-linux melted into the mainstream kernel and thus grsecurity patches will apply natively to the kernel.

then this work will not be needed any more and i can sit back and relax.

thank you all,

Alex
-- 
A long-forgotten loved one will appear soon.
Buy the negatives at any price.
