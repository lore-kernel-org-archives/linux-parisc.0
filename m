Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel12.hp.com (palrel12.hp.com [156.153.255.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id B81084840
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Aug 2003 00:54:29 -0600 (MDT)
Received: from redsea.india.hp.com (redsea.india.hp.com [15.76.97.3])
	by palrel12.hp.com (Postfix) with ESMTP id 32AE31C00D9B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 10 Aug 2003 23:54:28 -0700 (PDT)
Received: from india.hp.com (eb9856.india.hp.com [15.76.98.56])
	by redsea.india.hp.com (8.9.3 (PHNE_28761)/8.9.3 SMKit7.02) with ESMTP id MAA22655
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Aug 2003 12:31:29 +0530 (IST)
Message-ID: <3F373D92.C287B6B4@india.hp.com>
Date: Mon, 11 Aug 2003 12:24:10 +0530
From: Naresh <knaresh@india.hp.com>
Reply-To: knaresh@india.hp.com
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Affined IRQs.
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

Hi,
The IA-64 Linux kernel has a concept of affined IRQs, wherein IRQs can
be bound/affined to particular CPUs. The affinity information shows up
in '/proc/irq/#/smp_affinity'. I cannot see any affinity of IRQs to CPUs
in PA ( iosapic.c and irq.c).. Is my understanding correct?
Regards,
Naresh.
