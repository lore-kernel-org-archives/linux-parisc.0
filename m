Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 92955482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Apr 2002 10:24:20 -0700 (MST)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1017854653.3cab3abdab486@webmail.tiscalinet.be>
Date: Wed, 03 Apr 2002 19:24:13 +0200 (CEST)
From: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] "unaligned access to ... at ip=..." problem with evms and jfs
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

Hi all,

Thoses problems are not linked but similar by nature:

with evms-1.0.0, I still got thousand of messages:
Apr  3 19:05:48 palinux kernel: evms_lvdisplay(900): unaligned access to
0x0002461e at ip=0x40208b53

and with jfs-1.0.17:
Apr  3 19:11:24 palinux kernel: fsck.jfs(1483): unaligned access to 0xbff00717
at ip=0x0002eb3f

It seems harmless but not sure.

I query the ml db and found similar problems (and its solution :_) )(reiserfs:
http://lists.parisc-linux.org/hypermail/parisc-linux/5862.html), but I do not
very well understand what I have to find the sources (_u32* ?).

Thanks in advance for additional help,
    Joel

-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
