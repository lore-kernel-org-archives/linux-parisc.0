Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout05.sul.t-online.com (mailout05.sul.t-online.com [194.25.134.82])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0F59C482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Apr 2001 15:05:07 -0600 (MDT)
Received: from localhost (localhost [[UNIX: localhost]])
	by venus.solar-system.the7lg.de (8.11.0/8.8.7) id f3CL4hL22977
	for parisc-linux@lists.parisc-linux.org; Thu, 12 Apr 2001 23:04:43 +0200
From: buffalo bill <buffalo@uranus.solar-system.the7lg.de>
To: parisc-linux@lists.parisc-linux.org
Date: Thu, 12 Apr 2001 23:04:42 +0200
Content-Type: text/plain;
  charset="iso-8859-1"
MIME-Version: 1.0
Message-Id: <01041223044200.22122@venus.solar-system.the7lg.de>
Sender: buffalo@venus.solar-system.the7lg.de
Subject: [parisc-linux] 710 SCSI & LAN problems
List-ID: <linux-parisc.vger.kernel.org>

Hi !
I've tried to get my 710 running with parisc linux.
I know there are problems with SCSI and LAN, so tried to find out.
The drivers both fail to call "pci_alloc_consistent()" and use memory from
__get_free_pages() instead. 

Could it be that the problem is related to this ?

Regards Heiko Jakob
