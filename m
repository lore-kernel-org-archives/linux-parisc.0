Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 269984829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Dec 2002 16:40:38 -0700 (MST)
Message-Id: <200212112340.gBBNeVPA021527@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Solved: Kernel crash when loggin in via ssh
To: xam@cs.ucc.ie (M. Grabert)
Date: Wed, 11 Dec 2002 18:40:31 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.44.0212112313290.861-100000@sal.ucc.ie> from "M. Grabert" at Dec 11, 2002 11:29:45 pm
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

> > > Yes, it might be a gcc issue ... haven't thought of that ...
> > > I'll try to recompile the latest kernel with a gcc-3.0.4 - tomorrow!
> 
> It IS a gcc issue.

That is not sufficient proof.  Just because code "works" with one compiler
version, doesn't mean that there isn't a problem with the code.  Someone
actually has to produce a sample of miscompiled code.  The debian 3.0.4
is not a supported version of gcc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
