Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web11201.mail.yahoo.com (web11201.mail.yahoo.com [216.136.131.171])
	by dsl2.external.hp.com (Postfix) with SMTP id 8633F4829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  4 Aug 2002 15:17:07 -0600 (MDT)
Message-ID: <20020804211706.43184.qmail@web11201.mail.yahoo.com>
Date: Sun, 4 Aug 2002 14:17:06 -0700 (PDT)
From: James Srinivasan <james_srinivasan@yahoo.com>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] HIL Mouse device cannot be opened
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

I've followed the HOWTO for using a HIL mouse with
XFree86 on my Apollo 715/33 but get the error message:

xf86OpenSerial: Cannot open device /dev/input/mice No
such device

when executing startx. Indeed, cat /dev/input/mice
also gives "No such device".

I upgraded the kernel using apt-get - does the 2.4.18
kernel available through this method support the HIL
drivers?

Many Thanks,

James

__________________________________________________
Do You Yahoo!?
Yahoo! Health - Feel better, live better
http://health.yahoo.com
