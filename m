Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id D0C5C4855
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 17 Mar 2004 01:31:02 -0700 (MST)
Date: Wed, 17 Mar 2004 09:30:59 +0100
Message-ID: <40561E9500001160@ocpmta3.freegates.net>
In-Reply-To: <20040316210933.GO660@baldric.uwo.ca>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: =?ISO-8859-1?Q?Re=3A=20=5Bparisc=2Dlinux=5D=20=09RE=3A=20New=20glibc=20patches=202004=2D03=2D08=2C=20fixes=20GLRO=20changes=2E?=
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: James Morrison <ja2morri@csclub.uwaterloo.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


Hello Carlos,
 
>> Very nice job Carlos.
>> Just still have to check more X,

I now boot on the (previously /mnt/chroot) disk with new glibc (to be accurate
cvs 2004 03 15 + your patch + my feupdateenv) with kernel 2.6.4-pa1 first.

I try to rebuild 2.6.4-pa2 as well as 2.6.5-rc1-pa0 (but small pb) and so
rebuild 2.6.4-pa1 to add kbd and mouse support: rebuild ok, reboot ok.

I also relaunch Xfce4 and do some test with its file manager, its configuration
interface and xterm, all seems to works fine (well at least, i don't log
any error and any critical trouble in its usage ;)).

>No, thank you Joel, your testing and bravery is an enourmous help :)

Welcome (if you foreseen some additional test don't hesitate), thanks for
your trust and support.

Joel


----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
