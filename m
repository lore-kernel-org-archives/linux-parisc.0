Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout03.sul.t-online.com (mailout03.sul.t-online.com [194.25.134.81])
	by dsl2.external.hp.com (Postfix) with ESMTP id E696B4838
	for <parisc-linux@lists.parisc-linux.org>; Fri, 19 Jul 2002 11:37:41 -0600 (MDT)
Received: from localhost (localhost [127.0.0.1])
	by marvin.forty.two (8.11.6/8.11.0/SuSE Linux 8.11.0-0.4) with ESMTP id g6JG8XZ07170
	for <parisc-linux@lists.parisc-linux.org>; Fri, 19 Jul 2002 18:08:33 +0200
Content-Type: text/plain; charset=us-ascii
Date: Fri, 19 Jul 2002 18:08:09 +0200
From: Juergen Braukmann <juergen.braukmann@ruhr-west.de>
Message-ID: <3D383969.1657EF43@ruhr-west.de>
MIME-Version: 1.0
To: parisc list <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] C110, kernel Panics, still more tears ;-(
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

Hi Grant and all,

still more tears. I compiled and replaced the kernel, using 2.4.18pa55.
I used the setting of ccio_mem_ratio=16, but still my kernel panics with 

Kernel panic: ccio-dma.c ccio_alloc_range() I/O MMU is out of mapping
resources.
In interrupt handler - not syncing

would there be more chance with the ccio_mem_ratio setting of 8? Is
there a way to use more than one Kernel alternativly and select it at
boottime with palo? Is there an example palo.conf somewhere?

I will shut down X next and try again. I managed to ftp a large file
once and all I did after that was getting X to run.

Juergen

-- 
===========================================     __   _
Juergen Braukmann juergen.braukmann@gmx.de| -o)/ /  (_)__  __ ____  __
Tel: 0201-743648  dk4jb@db0qs.#nrw.deu.eu | /\\ /__/ / _ \/ // /\ \/ /
===========================================_\_v __/_/_//_/\_,_/ /_/\_\
