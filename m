Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 83379484B
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Jan 2004 11:38:54 -0700 (MST)
Date: Mon, 26 Jan 2004 19:38:50 +0100
Message-ID: <4015311000000204@ocpmta2.freegates.net>
In-Reply-To: <40153110000001C0@ocpmta2.freegates.net>
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

Sorry for auto reply, but I just find back the right kdb and:

>I would just still check the case when I have an usb kbd (I would have to
>recover one) but the pdc console is setup to serial port (e
>no graphic screen available) just for an output screen without input kbd?


That case is also impossible, the console setup as serial_1 (eg) is always
CL_DUPLEX :(

I will so review my patch.

Thanks for all,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
