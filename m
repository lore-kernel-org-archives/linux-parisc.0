Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from c007.snv.cp.net (h000.c007.snv.cp.net [209.228.33.228])
	by dsl2.external.hp.com (Postfix) with SMTP id 144384829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Feb 2003 14:25:40 -0700 (MST)
Mime-Version: 1.0
Message-Id: <a05111b06ba648c543776@[192.168.0.22]>
Date: Mon, 3 Feb 2003 16:16:40 -0500
To: parisc-linux@lists.parisc-linux.org
From: Aaron Macks <aaronm@cs.brandeis.edu.ml.to>
Content-Type: text/plain; charset="us-ascii" ; format="flowed"
Subject: [parisc-linux] FR issues on 735/125
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

It took a while, but it's up and installed, no problems with net 
install.  Now the problem is as follows, I cannot reset the FB, so if 
something uses it(like the NCURSES installer) and I do a soft reset, 
the image persists, even if something is drawn over it.  Any thoughts?
Aaron
-- 
_______________________________________________________
Aaron Macks(aaronm@cs.brandeis.edu) [http://wiglaf.cs-i.brandeis.edu/~aaronm]
My sheep has seven gall bladders, that makes me the King of the Universe!
