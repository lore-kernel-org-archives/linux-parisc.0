Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [192.151.27.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id DD8F8482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Jul 2001 19:48:18 -0600 (MDT)
To: "Yan Han" <yhan@uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] low-level format for Hp 715/50 machine SCSI disk 
In-Reply-To: Your message of "Wed, 18 Jul 2001 15:43:04 EDT."
             <002201c10fc1$dc7f7590$d30c6481@HCI008>
References: <000801c10e2e$bb1dee70$d10c6481@HCI009>
 <20010717105752.Q30356@linuxcare.com>  <002201c10fc1$dc7f7590$d30c6481@HCI008>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 30 Jul 2001 19:48:16 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010731014816.D384437CD9@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Yan Han" writes...

> Hi!
> 
> Does anyone know how to do low-level hard disk format for HP 715/50
> machines. We cannot boot it up with its own scsi disck, since there are
> error messages.

Try putting the disk on a different system and doing a low-level format there. 
If the SCSI card in the other system has a low-level format in the card BIOS 
(most bootable PC scsi cards do) you can use that, or you can use the scsifmt 
command in the scsitools package (at least on Debian).

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
