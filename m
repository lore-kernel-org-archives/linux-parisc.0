Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA22806
	for <parisc-linux@puffin.external.hp.com>; Tue, 8 Aug 2000 00:56:30 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 8 Aug 2000 06:58:43 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 8 Aug 2000 06:58:20 -0000
Received: (from willy@localhost)
	by vodka.thepuffingroup.com (8.9.3/8.9.3) id BAA17067
	for parisc-linux@thepuffingroup.com; Tue, 8 Aug 2000 01:53:11 -0400
Date: Tue, 8 Aug 2000 01:53:11 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000808015311.K10538@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] parisc64
List-ID: <linux-parisc.vger.kernel.org>


those of you on the cvs list will have noticed parisc64 being committed.
don't get excited.  it's mainly been committed just to get the directory
structure down.  on my c3k, it HPMCs as soon as it tries to do anything
clever (like run C code in virtual mode, say).

most of the files just contain one line, along the lines of:

#include "../../parisc/kernel/setup.c"

whenever anyone hacking on parisc64 comes across something they need to
change, just copy the appropriate file into its place and edit it.  we'll
figure out what really can be shared and what can't at a later date.

(i suspect most of the bus adapter drivers should move into drivers/
for example.  *mumbles something about drivers/gsc/ being a bad name*).

-- 
Revolutions do not require corporate support.
