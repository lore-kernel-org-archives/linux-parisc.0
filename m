Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 571E34829
	for <parisc-linux@parisc-linux.org>; Tue, 27 May 2003 05:11:55 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19KcMz-0002Ob-BH; Tue, 27 May 2003 12:11:53 +0100
Date: Tue, 27 May 2003 12:11:53 +0100
From: Matthew Wilcox <willy@debian.org>
To: Andries.Brouwer@cwi.nl
Cc: torvalds@transmeta.com, linux-kernel@vger.kernel.org,
	matthew@wil.cx, parisc-linux@parisc-linux.org
Message-ID: <20030527111153.GD15709@parcelfarce.linux.theplanet.co.uk>
References: <UTC200305262220.h4QMKo712570.aeb@smtp.cwi.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <UTC200305262220.h4QMKo712570.aeb@smtp.cwi.nl>
Subject: [parisc-linux] Re: [patch] kill lvm from parisc
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

On Tue, May 27, 2003 at 12:20:50AM +0200, Andries.Brouwer@cwi.nl wrote:
> CONFIG_BLK_DEV_LVM is gone, but there is still some associated code.
> This is the parisc part.

it's already gone from the parisc tree and will be picked up whenever
linus gets round to releasing 2.5.70 and we submit a patch.  please stop
resending.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
