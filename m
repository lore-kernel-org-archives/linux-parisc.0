Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0BFF44840
	for <parisc-linux@lists.parisc-linux.org>; Sat, 14 Jun 2003 18:40:11 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19RLZ3-0008M9-4D; Sun, 15 Jun 2003 01:40:09 +0100
Date: Sun, 15 Jun 2003 01:40:09 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Cc: parisc-linux@lists.parisc-linux.org,
	Matthew Wilcox <willy@parisc-linux.org>
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux-2.5 willy
Message-ID: <20030615004009.GK30843@parcelfarce.linux.theplanet.co.uk>
References: <20030614221634.9521F494003@palinux.hppa> <Pine.BSF.4.53.0306142353310.651@e0-0.zab2.int.zabbadoz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSF.4.53.0306142353310.651@e0-0.zab2.int.zabbadoz.net>
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

On Sat, Jun 14, 2003 at 11:57:52PM +0000, Bjoern A. Zeeb wrote:
>   HOSTLD  scripts/kconfig/conf
> ./scripts/kconfig/conf -o arch/parisc/Kconfig
> drivers/parisc/Kconfig:148: can't open file "drivers/hotplug/Kconfig"
> make: *** [oldconfig] Error 1

Fixed, thanks.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
