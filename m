Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 408EA482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 May 2003 11:04:37 -0600 (MDT)
Message-Id: <200305221704.h4MH4Xgs011472@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [PATCH] HPPA Linuxthreads.
To: grundler@parisc-linux.org (Grant Grundler)
Date: Thu, 22 May 2003 13:04:33 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, drepper@redhat.com,
	libc-alpha@sources.redhat.com, parisc-linux@lists.parisc-linux.org,
	tausq@debian.org
In-Reply-To: <20030522162346.GA24335@dsl2.external.hp.com> from "Grant Grundler" at May 22, 2003 10:23:46 am
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

> If you have a test for this, it's not contending for the lock.
> Writing a test for this would probably be a good thing if
> there isn't already one. Note there is no fairness and a
> test would need to be sensitive to that.

Agreed.  The libc suite would probably be the best place for
such a test ;-)

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
