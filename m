Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7039F4841
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Nov 2003 10:53:18 -0700 (MST)
Date: Fri, 7 Nov 2003 18:52:58 +0100
Message-ID: <3F969FFE000092BD@ocpmta2.freegates.net>
In-Reply-To: <20031106222958.GJ26869@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] fdisk problems 2.4 <-> 2.6
To: "Matthew Wilcox" <willy@debian.org>,
	"Ruediger Scholz" <rscholz@hrzpub.tu-darmstadt.de>
Cc: parisc-linux@lists.parisc-linux.org
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

> [...] I bet it's calling BLKGETSIZE64 and our put_user() is broken.

I trusted that Grant merged the same code in 2.4 and 2.6 for put_user() some
time ago?

Is it the same with 64bits kernels?

hth,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL: 3 mois GRATUITS! L'Internet rapide, c'est pour tout le monde.

http://reg.tiscali.be/default.asp?lg=fr
