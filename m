Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id D9C97482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  4 Jul 2003 07:56:50 -0600 (MDT)
Date: Fri, 4 Jul 2003 15:56:44 +0200
Message-ID: <3F056E95000000D0@ocpmta4.freegates.net>
In-Reply-To: <HOEDKHACIIOGKPMMFMCGIELFCOAA.Mark.Mestdagh@Icon-Europe.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] Kernel compilation for B2000
To: "Mark Mestdagh" <Mark.Mestdagh@Icon-Europe.com>,
	"Matthew Wilcox" <willy@debian.org>
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

Hi Mark,

> Seems I have the same problem on a B2000 with the latest cvs'ed version
> (2.4.21-pa1)

The problem is not with b2k but well with 2.4.21-pa1 which is refreshed very
recently. But I proposed a fix to Grant who would be able to ci soon.
In the mean time (if you do not need actualy ide support for cd-rom) you
can un-select this temporarely this from your config.

Now for 64bits kernel it works (b2k allows 32 & 64 bits kernels ;-) ).
But for 32bits otc you will need also to wait that Grant ci another patch
(or reverse pa1 patch to come back to pa0).

hth,
    Joel



------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
