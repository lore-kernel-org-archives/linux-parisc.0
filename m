Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 716D84854
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 22 Mar 2004 00:27:57 -0700 (MST)
Date: Mon, 22 Mar 2004 08:07:20 +0100
Message-ID: <40561EAF00004465@ocpmta1.freegates.net>
In-Reply-To: <20040321195716.GC12455@colo.lackof.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 2.6.5-rc2-pa2 boot panic on c110 :(
To: "Grant Grundler" <grundler@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: PA-RISC Linux Port <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello Grant,

>> ...
>>  IAOQ[0]: lasi700_probe+0x18c/0x1cc
>>  IAOQ[1]: lasi700_probe+0x190/0x1cc
>>  RP(r2): lasi700_probe+0x58/0x1cc
>
>IOAQ[0] is the offending instruction.
>Brute force debug method is to start adding
>printk's to lasi700_probe. It shouldn't take
>more than a few iterations to find the offending line.

Thanks, I will foreseen such work next week-end :)

Joel


----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
