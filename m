Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD951CAEE.dip.t-dialin.net [217.81.202.238])
	by dsl2.external.hp.com (Postfix) with ESMTP id 430604834
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Feb 2002 15:44:03 -0700 (MST)
Received: (from tsbogend@localhost)
	by solo.franken.de (8.11.6/8.11.6) id g1IMhq008066
	for parisc-linux@lists.parisc-linux.org; Mon, 18 Feb 2002 23:43:52 +0100
Date: Mon, 18 Feb 2002 23:43:52 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020218234352.A8033@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] STI errno 128
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

Maybe some of the HP insiders could help me find out, why STI doesn't
work on my B2600/FXe. What I need to know is what a errno == 128 returned
from init_graph() means ? Anybody ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
