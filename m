Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cleo0.lancs.ac.uk (unknown [212.219.207.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id DF5DE482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 18 Apr 2002 05:35:34 -0600 (MDT)
Received: from name1.st-aidans.cumbria.sch.uk ([212.219.204.44])
 by cleo0.lancs.ac.uk (Sun Internet Mail Server sims.4.0.1999.06.13.00.20)
 with ESMTP id <0GUR00L3LHJ8S2@cleo0.lancs.ac.uk> for
 parisc-linux@lists.parisc-linux.org; Thu, 18 Apr 2002 12:35:32 +0100 (BST)
Received: from NETADMIN2.st-aidans.cumbria.sch.uk (s-clarob@[10.106.17.19])
	by name1.st-aidans.cumbria.sch.uk (8.9.3/8.9.3) with ESMTP id MAA12678	for
 <parisc-linux@lists.parisc-linux.org>; Thu, 18 Apr 2002 12:33:18 -0400
Date: Thu, 18 Apr 2002 12:31:00 +0100
From: s-clarob@st-aidans.cumbria.sch.uk
To: parisc-linux@lists.parisc-linux.org
Message-id: <5.1.0.14.0.20020418121812.00a597f0@10.106.16.2>
MIME-version: 1.0
Content-type: text/plain; format=flowed; charset=us-ascii
Subject: [parisc-linux] Black Box
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

I have just bought an old 712/60 yesterday, download the latest ISO and 
installed it .

Quite impressed since I usually run Mandrake 8.1 on Intel equipmnet.

I fixed the XF86config to get the X Window server working with the frame 
buffer (after having to build fbset from source to find out what my setting 
should be). And sorted the mouse out.

The 712/60 is a little slow with gnome so I want to use Blackbox.

Does anyone have any experience with getting It to compile and install as I 
get some errors .

configure seems ok,

but the main make ends in

make[2]: *** [BaseDisplay.o] Error 1
make[2]: Leaving Directory `/home/robin/blackbox-0.61.1/src`
make[1]: *** [all-recursive] Error 1
make[1]: Leaving Directory `/home/robin/blackbox-0.61.1
make: *** [all-recursive-am] Error 2

Not being the worlds greatest programer I have no Idea where to start.

Anyone got it installed?

Thanks

Robin.
