Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 99D634829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  4 Jan 2003 12:38:22 -0700 (MST)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) with ESMTP id h04JcFot016389
	for <parisc-linux@lists.parisc-linux.org>; Sat, 4 Jan 2003 14:38:16 -0500 (EST)
Received: (from dave@localhost)
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) id h04JcFLn016387
	for parisc-linux@lists.parisc-linux.org; Sat, 4 Jan 2003 14:38:15 -0500 (EST)
Message-Id: <200301041938.h04JcFLn016387@hiauly1.hia.nrc.ca>
To: parisc-linux@lists.parisc-linux.org
Date: Sat, 4 Jan 2003 14:38:15 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] do_page_fault() infinite loop running 2.4.20-pa18 #9 SMP
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

This has been around for awhile.  When using a SMP configuration, the
program expect "causes" a segmentation fault that results in do_page_fault()
going into an infinite loop.  The log data repeats indefinitely and
eventually fills /var.  For some reason, expect is not killed by the kernel
when this happens, although the loop can be broken by manually killing it.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
