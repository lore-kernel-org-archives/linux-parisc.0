Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9DF6D4846
	for <parisc-linux@parisc-linux.org>; Mon, 25 Feb 2002 21:25:38 -0700 (MST)
Message-Id: <200202260425.g1Q4PYOJ001214@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc (g++) problem
To: jeremyd@apptechsys.com (Jeremy Drake)
Date: Mon, 25 Feb 2002 23:25:34 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <Pine.LNX.4.33L2.0202251907560.6941-100000@eiger.apptechsys.com> from "Jeremy Drake" at Feb 25, 2002 07:53:40 pm
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

> Here's the problem.  This program segfaults when compiled with -fPIC, as
> required to build a .so.  It is fine when compiled without -fPIC.  It is
> also fine on intel platform with both.  Is there something wrong with the
> code that I'm not seeing, or is this a compiler bug?  I have tried this
> with gcc-3 on an intel box, and it is fine, so I assume it is this port?

It's probably a compiler bug.  The code works ok with my 3.1 test version.
I think the problem may be the restoration of the pic offset table register
after function calls.

Suggest trying the debian 3.1 prerelease build.  Search the list to find
how to get it.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
