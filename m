Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id E9B0A482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  6 May 2001 09:53:39 -0600 (MDT)
Message-Id: <200105061553.LAA24403@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc 2.2.3: setjmp/longjmp
To: grundler@puffin.external.hp.com (Grant Grundler)
Date: Sun, 6 May 2001 11:53:28 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: drepper@cygnus.com, parisc-linux@lists.parisc-linux.org
In-Reply-To: <200105060707.BAA05978@puffin.external.hp.com> from "Grant Grundler" at May 6, 2001 01:07:56 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> Seems Matthew misunderstood the suggestion to use a static link.
> I also read jda's comment to mean statically link the target obj.
> It's clear now jda meant gdb.

The first was my original intent.  However, I also find gdb doesn't
crash as much when it is statically linked.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
