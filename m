Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id E26B2482C
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Nov 2001 10:35:02 -0700 (MST)
Message-Id: <200111091730.KAA32672@puffin.external.hp.com>
To: Daniel Williams <dan@bigw.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C110 install and boot part 3... 
In-Reply-To: Message from Daniel Williams <dan@bigw.org>
   of "Thu, 08 Nov 2001 21:21:45 CST." <E76C922A-D4C0-11D5-BC47-0030657D1C94@bigw.org>
Date: Fri, 09 Nov 2001 10:30:53 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

Daniel Williams wrote:
> scsi bus is being reset for host 1 channel 0
> ncr53c8xx_reset: pid-0 resetflags=2 serial_number=18 
> serial_number_at_timeout=18
> ncr53c720-0: restart(scsi reset)
> SCSI host 1 abort (pid0) timed out - resetting.

uhm...shouldn't that be the sym53c8xx driver?
I only ask because I couldn't find ncr53c8xx_reset in the sym53c8xx driver.

grant
