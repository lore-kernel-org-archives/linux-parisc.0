Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 552284833
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Jul 2001 05:44:00 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 14386B00C; Fri,  6 Jul 2001 12:43:14 +0100 (BST)
Date: Fri, 6 Jul 2001 12:43:14 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: rpengelly <rpengelly@ati.stlawrencec.on.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] very confused
Message-ID: <20010706124314.U23509@linuxcare.com>
References: <003d01c10563$c3d1c3d0$0f809b8e@ati.stlawrencec.on.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <003d01c10563$c3d1c3d0$0f809b8e@ati.stlawrencec.on.ca>; from rpengelly@ati.stlawrencec.on.ca on Thu, Jul 05, 2001 at 11:04:18AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jul 05, 2001 at 11:04:18AM -0400, rpengelly wrote:
> I am trying to install pa-linux on a 735. I have a scsi CDROM and a ethernet connection to i386 running linux. I am getting very confused as to which is the best method of installing. Whether CD based or bootp/rboot based. Any help figuring this out would be greatly appreciated. 

If you have a SCSI CDROM, then the easiest thing to try is to
grab the 0.9.1 ISO from mkhppa1.esiee.fr and try to boot from
it.  However, please wait until the ISO is updated before
downloading, the current one (md5sum 473c....6619) is broken.

Richard
