Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailgwa0.bmwgroup.com (mailgwa0.bmwgroup.com [192.109.190.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 14579482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Jan 2002 03:18:51 -0700 (MST)
Message-Id: <3C5676D9.E4B26D93@bmw.de>
Date: Tue, 29 Jan 2002 11:18:01 +0100
From: HEISERER DANIEL <Daniel.Heiserer@bmw.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] octave2.1_2.1.35-6_hppa
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

Hi,
a buddy pointed me to the debian build archive,
because I had problems building a 64-bit octave executable
on AP-RISC-2 HP-UX-11.11.
I used the gcc-3.0.2 which was a 
 /usr/local/bin/gcc:     ELF-64 executable object file - PA-RISC 2.0
(LP64)
and it also produced such code. Unfortunately the octave builds,
but fails immediately by trivial operations.
I am also a little be astonished about the different object files
existing
on PA-Risc. There are 
/usr/local/bin/perl:    PA-RISC1.1 shared executable dynamically linked
-not stripped
as well as "PA-RISC2" executables.
Honestly I have no idea what the difference between ELF-64 and PA-RISC-2
is.
Are both 64 bit.

Finally I found the debian archive for octave. So my question is:

Do you build this octave for 
o linux on PA-Risc or also for
o HP-UX-11.11 ????

Is it finally 64 bit? and how did you build it.

I would appreciate any comments to my open questions.

thanks, daniel


-- 
Mit freundlichen Gruessen
    Daniel Heiserer

--------------------------------------------------------------
Dipl.-Phys. Daniel Heiserer, BMW AG, Knorrstrasse 147, 80788 Muenchen
Abteilung EK-212
Tel.: 089-382-21187, Fax.: 089-382-42820
mailto:daniel.heiserer@bmw.de 
Lageplan Standort FIZ:
http://www.stadtplandienst.de/query?ORT=M&STR=Knorrstr.&HNR=147
