Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id E4E7748AA
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 30 Jan 2004 10:31:34 -0700 (MST)
Date: Fri, 30 Jan 2004 18:31:31 +0100
Message-ID: <4015306100003890@ocpmta1.freegates.net>
In-Reply-To: <20040130160958.GB12688@colo.lackof.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] sti & b2k: doesn't work?
To: "Grant Grundler" <grundler@parisc-linux.org>
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


> Are you building your own kernels?
Yes
> You have USB keyboard/mouse built-in or loaded as a module?

I so have a look:
in 2.4
CONFIG_USB_HID=y
CONFIG_USB_HIDINPUT=y

Is what I have to use (I also encounter CONFIG_USB_KBD and CONFIG_USB_MOUSE
but not see how to select with menuconfig?)

in 2.6 it is not yet a default: should I also used CONFIG_USB_HID=y; CONFIG_USB_HIDINPUT=y?

Thanks for your attention,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
