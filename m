Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF4F14829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Sep 2002 10:33:41 -0600 (MDT)
Received: from esiee.fr (grobluk.esiee.fr [147.215.7.22])
	by mail.esiee.fr (Postfix) with ESMTP id 9297D49BF1
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Sep 2002 18:33:39 +0200 (CEST)
Message-ID: <3D8212E7.6000609@esiee.fr>
Date: Fri, 13 Sep 2002 18:31:35 +0200
From: Thibaut VARENE <varenet@esiee.fr>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Making SYM2 default SYM-SCSI driver instead of SYM1
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

Hi fellows !

Paul Bame has noticed a problem that seems to occur on B2600 with SYM1 
driver, causing the box to slow down everything and increasing the 
loadavg, while top reports 99% idle.

When this happens, one can hear HD making strange noise: two grouped 
"ticks" every 2 seconds or so.

I have experienced this behavior by myself, and it seems that using SYM2 
driver solves this problem.

Now I'm asking you to know if anybody has an objection against making 
SYM2 the default driver in debian-configs instead of old SYM1.

Thanks,


Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/
