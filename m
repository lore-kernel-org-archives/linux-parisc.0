Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pimout3-ext.prodigy.net (pimout3-ext.prodigy.net [207.115.63.102])
	by dsl2.external.hp.com (Postfix) with ESMTP id EA6C4482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 31 Jan 2003 21:28:09 -0700 (MST)
Received: from pepp (adsl-67-116-83-209.dsl.lsan03.pacbell.net [67.116.83.209])
	by pimout3-ext.prodigy.net (8.12.3 da nor stuldap/8.12.3) with SMTP id h114S5Ni083808
	for <parisc-linux@lists.parisc-linux.org>; Fri, 31 Jan 2003 23:28:09 -0500
Reply-To: <adam.sk@groovy.ffloth.com>
From: "Adam Skaffloth" <adam.sk@groovy.ffloth.com>
To: <parisc-linux@lists.parisc-linux.org>
Date: Fri, 31 Jan 2003 20:27:21 -0800
Message-ID: <002d01c2c9aa$37400140$b601a8c0@pepp>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Tried to Install Debian 3r1 on C110, C180 and 2 712/60, no luck.
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

Hi !

I wonder if someone could give me a help in the right direction.
I have a C110, a C180 and 2 712/60.
C110 would boot fine until you get to the first menu, then the keyboard
would be out.
I have tried the previous tricks about disconnect/reconnect the keyboard,
but to no use.
The Visualize-EG in C180 seems not be working, seen threads about that,
so installed the Visualize-24 card from the C110 on the C180 and get the
same result.
Is this problem only related to the install or if I install using serial
console would it be a head-less machine = no use ?

I also read that their are no trouble with installing on 712/60.
I got 2, one with the second LAN/Serial Card (So I can use it as a FW).
Bot are starting but are hanging after the message:

The Installation Program is determining the current state
of your system and the next installation step that should
 be performed.

It hangs there forever on both boxes.

Anyone succeded with a install of Debian 3 on the above HW that could give
me a hand,
I am giving PA Risc a chance until I need to put the Sparc and the Intel
back into the plans.

/ Adam
