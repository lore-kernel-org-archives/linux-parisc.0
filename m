Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id A1BF7482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 17 Apr 2002 19:59:18 -0600 (MDT)
Message-Id: <200204180159.g3I1xGQT015152@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-3.2 for parisc
To: jmccla3@gl.umbc.edu (James Mcclain)
Date: Wed, 17 Apr 2002 21:59:16 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.GSO.4.31L.02.0204171535110.2863-100000@solaris1.gl.umbc.edu> from "James Mcclain" at Apr 17, 2002 03:41:25 pm
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

> are you talking about the mainstream gcc 3.2 from the gcc cvs development
> tree?  i haven't been able to compile that at all.  i tried with my old

Yes.

> gcc 3.0.2 on my parisc box, and i also tried to cross compile it with the
> latest x86 cross compiler from the ftp.parisc-linux.org.

The trick as I recall is to compile stage1 with -O2.  You should also
build cvs binutils and install it first.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
