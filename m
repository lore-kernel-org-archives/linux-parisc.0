Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (p508455F9.dip.t-dialin.net [80.132.85.249])
	by dsl2.external.hp.com (Postfix) with ESMTP id BFC35482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Jan 2002 17:43:34 -0700 (MST)
Date: Fri, 18 Jan 2002 01:40:27 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Arjen Hommersom <arjenh@chello.nl>
Cc: Thibaut VARENE <varenet@esiee.fr>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 0.9.3 on a graphics console
Message-ID: <20020118014027.B4257@solo.franken.de>
References: <117AF172-0904-11D6-AEFA-0030656F07A2@esiee.fr> <3C47ABFF.3090102@chello.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C47ABFF.3090102@chello.nl>; from arjenh@chello.nl on Fri, Jan 18, 2002 at 06:00:47AM +0100
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

On Fri, Jan 18, 2002 at 06:00:47AM +0100, Arjen Hommersom wrote:
> Ah, that works, linux is up and running now :) Upgrading to 2.4.16-32 
> even allows me to use a  graphics console, so thats all great. However, 
> i do not see the penguin while booting and XFree doesnt seem to work, so 
> i suppose the framebuffer device doesn't work (?)

correct, FX cards aren't supported by the framebuffer device, because I don't
have documentation for them.

> I found in the mailinglist archive the thread "XFree86 on B180" that 
> suggests it might work if you treat this card as an 'artist graphics 
> card'. I'd be more than happy to test that if someone could give me some 
> details on how to do that.

no way, I tried to treat my FX6 as something, which already works. But no
luck.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
