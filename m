Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from post.webmailer.de (natsmtp01.webmailer.de [192.67.198.81])
	by dsl2.external.hp.com (Postfix) with ESMTP id 71568482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Jan 2003 08:43:02 -0700 (MST)
Received: from [192.168.77.16] (p50915F9A.dip.t-dialin.net [80.145.95.154])
	by post.webmailer.de (8.9.3/8.8.7) with ESMTP id QAA06406
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Jan 2003 16:42:57 +0100 (MET)
From: Buffalo Bill <buffalo@gediegos.de>
To: Parisc-Linux "List (E-mail)" <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain
Date: 26 Jan 2003 16:44:40 +0100
Message-Id: <1043595882.23219.12.camel@jupiter>
Mime-Version: 1.0
Subject: [parisc-linux] Problems with Woody on 710.
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

after searching the mailing list I've found some messages which reported
success in installing Woody on a 710. So I tried to install it. After
trying many many different lifimages, all ended up in the same result:
It hung during installation ( while mounting the root file system ).
Switching to another console ( which still worked ) showed me that
/sbin/dbootstrap and [scsi_eh_0] were both in state D.  

What did I do wrong ? Or to put it other words: How did you guys get
your 710s up'n'running ?

Thanks.
