Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id EDF0B4829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  4 Apr 2003 15:12:37 -0700 (MST)
Message-Id: <200304042212.h34MCY3j001052@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Applications in 64 bits userspace
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Fri, 4 Apr 2003 17:12:33 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030404220745.GA32125@systemhalted> from "Carlos O'Donell" at Apr 4, 2003 05:07:45 pm
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

> > No.  The dynamic loader is still required to resolve some special
> > symbols.  I also think the file format is not quite right for
> > a static executable.  I'm sure that it would be possible to generate
> > a truly static binary but I'm not sure how much work is involved.
> 
> Special symbols?

See chapter 6 in PA-RISC 64-Bit Runtime Architecture Supplement.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
