Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.powertech.no (smtp1.powertech.no [195.159.0.145])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B5E4482A
	for <parisc-linux@parisc-linux.org>; Fri, 14 Dec 2001 01:33:18 -0700 (MST)
Received: from nyepost.start.no (nyepost.start.no [195.159.1.214])
	by smtp1.powertech.no (Postfix) with ESMTP id 1BD138562
	for <parisc-linux@parisc-linux.org>; Fri, 14 Dec 2001 09:32:56 +0100 (CET)
Received: (from apache@localhost)
	by nyepost.start.no (8.11.6/8.11.2) id fBE8OUi24527
	for parisc-linux@parisc-linux.org; Fri, 14 Dec 2001 09:24:30 +0100
To: parisc <parisc-linux@parisc-linux.org>
Message-ID: <1008318270.3c19b73ecfadb@nyepost.start.no>
Date: Fri, 14 Dec 2001 09:24:30 +0100 (CET)
From: Andy Walker <squawker@start.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] 0.9.3 on a B132L
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

Hi folks,

First of all, thanks for all the hard work that has gone into 0.9.3. Excellent!

I've got a couple of observations and/or questions. Apologies for the lack
of dmesg output etc. - I'm at work and the workstation is at home.
I have a B132L, with the Visualize EG, GRAPHICS(0), on board frame buffer
(that's Gecko, if I'm not mistaken) and a 4071B in the GSC slot, GRAPHICS(2)
(this thing is Coral in the dmesg output I believe).

Previously, when playing around with 0.9.2 I had set the display path to
GRAPHICS(0), as the 4071B was unsupported. As it turned out, the PS/2
keyboard problems forced me to use a serial console in the end anyway, but
at least the EG seemed to be supported.

So yesterday I booted up 0.9.3 in this configuration. The messages started
to appear on the screen, then stopped after the 'if you don't see anything
more' message. In a flash of inspiration, I moved the monitor cable to the
4071B, and lo and behold, all the output was there! The dmesg shows that
its finding the 4071B before the EG, and using that as the console display
even though the display path is set to GRAPHICS(0). Is this expected behaviour
at this point in time, or is there something fishy going on.

Switching the display path to GRAPHICS(2) fixed things - 0.9.3 booted and
displayed on the 4071B.

So far so good. Installation seemed to go mostly ok - I have two disks on
the FW-Diff controller in this box. I guess I should be specifying the
burst:3 parameter to avoid disk corruption.

The other problem I've experienced is keyboard lockup with the message
'LASI PS/2 keyboard timeout' scrolling up the screen. I was using a
generic PS/2 keyboard at the time. Seems to kick in when the machine
is installing from the cd and I'm messing about on another virtual
console - although that is really just speculation. I can stick the B132L
on the net tonight and log in to see what's going on next time the lockup
occurs - anything in particular I should be looking for?

Regards,

-Andy

------------------------------------------------------------
Få din egen @start.no-adresse gratis på http://www.start.no/
