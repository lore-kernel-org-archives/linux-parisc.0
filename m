Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id A05D7482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Jul 2003 23:43:51 -0600 (MDT)
Message-Id: <200307180538.h6I5cdAI024133@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] arch/parisc/kernel/perf_asm.o not building
To: acme@conectiva.com.br (Arnaldo Carvalho de Melo)
Date: Fri, 18 Jul 2003 01:38:39 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030718041440.GZ1582@conectiva.com.br> from "Arnaldo Carvalho de Melo" at Jul 18, 2003 01:14:40 am
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

> 2.6-bk (i.e. latest linus tree in master.kernel.org), using the
> xc-20020118.tar.bz2 cross compiler (latest):

This doesn't work as it doesn't have all the necessary parisc-linux
patches.  Use the parisc-linux source.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
