Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id A10654845
	for <parisc-linux@lists.parisc-linux.org>; Sat, 22 Jun 2002 13:54:45 -0600 (MDT)
Message-Id: <200206221953.g5MJrIHe000465@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] PA8000 modutils problems
To: joel.soete@freebel.net (Joel Soete)
Date: Sat, 22 Jun 2002 15:53:18 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: xam@cs.ucc.ie, parisc-linux@lists.parisc-linux.org,
	bruno_vidal@hpfrcu03.france.hp.com
In-Reply-To: <3D14BC72.3010909@freebel.net> from "Joel Soete" at Jun 22, 2002 06:05:38 pm
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

> Some weeks ago I also try to compile the kernel (32bits) with gcc-3.1 
> (cvs) and eventhought it boots fine there was a problem
> with network connections (as well telnet which uses inetd as well as ssh
> which using its own sshd; this confirm the problem of compilation in 
> network interface). Is this problem solved now?

Not that I am aware of.  Maybe some of the debian folks have tried looking
into it as they were talking about moving to a newer compiler release.  
If it is a compiler problem, I would need a test case showing the
miscompilation and preferably a filed PR.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
