Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5C1C8482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 31 Aug 2001 10:07:51 -0600 (MDT)
Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA24096
	for <parisc-linux@puffin.external.hp.com>; Fri, 31 Aug 2001 10:05:45 -0600
Message-ID: <3B8FB5EF.3020301@videotron.ca>
Date: Fri, 31 Aug 2001 12:06:07 -0400
From: James Waterhouse <james.waterhouse@videotron.ca>
MIME-Version: 1.0
To: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>,
	"debian-hppa@lists.debian.org" <debian-hppa@lists.debian.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] booting problems
List-ID: <linux-parisc.vger.kernel.org>

Hello everyone,
	I'm seem to be having trouble booting into linux on my 712/60. I hope 
someone can help. I have built a new kernel (from cvs) and also set up 
an nfs root. When I try to boot the linux boots up to the point where it 
says "Cleaning: /tmp/ /var/lock /var/run" and then it just hangs. Any 
idea what is cause it to hang? Could there be a problem with the nfsroot?

James
