Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id DAF96482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 May 2003 14:10:43 -0600 (MDT)
Message-Id: <200305052010.h45KAgos029626@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Oops on 2.4.20-pa33
To: jbglaw@lug-owl.de (Jan-Benedict Glaw)
Date: Mon, 5 May 2003 16:10:41 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030505200251.GS27494@lug-owl.de> from "Jan-Benedict Glaw" at May 5, 2003 10:02:51 pm
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

> I've tried to compile/boot current 2.4.x CVS, but it Oopsed. I noted
> down what looked really important (this is, IAOQ, r02 and kernel
> addresses from stack). This is what I resolved out of System.map:
> 
> IAOQ:   10224658        __canonicalize_funcptr_for_compare
> r02:    101229d4        do_sigaction

The fix for this was discussed on the list previously.  There needs
to be some "void *" casts added to various function pointer comparisons.
Search on the above functions to find the thread.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
