Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD951CDD3.dip.t-dialin.net [217.81.205.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 70BEA482A
	for <parisc-linux@parisc-linux.org>; Mon,  4 Jun 2001 11:25:33 -0600 (MDT)
Received: (from tsbogend@localhost)
	by solo.franken.de (8.9.3/8.9.3) id TAA01640
	for parisc-linux@parisc-linux.org; Mon, 4 Jun 2001 19:23:19 +0200
Date: Mon, 4 Jun 2001 19:23:19 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Problems with 0.9 ISO Images from mkhppa1.esiee.fr
Message-ID: <20010604192319.A1435@solo.franken.de>
References: <20010604170841.A8900@solo.franken.de> <20010604173924.A1043@excalibur.cologne.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010604173924.A1043@excalibur.cologne.de>; from parisc-linux@excalibur.cologne.de on Mon, Jun 04, 2001 at 05:39:24PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jun 04, 2001 at 05:39:24PM +0200, Karsten Merker wrote:
> bash> md5sum palinux-0.9-32sti.iso.gz
> 8ec6565d49172302a39e844cea64c47b  palinux-0.9-32sti.iso.gz

ok, that's the same I have here. Looks like cdrecord messed up something:-(
Anyway thanks for the report.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
