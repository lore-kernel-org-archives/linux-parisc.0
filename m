Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 440D5482C
	for <parisc-linux@parisc-linux.org>; Sun,  9 Dec 2001 13:12:29 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id fgwnjaaa for parisc-linux@parisc-linux.org; Sun, 9 Dec 2001 13:07:05 -0700
Date: Sun, 9 Dec 2001 12:12:19 -0800
From: Randolph Chung <tausq@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011209201219.GT1515@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Tester needed for cdrecord on parisc-linux
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

I just built cdrecord and friends for hppa-linux (there's a small patch
needed that has been submitted to the BTS). Unfortunately I do not have
a parisc-linux setup to test it with. Can someone here please give it a
try and report the results?

http://people.debian.org/~tausq/hppa/
	cdrecord_1.10-2_hppa.deb 
	mkisofs_1.10-2_hppa.deb 
	cdda2wav_1.10-2_hppa.deb 

If you are not familiar with CD-writing under Linux, you may want to
refer to:
http://www.linux.com/howto/CD-Writing-HOWTO.html

thanks!
randolph
-- 
Debian Developer <tausq@debian.org>
http://www.TauSq.org/
