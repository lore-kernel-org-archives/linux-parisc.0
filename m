Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD951C253.dip.t-dialin.net [217.81.194.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1A6364831
	for <parisc-linux@lists.parisc-linux.org>; Sun,  6 Jan 2002 15:29:29 -0700 (MST)
Date: Sun, 6 Jan 2002 23:29:08 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Christian Suder <csuder@cisco.com>
Cc: sven.cronenberg@web.de, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PALinux on HP9000/735-125
Message-ID: <20020106232908.B19425@solo.franken.de>
References: <3C388C82.6070509@web.de> <20020106201346.A14927@solo.franken.de> <20020106133432.08684bb1.csuder@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020106133432.08684bb1.csuder@cisco.com>; from csuder@cisco.com on Sun, Jan 06, 2002 at 01:34:32PM -0800
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

On Sun, Jan 06, 2002 at 01:34:32PM -0800, Christian Suder wrote:
> I think it should work to boot HPUX, get the correct EISA .cfg file and
> use the eisa_config utility. The configuration is actually stored in an

but that's not enough. I did that and setup the card with HPUX, but it's
still unconfigured, when Linux finds it. The .cfg describes how to
configure the different card parameters, eisa_config puts the selected
params to a nvram, and some other part does the real card poking
during kernel startup. Other platforms have that card poking stuff
included into the firmware.

It isn't a big deal to do the card setup itself, because .cfg includes
everything needed. It's more a problem of getting that information
during the kernel startup. If we know the nvram setup and how stuff
gets put there, we could read that and do the card setup from within
the Linux kernel. But I haven't found anything about that, yet.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
