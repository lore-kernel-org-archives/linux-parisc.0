Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 59FF64830
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Apr 2003 15:37:05 -0600 (MDT)
Message-Id: <200304252137.h3PLb16r014226@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Program counter from sigcontext, constructors
To: hans_boehm@hp.com (Boehm, Hans)
Date: Fri, 25 Apr 2003 17:37:01 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org,
	hans_boehm@hp.com
In-Reply-To: <75A9FEBA25015040A761C1F74975667D01442052@hplex4.hpl.hp.com> from "Boehm, Hans" at Apr 25, 2003 01:21:47 pm
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

> spe170> cc -fPIC -g constr.c
> spe170> ./a.out
> Segmentation fault

I'm unable to duplicate this on gsyprf11.  I tried several gcc versions.
I'm using glibc 2.3.1-15.  ld is version 2.13.90 20030210.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
