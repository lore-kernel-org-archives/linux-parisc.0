Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id B5CBA4829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Mar 2003 12:26:33 -0700 (MST)
Date: Sat, 08 Mar 2003 11:04:59 -0800 (PST)
Message-Id: <20030308.110459.35972945.davem@redhat.com>
To: grundler@dsl2.external.hp.com
Cc: jsm@udlkern.fc.hp.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: RFC: mmap patch
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <20030308172439.GA10161@dsl2.external.hp.com>
References: <20030308063043.GB27859@dsl2.external.hp.com>
	<20030307.222945.32673395.davem@redhat.com>
	<20030308172439.GA10161@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
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

   From: grundler@dsl2.external.hp.com (Grant Grundler)
   Date: Sat, 8 Mar 2003 10:24:39 -0700
   
   After getting some sleep and thinking about how IOMMUs work on parisc,
   I've convinced myself the CPU caches are virtually tagged and
   virtually indexed.

Some quick googling suggests that they are physically tagged.

For example, see section 1.1 of the following paper:

	http://www.cs.washington.edu/homes/bershad/Papers/asplosVM.ps

It's an interesting paper btw too :-)
