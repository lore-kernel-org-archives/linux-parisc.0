Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp9.xs4all.nl (smtp9.xs4all.nl [194.109.127.135])
	by dsl2.external.hp.com (Postfix) with ESMTP id 891EC482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 23:32:52 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp9.xs4all.nl (8.9.3/8.9.3) with ESMTP id HAA05317
	for <parisc-linux@lists.parisc-linux.org>; Sat, 22 Sep 2001 07:32:51 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Sat, 22 Sep 2001 07:28:42 +0200
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problem installing new kernel
Message-ID: <20010922072842.A4157@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <000901c142ff$6bce2410$1900a8c0@aloha>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000901c142ff$6bce2410$1900a8c0@aloha>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Sep 22, 2001 at 02:42:12AM +0200, Tino Hirschmann wrote:
> Hi,
> 
> i got palinux-0.9.2 running on my HP 715/80. I compiled the kernel as
> discribed on the webpage.
> But what do i have to do after i did make palo ?
> I think make zlilo doesn't work here .-)
> 
Edit /etc/palo.conf and run /sbin/palo

Good luck,
Jurriaan
-- 
This phantom which lived in my mind possessed qualities which I thought must be
innate to a creature of such grace and intelligence.
...
This impossibly delightful creature is gone, and now is even hard to remember.
        Jack Vance - Lyonesse II - The Green Pearl
GNU/Linux 2.4.9-ac10 SMP/ReiserFS 2x1402 bogomips load av: 0.45 0.12 0.04
