Return-Path: <Soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5F88E4839
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 14 Apr 2004 06:01:43 -0600 (MDT)
Date: Wed, 14 Apr 2004 14:01:38 +0200
Message-ID: <40711E5500005C0C@ocpmta2.freegates.net>
In-Reply-To: <40711E550000569F@ocpmta2.freegates.net>
From: "Joel Soete" <Soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 2.6.5-rc2-pa2 boot panic on c110 :(
To: "Ryan Bradetich" <rbradetich@uswest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: Grant Grundler <grundler@parisc-linux.org>,
	PA-RISC Linux Port <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


>> If the lifimage
>>boots on your system then we localize the problem down to possible tool
>>chain  or .config problem (I used the defconfig).
>
>Right I forgot to test defconfig.

I remember now: I just used to use the defconfig of which I remove all HIL
support (no device available) for this c110 (no specific config file).

Joel


----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
