Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 89489482D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Jun 2002 23:40:08 -0600 (MDT)
Received: from garibaldi.apptechsys.com (ats164.apptechsys.com [207.14.35.164])
	by mail.apptechsys.com (Postfix) with ESMTP id 6B1107BC45
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Jun 2002 22:39:55 -0700 (PDT)
Date: Wed, 26 Jun 2002 22:39:55 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0206262237000.17764-100000@garibaldi.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] CVS kernel broken?
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

I am unable to build the current cvs kernel.  make oldconfig says 
scripts/Configure: drivers/hil/Config.in: No such file or directory
make[1]: *** [oldconfig] Error 1

and make menuconfig says 
Preparing scripts: functions, parsingscripts/Menuconfig: line 1: 10304 
Segmentation fault      awk "$1"
Awk died with error code 139. Giving up.
...

Is this just me, or is there some problem I don't know about?

-- 
Skinner's Constant (or Flannagan's Finagling Factor):
	That quantity which, when multiplied by, divided by, added to,
	or subtracted from the answer you got, gives you the answer you
	should have gotten.
