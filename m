Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from daedalus.cs.brandeis.edu (daedalus.cs.brandeis.edu [129.64.3.179])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D1FF482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 09:27:24 -0700 (MST)
Received: (from aaronm@localhost)
	by daedalus.cs.brandeis.edu (8.9.3/8.9.3) id LAA25423
	for parisc-linux@lists.parisc-linux.org; Fri, 11 Jan 2002 11:27:22 -0500
Date: Fri, 11 Jan 2002 11:27:22 -0500
From: Aaron Macks <aaronm@cs.brandeis.edu>
To: PARISC-Linux <parisc-linux@lists.parisc-linux.org>
Message-ID: <20020111112722.F25350@daedalus.cs.brandeis.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 715/33 mount problems
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

So I finally got my 715/33 to boot off of cd and did all of the
partitioning fun, but on trying to copy the kernel and base system
from the cd to the hd, it could not mount the cdrom again. I was
initially using a NEC 4x cd, but then tried an Apple(sony) 2x and a
misc 4x.  no change.  The errors change, but are sometimes a missing
media error(happens quickly) or a set of SCSI errors(ends with
panic).  I neglected to write those down, but I'll reproduct sunday or
monday
thanks
Aaron
ps the 755 works beautifully with LAM as part of my beowulf, thanks
-- 
_______________________________________________________
Aaron Macks(aaronm@cs.brandeis.edu)
My sheep has seven gall bladders, that makes me the King of the Universe!
