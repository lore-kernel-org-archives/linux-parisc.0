Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0E8D34855
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 30 Jan 2004 07:01:15 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout1.tiscali.be with esmtp (Tiscali) id 1AmZCr-000122-00
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 30 Jan 2004 15:01:13 +0100
Date: Fri, 30 Jan 2004 15:01:12 +0100
Message-ID: <400CB8A10000846A@ocpmta3.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] sti & b2k: doesn't work?
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi pa,

Looking to solve the pb I encounter with b2k and pdc_console, I unfortunately
figure out that sti console doesn't work at all on this b2k model.

To be honnest, as the builtin gfx card is not (yet and may be never) supported,
I only use serial console till now.

I plug a hp usb kdb (the one supplied with the workstation) in a usb port,
then I reach to start palo in interactive mode to choose either a kernel
2.4 or 2.6. All start normaly untill I got a prompt for the login. But there,
I can hit any key on this kbd, nothing happen even though the system is well
running for the rest?? (same pb with latest cvs 2.4 and 2.6)

Any idea?

Thanks in advance for help,
    Joel

PS: because pdc_console make crash the kernel on this system I desable this
option. 

-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
