Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3F5DB4832
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Apr 2004 11:06:09 -0600 (MDT)
Date: Tue, 27 Apr 2004 19:06:06 +0200
Message-ID: <408D436000000F0D@ocpmta1.freegates.net>
In-Reply-To: <20040427145741.GD14937@baldric.uwo.ca>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: =?ISO-8859-1?Q?Re=3A=20=5Bparisc=2Dlinux=5D=20RE=3A=20=5BPATCH=5D=20glibc=2D2=2E3=2E3=20error=20with=20debian=20unstable=09compiler=2E=2E=2E?=
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


> You aren't seeing a failure in tst-timer4?

uhm ... No (definitely :^)

> Can you verify this by running tst-timer4 by hand and sending the output
> ot the list?
Yes naturally, here there are:

# ./tst-timer4 
clock_gettime returned timespec = { 1083087449, 554351000 }
clock_getres returned timespec = { 0, 10000000 }
# echo $?
0

Well duno if results are right (first line different on each test but the
second is constant with or without TIMEOUTFACTOR)?

Don't hesitate with more questions ;)

Joel

----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
