Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout09.sul.t-online.com (mailout09.sul.t-online.com [194.25.134.84])
	by dsl2.external.hp.com (Postfix) with ESMTP id 16AF34841
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Jul 2002 11:07:41 -0600 (MDT)
Received: from localhost (localhost [127.0.0.1])
	by marvin.forty.two (8.11.6/8.11.0/SuSE Linux 8.11.0-0.4) with ESMTP id g64GfcZ25416
	for <parisc-linux@lists.parisc-linux.org>; Thu, 4 Jul 2002 18:41:38 +0200
Content-Type: text/plain; charset=us-ascii
Date: Thu, 04 Jul 2002 18:41:16 +0200
From: Juergen Braukmann <juergen.braukmann@ruhr-west.de>
Message-ID: <3D247AAC.EF70A4CA@ruhr-west.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Installing on C110
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

Hello all,

after finding that there is now a Linux for HP-PA-RISC, I downloaded the
CD and tried to install on my HP9000-C110. Install went fine (apart from
some unmotivied kernel panics and issues with my other Compaq CDROM
drive).
I an stuck with three problems, for one my german keyboard doesn't work
as expected (the <>| key in particvular). I should get round that with
kbdconfig as suggested in another mail, but I diddn't fint that program
installed. ;-( Since this is my first ever debian install, it's more a
problem of finding and reading the docs to the packet manager and some
more general info about debian systems.

More annoying is the system clock, that always puts me back to 1970. Set
the date, wrote it back to CMOS, checked it, rebooted and was back into
the seventies. The device /dev/rtc exists with the suggested major/minor
numbers from the FAQ. At this time, I enter date time after bootup like
with my first PC. ;-)

I cannot get X to run. "No screens found". I tried the good old
xf86config setup, but don't realy know what to enter for a video card
(thinking that's the problem). Help on that is also appreciated. Is
there any tool to identify hardware in general?

Juergen

-- 
===========================================     __   _
Juergen Braukmann juergen.braukmann@gmx.de| -o)/ /  (_)__  __ ____  __
Tel: 0201-743648  dk4jb@db0qs.#nrw.deu.eu | /\\ /__/ / _ \/ // /\ \/ /
===========================================_\_v __/_/_//_/\_,_/ /_/\_\
