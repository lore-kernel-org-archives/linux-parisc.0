Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from nuada.toptech.com.ar (nuada.toptech.com.ar [200.68.70.114])
	by dsl2.external.hp.com (Postfix) with ESMTP id 52DB84848
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Aug 2003 09:16:03 -0600 (MDT)
Received: from zacarias.com.ar (imhotep.toptech.com.ar [200.68.70.115])
	(authenticated)
	by nuada.toptech.com.ar (8.11.6/8.11.6) with ESMTP id h7EFFqL13982
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Aug 2003 12:15:52 -0300
Message-ID: <3F3BA77C.8080804@zacarias.com.ar>
Date: Thu, 14 Aug 2003 12:15:08 -0300
From: Gustavo Zacarias <gustavo@zacarias.com.ar>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Zalon driver not 64-bit clean?
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

Hi.
Continuing with the K360 saga, it seems the Zalon driver is not 64-bit 
clean.
By removing it from the kernel config i'm able to boot a 64 bit kernel 
on a K360, but obviously i won't get any network or wide scsi working, 
so it isn't quite useful.
Is anyone aware of this / working on a solution / planning on working? 
Or maybe there's no interest in this?
Thanks in advance.
