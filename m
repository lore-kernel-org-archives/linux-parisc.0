Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 02BAB4843
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Jan 2004 10:17:38 -0700 (MST)
Date: Tue, 27 Jan 2004 18:17:30 +0100
Message-ID: <400CB8A100005C3D@ocpmta3.freegates.net>
In-Reply-To: <20040126172505.GQ11844@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] A fix for B2k and CONFIG_PDC_CONSOLE pb
To: "Matthew Wilcox" <willy@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: Christoph Plattner <christoph.plattner@gmx.at>,
	Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,

Sorry but don't apply this this patch, I just do more test and unfortunately
it broken sti console :(.

hmm I check  a bit more but mem_kbd.iodc_io was always zero?
and I don't notice any diference in PAGE0->mem_kbd... between a boot with
console set to graphics(0) and a boot with serial_1?

Any idea?

Thanks again,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
