Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from relay1.alcatel.be (alc119.alcatel.be [195.207.101.119])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3FBDD482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Nov 2001 07:32:05 -0700 (MST)
Message-ID: <1A8904C3797ED411AC2E0008C7E6F88117CAC0@nlntmail2b.ats.nld.alcatel.nl>
From: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
To: "'Jan-Benedict Glaw'" <jbglaw@lug-owl.de>,
	parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Power button on 712
Date: Thu, 22 Nov 2001 15:31:37 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Under hp-ux, if you press the "power-button" on the front, the system traps
it, and performs a "shutdown -h now"  (at least it takes ages to stop)
So the button on the front is not a BRS, but just generates a irq (on some
systems anyway....)

I presume this irq could be trapped under linux aswell, not?

Hans
	-----Original Message-----
	From:	Jan-Benedict Glaw [SMTP:jbglaw@lug-owl.de]
	Sent:	Thursday, November 22, 2001 2:53 PM
	To:	parisc-linux@lists.parisc-linux.org
	Subject:	Re: [parisc-linux] Power button on 712

	On Thu, 2001-11-22 15:48:41 +0200, Kaj-Michael Lang <milang@tal.org>
	wrote in message <003801c1735c$6581b7b0$56dc10c3@amos>:
	> This might sound really strange but anyway:
	> 
	> Should the power button work under Linux ?
	> Even after halting I need to pull the cord to get my machine to
power down,
	> as it won't respond to the the power button.

	During initialisation of hardware (the front LED is blinking) you
	can "easily" switch off the machine. But, after the OS was started,
	it's not such a good idea to allow an user to simply fiddle with
	the BRS (-> big red switch). Try to /sbin/poweroff or to /sbin/halt
	your box and try again:-)

	MfG, JBG

	-- 
	Jan-Benedict Glaw   .   jbglaw@lug-owl.de   .   +49-172-7608481
		http://lug-owl.de/~jbglaw/software/snapshot2cvs/

	_______________________________________________
	parisc-linux mailing list
	parisc-linux@lists.parisc-linux.org
	http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
