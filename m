Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from nuada.toptech.com.ar (nuada.toptech.com.ar [200.68.70.114])
	by dsl2.external.hp.com (Postfix) with ESMTP id E9A00483F
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Aug 2003 11:47:26 -0600 (MDT)
Received: from zacarias.com.ar (imhotep.toptech.com.ar [200.68.70.115])
	(authenticated)
	by nuada.toptech.com.ar (8.11.6/8.11.6) with ESMTP id h78HlBL09652
	for <parisc-linux@lists.parisc-linux.org>; Fri, 8 Aug 2003 14:47:11 -0300
Message-ID: <3F33E1F8.9030706@zacarias.com.ar>
Date: Fri, 08 Aug 2003 14:46:32 -0300
From: Gustavo Zacarias <gustavo@zacarias.com.ar>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] K360 with 64 bit kernel?
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
Has anyone managed to boot a K360 with a 64 bit kernel?
The machine works just fine with a 32 bit one.
The problem is the machine getting stuck just after the ncr53c8xxx 
driver with a bunch of scsi timeouts.
You can check the logs at http://www.zacarias.com.ar/hppa/ (a good boot 
on 32, and the dead one on 64).
Thanks in advance.
