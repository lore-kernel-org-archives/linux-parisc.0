Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 45D95482B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Jul 2003 14:12:56 -0600 (MDT)
Message-Id: <200307192012.h6JKCqCd002021@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 2.6.0-test1-pa1 crashes on 715/100
To: rscholz@hrzpub.tu-darmstadt.de (Ruediger Scholz)
Date: Sat, 19 Jul 2003 16:12:52 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3F199AB5.8010602@hrzpub.tu-darmstadt.de> from "Ruediger Scholz" at Jul 19, 2003 09:23:33 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> I tried to run 2.6.0-test1-pa1 on my machine but it crashes right after 
> "Freeing unused kernel memory". IAOQ says something bout 
> "canonicalize_funcptr_for_compare" so I will give gcc-3.2 a run to see 
> how far the kernel will get then.

Check the list for a kernel patch to avoid this.  The 3.2 branch has
canonicalize_funcptr_for_compare.  Debian 3.0.4 doesn't.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
