Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 654874829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Feb 2003 08:37:16 -0700 (MST)
Message-Id: <200302061537.h16Fb8av028902@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] B132L: Success and thanks!
To: asp@ungod.com (Aaron St. Pierre)
Date: Thu, 6 Feb 2003 10:37:07 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jbglaw@lug-owl.de, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030206131451.GB5012@hadron> from "Aaron St. Pierre" at Feb 6, 2003 08:14:51 am
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

> It has been suggested to keep a version of gcc-3.0 around (gcc-3.2 gets
> installed w/ sid ) and perhaps use that to build your kernels. 
> I am not sure is this is a requirement any longer. 

There were two patches installed in the 3.2 branch last weekend to address
the kernel miscompilation.  They are in 3.2.2 released this week.  The main
problem was fixed in 3.3 and the main by a series of patches installed in
the later half of 2002.

Randolph Chung and Grant Grundler reduced the problems to simple testcases.
Eric Botcazou diagnosed both problems.  Eric and Franz Sirl determined the
patch set needed.  Randolph, Franz and myself helped with testing.

It was quite an intensive bit of work resolving this problem and getting
it into 3.2.2.  All those who participated deserve a vote of thanks.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
