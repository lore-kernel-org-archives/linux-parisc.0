Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id B182D4831
	for <parisc-linux@lists.parisc-linux.org>; Sat,  4 Jan 2003 23:19:47 -0700 (MST)
Message-Id: <200301050619.h056JdDN017760@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] do_page_fault() infinite loop running 2.4.20-pa18 #9 SMP
To: grundler@dsl2.external.hp.com (Grant Grundler)
Date: Sun, 5 Jan 2003 01:19:39 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030105055118.GC14817@dsl2.external.hp.com> from "Grant Grundler" at Jan 4, 2003 10:51:18 pm
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

> Perhaps a user space signal handler is interfering?

I believe expect uses alarm to handle timeouts.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
