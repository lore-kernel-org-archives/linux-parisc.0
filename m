Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 66D4D490F
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  6 Apr 2004 08:17:27 -0600 (MDT)
Date: Tue, 6 Apr 2004 16:17:24 +0200
Message-ID: <40711E56000010B3@ocpmta1.freegates.net>
In-Reply-To: <20040405180338.GA28537@colo.lackof.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] HPMC 2.6.5-rc1 kernel on c3k
To: "Grant Grundler" <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Grant,

>My c3k HPMC'd last night when I was compiling kernels.
>USB was likely just the "victim" and not the culprit since
>I was working remotely and wasn't using any USB devices.
>Ie recent changes to SBA IOMMU code might still be suspect
>(I have no ideas what, just it's the place to start looking).

Just in case, with the same kernel, I got the same kind of pb on the c110
since ccio-dma was changed. Unfortunately I don't have enough time the week-end
to help more.

Joel


----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
