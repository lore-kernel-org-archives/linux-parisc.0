Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3F961489D
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 23 Dec 2003 10:42:07 -0700 (MST)
Date: Tue, 23 Dec 2003 18:42:03 +0100
Message-ID: <3FB2652500018822@ocpmta2.freegates.net>
In-Reply-To: <1072192334.1815.0.camel@mulgrave>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] serial 2 broken in 2.6.0 for b180?(followup)
To: "James Bottomley" <James.Bottomley@steeleye.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

>On Mon, 2003-12-22 at 10:29, Joel Soete wrote:
> I just got a small problem with my 2.6.0 teting b180: no mean to use the
> second serial port.

hmm it seems that 'setserial /dev/ttyS1 port 0xfff83800' locks the memtioned
serial port (even thought "port 0xfff83800" is well the one related in dmesg).

I will try to check in more detail later ;)

J.

-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
