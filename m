Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost.localdomain (adsl-64-109-89-110.chicago.il.ameritech.net [64.109.89.110])
	by dsl2.external.hp.com (Postfix) with ESMTP id E1044482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 17 Oct 2001 08:19:44 -0600 (MDT)
Message-Id: <200110171419.f9HEJbH01686@localhost.localdomain>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Daniel Engstrom <5116@telia.com>,
	parisc-linux@lists.parisc-linux.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [parisc-linux] New scsi driver for 53c700 and 53c710 committed 
In-Reply-To: Message from Richard Hirst <rhirst@linuxcare.com>
   of "Wed, 17 Oct 2001 10:56:41 BST." <20011017105641.G11105@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 17 Oct 2001 09:19:37 -0500
From: James Bottomley <James.Bottomley@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>

This one looks like it might be the second new feature of the driver: tag 
command queuing.

Could you post the boot messages of the failure case (or at least the device 
identifications and whether the driver has enabled TCQ [message like scsi1: 
(5:0) Enabling Tag Command Queuing)].

Thanks,

James
