Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id C2A48482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Jan 2002 09:08:19 -0700 (MST)
Message-Id: <200201251608.g0PG8GQx023975@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] g++ problem with `std' namespace
To: ingram@symsys.com (Greg Ingram)
Date: Fri, 25 Jan 2002 11:08:16 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.21.0201250940350.1690-100000@maestro.symsys.com> from "Greg Ingram" at Jan 25, 2002 09:54:46 am
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

> they all have gcc 2.95.x while my parisc box has gcc 3.0.x.  Is this a
> parisc problem, a gcc problem, or a coder problem?

It's a coder problem.  Y'll have to read up on libstdc++.  Gcc 3.X has
a new more library implementation.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
