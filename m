Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly3.hia.nrc.ca (hiauly3.hia.nrc.ca [132.246.100.195])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5BADF4885
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Aug 2003 14:24:20 -0600 (MDT)
From: John David Anglin <dave@hiauly3.hia.nrc.ca>
Message-Id: <200308222024.QAA16264@hiauly3.hia.nrc.ca>
To: carlos@baldric.uwo.ca
Date: Fri, 22 Aug 2003 16:24:19 -0400 (EDT)
Cc: parisc-linux@lists.parisc-linux.org, dave.anglin@nrc-cnrc.gc.ca
In-Reply-To: <20030822144615.GF31872@systemhalted> from Carlos O'Donell at Aug "22," 2003 "10:46:15" am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Re: [glibc] fixing delayed exceptions in hppa
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

> I took this into account, and the fcpy of a non fr0 is working better
> than before precisely for the reasons you list your original email.
> 
> Should I instead spill the value into memory at dummy's address?

Based on what Jim Hull said, I believe that would be better.  I was using

  "fldd 0(%%sr0,%%sp),%0" : "=f" (d) : "0" (d)

There isn't a true dependency in the above but I believe that any load
to the destination register will raise the exception.

Dave
