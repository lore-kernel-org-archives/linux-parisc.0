Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id C460A482D
	for <parisc-linux@parisc-linux.org>; Wed, 14 May 2003 16:24:54 -0600 (MDT)
Date: Wed, 14 May 2003 15:25:47 -0700
From: Randolph Chung <tausq@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] sym53c8xx.c
Message-ID: <20030514222547.GT548@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030514215849.GK6859@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030514215849.GK6859@parcelfarce.linux.theplanet.co.uk>
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

> The sym53c8xx driver is near to being removed from 2.6.  Can anyone think
> of a situation where we might still want it?  I'm concerned that maybe
> some of the fixes didn't go into the sym53c8xx_2 driver.  In particular,
> I'd like to know that the sym53c8xx_2 driver in 2.5 works on C3k (wide &
> narrow!) and A500.

it definitely works on a500 with 2.5, and on c3k (narrow & wide) with 
2.4. I am still not able to boot up my c3k with 2.5 because of the 
suckyio serial console problems :(

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
