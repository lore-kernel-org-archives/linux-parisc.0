Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 60D1C482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Apr 2002 10:32:02 -0700 (MST)
Message-Id: <200204051731.g35HVwSq014375@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 64bit newbie question
To: xam@cs.ucc.ie (M. Grabert)
Date: Fri, 5 Apr 2002 12:31:57 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, climent@stybba.ntc.nokia.com,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.44.0204051807500.29150-100000@sal.ucc.ie> from "M. Grabert" at Apr 5, 2002 06:11:28 pm
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

> What are the issues why no 64bit userland is supported yet ?
> (Besides too many bugs in the compiler ?) Is this difficult to archive?

Too many bugs in the compiler?  The 64-bit testsuite results under
hpux aren't that bad:-)  I posted new results yesterday:
<http://gcc.gnu.org/ml/gcc-testresults/2002-04/msg00160.html>.  Still
lots of work to do but I don't think there are any show stoppers.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
