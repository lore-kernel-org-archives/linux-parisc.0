Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id A5B2E4847
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Jul 2003 10:35:46 -0600 (MDT)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout2.tiscali.be with esmtp (Tiscali)
	id 19cpEH-0003Di-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Jul 2003 18:34:09 +0200
Date: Wed, 16 Jul 2003 18:35:44 +0200
Message-ID: <3F0C24F800000FBF@ocpmta8.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] Kernel 2.6.0-test1-pa1 64bits failled to compile
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

Hi all,

This today cvs update failled to compile on my N4000-55 with this very short
message:

  LD      init/built-in.o
  LD      .tmp_vmlinux1
make: *** [.tmp_vmlinux1] Error 139
palx4000:/usr/src/linux-2.6.0-test1-pa1# 

Build with following 64bits gcc:

# dpkg -l gcc\*
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err: uppercase=bad)
||/ Name                  Version               Description
+++-=====================-=====================-==========================================================
[...]
ii  gcc-hppa64            3.2.3-0.1             Cross gcc for hppa64
[...]

Is there some tips to get more verbose make output?

Thanks in advance,
    Joel



------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
