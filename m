Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id ADE48482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Dec 2001 22:30:36 -0700 (MST)
Message-Id: <200112140525.WAA21618@puffin.external.hp.com>
To: "Edward Alfert" <edward@alfert.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] What keywords should I use to find the answer? 
In-Reply-To: Message from "Edward Alfert" <edward@alfert.com>
   of "Thu, 13 Dec 2001 23:08:42 EST." <001f01c18455$04d1cef0$0201a8c0@w2kpro>
Date: Thu, 13 Dec 2001 22:25:32 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

"Edward Alfert" wrote:
> Thanks... This is fun... 

cool!

> New kernel 2.4.19 is up and running... I'm able to use my monitor ...
> Initially I couldn't log in but found in the FAQ that I needed to
> "uncomment" tty0 from /etc/inittab ... By the way, there is no entry for
> tty0 in /etc/inittab, so I created one... So the FAQ shouldn't read
> "uncomment" but instead "create".

I punt. Met my web site hacking quota for the day...some substantial
updates to the 0.9.3 errata:
	http://www.parisc-linux.org/release-0.9/errata-093.html

(You do want to know how to avoid file corruption right?)

> The system is a C240 with FX4 video card (that's HP Visualize FX-4 with
> 18mb RAM) ... The GRAPHICS(4) is set to 1280 x 1024 @ 72Hz.

I don't think FX-4 is supported yet. Helger Deller or Thomas Bogendoerf
should be able to confirm in a few hours if no one else can.
Looks like we could use a seperate table for unsupported IO devices
and supported gfx on:
	http://www.parisc-linux.org/release-0.9/systems-093.html

grant
