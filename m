Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA13432
	for <parisc-linux@puffin.external.hp.com>; Fri, 7 Jul 2000 20:12:18 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 8 Jul 2000 02:13:43 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13Ak6q-0002k2-00
	for <parisc-linux@thepuffingroup.com>; Fri, 07 Jul 2000 22:12:48 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 07 Jul 2000 22:12:48 -0400
Message-ID: <87d7kpe5en.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] GCC 2.96 merge complete (I hope)
List-ID: <linux-parisc.vger.kernel.org>

Okay, the merge of p.e.h.c's gcc module to current 2.96 is complete,
modulo things that may have slipped through the cracks due to CVS
being stupid.

As mentioned in the previous message, the old stuff is on the
'gcc-2_9-hppa-20000707' branch tag if you care to look at it.

We now also have a 'GNU_DIST' vendor branch which is intended to be
used to track the mainline GCC tree.  So, nice diffs can now be
obtained by running 'cvs rdiff -u -r GNU_DIST -r HEAD gcc'.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
