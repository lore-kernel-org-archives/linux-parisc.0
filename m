Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D5CE4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 14:46:27 -0600 (MDT)
Message-Id: <200209202046.g8KKkGwj019921@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] SMP kernel problems on a D350
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Fri, 20 Sep 2002 16:46:16 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jeremyd@apptechsys.com, frts@simba.sch.bme.hu,
	grundler@dsl2.external.hp.com, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020920203724.GD24622@systemhalted> from "Carlos O'Donell" at Sep 20, 2002 04:37:24 pm
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

> When running an SMP kernel and doing multiple compiles, the 
> box was rather unsuable e.g. random process death.

Is there a way to turn off the unaligned handler?  It may be hiding
bad stuff going on in userland.  There are still cases where expect
causes a continuous sequence of unaligned faults.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
