Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id DC2BC4847
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Jul 2003 00:37:58 -0600 (MDT)
Message-Id: <200307160630.h6G6UCKq013487@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc 3.3 release x86->hppa64 failure?
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Wed, 16 Jul 2003 02:30:12 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030716041435.GE5715@systemhalted> from "Carlos O'Donell" at Jul 16, 2003 00:14:35 am
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

> Has anyone recently tried to bootstrap an x86->hppa64 cross-compiler?
> I'm going with cvs binutils, cvs gcc -rgcc_3_3_release.
> 
> 'make boostrap'

'make bootstrap'?  There is no way stage2 can work in a cross.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
