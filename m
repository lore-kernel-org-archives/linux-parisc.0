Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 528D8482D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Jul 2003 11:13:39 -0600 (MDT)
Date: Wed, 16 Jul 2003 13:12:19 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] gcc 3.3 release x86->hppa64 failure?
Message-ID: <20030716171219.GC27716@systemhalted>
References: <20030716041435.GE5715@systemhalted> <200307160630.h6G6UCKq013487@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200307160630.h6G6UCKq013487@hiauly1.hia.nrc.ca>
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

> > Has anyone recently tried to bootstrap an x86->hppa64 cross-compiler?
> > I'm going with cvs binutils, cvs gcc -rgcc_3_3_release.
> > 
> > 'make boostrap'
> 
> 'make bootstrap'?  There is no way stage2 can work in a cross.

Erm. My mistake. I inadvertantly used 'make boostrap' in my build
script. Obviously not thinking since stage2 would not be able to build a
stage3 since it can't run the executable it builds.

c.
