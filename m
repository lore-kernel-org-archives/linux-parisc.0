Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from clmboh1-smtp3.columbus.rr.com (clmboh1-smtp3.columbus.rr.com [65.24.0.112])
	by dsl2.external.hp.com (Postfix) with ESMTP id D178A482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 10 Jan 2002 10:40:00 -0700 (MST)
Received: from beta (dhcp065-024-157-127.columbus.rr.com [65.24.157.127])
	by clmboh1-smtp3.columbus.rr.com (8.11.2/8.11.2) with ESMTP id g0AHZEG23561
	for <parisc-linux@lists.parisc-linux.org>; Thu, 10 Jan 2002 12:35:14 -0500 (EST)
From: "Sorin Ghinescu" <sghinesc@columbus.rr.com>
To: <parisc-linux@lists.parisc-linux.org>
Date: Thu, 10 Jan 2002 12:39:23 -0500
Message-ID: <001001c199fd$ca7fe700$0800a8c0@beta>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Subject: [parisc-linux] 712/80 - 7cdroms - scsi prbl
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

Hi guys,
I'm trying to install parisc-linux on 712/80.
I don't know if this is actually an OS problem or a hardware problem but
you may have experienced it and could help me.
I'm booting from my external cd-rom but it seems that the kernel is
fooled by something because it creates 7 cd-rom devices for all the scsi
targets available leaving no room for the hd. If I switch the cd-rom off
then I get 7 hds!
Has anyone experienced this?
Thanks
Sorin
