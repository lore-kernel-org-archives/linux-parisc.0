Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from arroz.onshored.com (arroz.onshored.com [216.220.101.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7B6AB482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  7 Apr 2001 15:21:55 -0600 (MDT)
Sender: apharris@burrito.onshore.com
To: "Paul J.Y. Lahaie" <pjlahaie@linuxcare.com>
Cc: debian-boot@lists.debian.org, parisc-linux@lists.parisc-linux.org
References: <20010405155605.D8907@achilles.net>
From: Adam Di Carlo <adam@onshore.com>
Date: 07 Apr 2001 17:22:13 -0400
In-Reply-To: <20010405155605.D8907@achilles.net>
Message-ID: <oa4rw05rsq.fsf@arroz.fake>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: Woody installer for PARISC
List-ID: <linux-parisc.vger.kernel.org>

"Paul J.Y. Lahaie" <pjlahaie@linuxcare.com> writes:

> Here are the changes I've made to the boot-floppies package to support
> the PARISC architecture.

Glad to hear it.  Let me know if you don't have an account on
cvs.debian.org and you want a debian-boot pserver account.  You can
crypt a username/password with my Debian PGP key (aph@debian.org) and
send it to me privately and I can create that.

> utilities/dbootstrap/main_menu.c:
> - Remove options that aren't applicable to PARISC.
>   (Make boot floppy, PCMCIA, etc..)

> utilities/dbootstrap/partition_config.c:
> - Add PALO message for partition creation.
> 
> 
> There are a few more changes I needed to make to get a working installer
> for PARISC, unfortunately some of them are because of limitations in
> the current PARISC distribution (kernel.sh was modified to not require
> a kernel .deb since we currently don't have one and the constantly
> changing kernel makes it unwieldy to build kernel .debs).

Wait a minute... you don't have a kernel nor a boot-disk?  How do
people boot?

-- 
.....Adam Di Carlo....adam@onshore.com.....<URL:http://www.onshored.com/>
