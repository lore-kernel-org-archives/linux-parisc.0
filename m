Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from unixworks.net (65-85-15-21.client.dsl.net [65.85.15.21])
	by dsl2.external.hp.com (Postfix) with ESMTP id 63C66482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 10 Feb 2002 11:50:31 -0700 (MST)
Received: from localhost (none@srvr1021.unixworks.net [65.85.15.21])
	by unixworks.net (1.0.11sp/unixworks.net) with SMTP id NAA05497
	for <parisc-linux@lists.parisc-linux.org >; Sun, 10 Feb 2002 13:48:13 -0600
Date: Sun, 10 Feb 2002 13:48:13 -0600
Message-Id: <200202101948.NAA05497@unixworks.net>
To: parisc-linux@lists.parisc-linux.org
From: Bob Radvanovsky <rsradvan@unixworks.net>
Cc: 
Subject: [parisc-linux] [REQUEST] PS/2 keyboard pinouts?
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

I recently picked up about 30+ 712 workstations, some of which will be
converted to the Debian PA/Linux operating system.  I plan on importing
the clusting software, Eddie, over to Debian and turning about 12+ of
these 712 workstations into a gigantic Linux cluster.

Unfortunately, I don't have 30+ keyboards for all of these workstations. 
Having noticed that there was one gent (Andrew Shugg) who mentioned about
a PS/2 loopback connector, I have tried in desparation to find one premade
at several computer specialty shops, including Radio Shack.  I used to
remember when Radio Shack *did* have connectors that you could make your
own style or pinout connector.	Nowadays, you just get a snot-nosed kid
who states "Whatever we have is whatever we have, dude.......whatever."
(or something like that).  I *CANNOT* seem to find any PS/2 connectors
ONLY, and for that matter, cannot seem to find documentation on the
712/60, 712/80 and 712/100 workstations keyboard connector pinout, and
which pins will enable me to bypass the IPL problem of "no keyboard, no
bootup" problem.

Anyone got any ideas on where I can get (1) pin descriptions as to how to
bypass the "no keyboard, no bootup" problem on most of the HP
workstations, and (2) where I might be able to get some PS/2 connector to
make my own "headless" Linux cluster configuration.

Thanks in advance.

Bob Radvanovsky
kempyuter kensulting services, inc.
rsradvan@k2si.com

-ad nauseum: Also... anyone know of a *good* and *FREE* Linux clustering
software that is efficient enough to run?  So far, the best one that I can
find that is fairly configurable, and robust enough is "Eddie".  But the
only drawback is that it's interpretted and runs on a language called
"Erlang".  If anyone has had experience in this matter with HP
workstations, running Debian PA/Linux, under a clustering environment (in
a house that Jack built), I'd be very interested in hearing more...  ;)))
