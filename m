Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from goliath.alaskatech.org (cable-207-5-237-24.anchorageak.net [24.237.5.207])
	by dsl2.external.hp.com (Postfix) with ESMTP id 350F34854
	for <parisc-linux@parisc-linux.org>; Wed, 27 Feb 2002 10:44:14 -0700 (MST)
Date: Wed, 27 Feb 2002 08:35:51 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: <hplinux@eagle.grdl.noaa.gov>, <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] PA-RISC 0.9.3 + C200 + Visualize-EG = HPMC
In-Reply-To: <Pine.LNX.4.44.0202271717330.15229-100000@sal.ucc.ie>
Message-ID: <Pine.LNX.4.33.0202270832430.27753-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

> > The graphics card on my C200 is a Visualize-EG (A4450A) which is, I
> > believe, a GSC vs. PCI card. In any case, trying to start X blanks the
> > screen, then a few seconds later I get a High Priority Machine Check
> > error as the workstation locks up. Any insights or workarounds most
> > appreciated!
>
> that's the problem!
> I have a C240 with the same graphics card. It is (still) unsupported.
> You have to wait until s.o. develops a working driver (or implement
> it by yourself)

I've been fighting the same HPMC on my C180; I used the same XF86Config-4
file that works perfectly on the 715/100 I just got rid of, same versions
of everythig, etc. Mine has the onboard video, but I didn't think to look
into what it actually is.

Is there a simple way to tell what kind of video is in these? I'm at work,
so I don't have the machine in front of me to play with, testing commands,
but does something simple like 'fbset -i' tell you what's in there? Or
perhaps the appropriate line in dmesg says 'Visualize EG' or something?
