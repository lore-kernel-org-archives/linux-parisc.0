Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from femail16.sdc1.sfba.home.com (femail16.sdc1.sfba.home.com [24.0.95.143])
	by dsl2.external.hp.com (Postfix) with ESMTP id E9CB7483F
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Feb 2002 11:44:28 -0700 (MST)
Received: from kenny ([68.58.113.28]) by femail16.sdc1.sfba.home.com
          (InterMail vM.4.01.03.20 201-229-121-120-20010223) with SMTP
          id <20020225184422.RJFO1329.femail16.sdc1.sfba.home.com@kenny>
          for <parisc-linux@lists.parisc-linux.org>;
          Mon, 25 Feb 2002 10:44:22 -0800
Message-ID: <003301c1be2c$70daa3e0$02c1a8c0@james.co.uk>
From: "James S" <smith-james@home.com>
To: <parisc-linux@lists.parisc-linux.org>
Date: Mon, 25 Feb 2002 13:44:21 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Parallel port woes
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

i'm still having complete lockup of the machine when i send a printjob to
the local parallel port

it seems to be completely independant of the printing system i use - both
lpd & cups cause the same lockup

nothing actually seems to get as far as the printer, but cups seems to be
working ok, as i can print to the same printer shared up from a windows
machine

using kernel 2.4.17-32  on a 712/60 with an hp deskjet 500 on a standard
parallel cable

am i missing anything obvious ?

does the 712/60 have a standard printer port or do i need a special cable ?

Thanks

James S
