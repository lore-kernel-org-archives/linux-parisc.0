Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from helplets.tobit.net (p508C399B.dip.t-dialin.net [80.140.57.155])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1F5C44829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 May 2003 07:39:35 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
From: <parisc-linux@helplets.com>
Date: 09 May 2003 13:40:20 UT
Message-ID: <00000B0A.3EBBCBE2@helplets.tobit.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset="iso-8859-1"
Subject: [parisc-linux] Kernel panic on D270/1 when loading EISA driver
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

Hi All,

I'm currently trying to convert an old HP 9000/861/D270 to a firewall. So far, 
It works fine (after lowering the NCR_700_MAX_TAGS in drivers/scsi/53c700.h 
to 4, without that change the SCSI bus hung when writing large amounts of 
data).

The only real problem I have right now is that I get a kernel panic when 
loading my 3c59x driver module, because "ASSERT(dev);" fails in function 
ccio_map_single in file arch/parisc/kernel/ccio-dma.c.

I haven't found anything on the list so far, so maybe this is a new problem.
(Are EISA devices treated as PCI devices? Otherwise it might be ok for dev
to be NULL...)

Versions:
    Linux hppa 2.4.20-pa33 #2 Wed May 7 19:41:42 CEST 2003 parisc
    gcc version 3.0.4
    GNU ld version 2.12.90.0.1 20020307 Debian/GNU Linux

config, System.map and dmesg.log are available from 
http://134.155.63.117/~skettler/parisc-linux/

Thanks in advance,

Sascha Kettler
