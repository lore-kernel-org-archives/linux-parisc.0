Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD951C253.dip.t-dialin.net [217.81.194.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id 57662483B
	for <parisc-linux@lists.parisc-linux.org>; Sun,  6 Jan 2002 12:16:35 -0700 (MST)
Date: Sun, 6 Jan 2002 20:13:46 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Sven Cronenberg <sven.cronenberg@web.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PALinux on HP9000/735-125
Message-ID: <20020106201346.A14927@solo.franken.de>
References: <3C388C82.6070509@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C388C82.6070509@web.de>; from sven.cronenberg@web.de on Sun, Jan 06, 2002 at 06:42:26PM +0100
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

On Sun, Jan 06, 2002 at 06:42:26PM +0100, Sven Cronenberg wrote:
> - I tried execessing the framebufferdevice. 'fbset' report '/dev/fb0: no 
> such device'
>   though the STI console works fine as a text-console. Whats the reasion 
> for that error?

crx48z is untested, so we don't try to use it in framebuffer mode. There
is a check in drivers/video/stifb.c which refuses untested cards (search
for Hack). Just remove that check and see what happens.

>   Can I currently use the framebuffer device on the HP9000/735?

if you build your own kernel with the check removed, it might work.

> - has someone been able to make the 100mbit EISA-ethernet-card 3c597 work
>   in the HP9000/735 under Linux?

IMHO no EISA card will work at the moment. During the weekend I tried
to get an Adapatec 1742 card going in my B132, and the problem is,
that the pdc doesn't initialize EISA cards. Looks like that is done
by HPUX. So before any EISA cards will work, we need something like 
that for Linux, too.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
