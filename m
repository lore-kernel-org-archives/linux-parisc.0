Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00207807b093-CM.cpe.net.cable.rogers.com [24.112.180.230])
	by dsl2.external.hp.com (Postfix) with ESMTP id A0D93482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Feb 2003 10:52:11 -0700 (MST)
Date: Tue, 11 Feb 2003 12:52:03 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Bad Max <badmax@club-internet.fr>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Tag Starvation on 715/100
Message-ID: <20030211175203.GA28989@systemhalted>
References: <yam9172.666.149231680@mail.club-internet.fr> <200302111731.h1BHV1at017679@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200302111731.h1BHV1at017679@hiauly1.hia.nrc.ca>
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

> I believe the problem is the driver is using too many tags on an old
> drive.  You want to cut the number or disable tagged queing in the
> driver for this drive.  Grant would know the details but early Seagates
> had buggy support for this feature.

I turn it off on my cluster of 715/50's because the drives of that era
just don't support it properly (e.g. random hardware lockups).

c.
