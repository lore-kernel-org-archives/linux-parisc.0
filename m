Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id A74684868
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  7 Jan 2004 14:04:29 -0700 (MST)
Message-Id: <200401072104.i07L4Pr1014569@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [Testers wanted] New glibc with profiling fixed.
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Wed, 7 Jan 2004 16:04:25 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <20040105194809.GA9269@systemhalted> from "Carlos O'Donell" at
	Jan 5, 2004 02:48:09 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> glibc 2.3.2.ds1-10
> 
> - Added profiling patches (Thanks Randolph!)

The GCC profiling tests still segfault.  It looks like crtn.o
hasn't been updated.  Did I miss something?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
