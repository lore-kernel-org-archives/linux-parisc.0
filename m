Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id F2F794829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 May 2003 02:29:29 -0600 (MDT)
Message-ID: <3EC4A158.70106@hp.com>
Date: Fri, 16 May 2003 10:29:12 +0200
From: Bruno Vidal <bruno_vidal@hp.com>
MIME-Version: 1.0
To: deller@gmx.de, parisc-linux <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Modification request for linux/arch/parisc/kernel/power.c
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

	Hi
I have a small request for this modules. Is it possible to
add a small hak in the process_shutdown() function in order
to call panic() if the soft power button is pressed 3 time
shortly.
It really help to analyze problem in hanging situation.

	Thanks.

-- 
	Vidal Bruno, (770-4271)
         SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@hp.com
