Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (p50844931.dip.t-dialin.net [80.132.73.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 50769482A
	for <parisc-linux@parisc-linux.org>; Wed, 30 Jan 2002 14:20:11 -0700 (MST)
Date: Wed, 30 Jan 2002 22:19:39 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Tom <palinux@alaskatech.org>
Cc: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Odd kernel error
Message-ID: <20020130221939.A3166@solo.franken.de>
References: <Pine.LNX.4.33.0201291938520.3623-100000@goliath.alaskatech.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0201291938520.3623-100000@goliath.alaskatech.org>; from palinux@alaskatech.org on Tue, Jan 29, 2002 at 08:00:21PM -0900
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

On Tue, Jan 29, 2002 at 08:00:21PM -0900, Tom wrote:
> Compiling the latest from CVS (-pa16, I think) and at the final make, when
> gcc is actually doing the '-o vmlinux' I'm getting:
> 
> drivers/video/video.o: In function 'L1260':
> drivers/video/video.o(.init.text+0x2554): undefined reference to
> 'fbcon_sti'
> drivers/video/video.o(.init.text+0x255c): undefined reference to
> 'fbcon_sti'
> make: *** [vmlinux] Error 1

are you using " Advanced low level driver options" ? If yes, there is
a bug in driver/video/Config.in, which doesn't let you select fbcon sti
for advanced config. Turn off the Advanced low level thing and the link 
error should go away.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
