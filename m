Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 79133482D
	for <parisc-linux@parisc-linux.org>; Tue, 15 Jul 2003 10:53:12 -0600 (MDT)
Date: Tue, 15 Jul 2003 18:53:06 +0200
Message-ID: <3F0C2302000016AD@ocpmta2.freegates.net>
In-Reply-To: <20030715141249.GT23808@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] Re: 2.6.0-test1: Kernel pci bug ?
To: "Matthew Wilcox" <willy@debian.org>
Cc: "Matthew Wilcox" <willy@debian.org>,
	parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Willy,

Good news:

[wsjso] jso /home/jso > ssh pafw02
Enter passphrase for key '/home/jso/.ssh/id_dsa': 
Linux fw02.office.palinux 2.6.0-test1-pa0 #1 Tue Jul 15 18:28:46 CEST 2003
parisc GNU/Linux
No mail.
jso@fw02:~$ 

It works when compile with sym2 (I do not try any more sym1) and compiled
with gcc-3.0. I will so tried now to port forward gg __canonicalize... stuff
and gcc-3.3.

Just an additional question: may I already try module support (I had a ragexl
pci card witch I would like to test in 2.6)?

Thanks a lot for this great job,
    Joel


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
