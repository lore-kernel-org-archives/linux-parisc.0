Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id C647F4841
	for <parisc-linux@lists.parisc-linux.org>; Wed,  1 Oct 2003 18:39:18 -0600 (MDT)
Date: Wed, 1 Oct 2003 17:41:08 -0700
From: Randolph Chung <tausq@debian.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031002004108.GC660@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 2.6.0-test6 and md
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

while trying to bring up 2.6.0-test6 on an a500, i noticed that it is 
not able to use raid0 devices. raid1 seems fine. has anyone else seen 
this?

the error i see in the log is:
md: error, md_import_device() returned -16

i haven't had time to look deeper into this yet...

thx
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
