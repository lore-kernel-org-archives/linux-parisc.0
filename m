Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 762B44856
	for <parisc-linux@lists.parisc-linux.org>; Wed,  8 Oct 2003 10:16:12 -0600 (MDT)
Date: Wed, 8 Oct 2003 18:16:08 +0200
Message-ID: <3F5CB6FB0000F484@ocpmta1.freegates.net>
In-Reply-To: <1289146742B56546AE580DFC6B711A8313482D@PKDWB07C.ad.sprint.com>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] A3591B (Tachyon) FC Card
To: "Padgett, Pat M [NTWK SVCS]" <PatPadgett@NMCC.SprintSpectrum.com>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>
>I'm trying to figure out whether it would be a good idea to use some of
>the existing code in the cpqfcTS* driver (similar to the way that the
>zalon7xx scsi host template calls code in the ncr53c8xx driver).
>However, the cpqfcTS* code is quite a beast, perhaps writing the driver
>from scratch would be better?  (Googling the list archives shows that
>I'm not the only one intimidated(?) by the compaq code :)
>
Hi,

Because I would also like to test Tachyon based FC card on a N, I had the
opportunity to discuss by email with the maintainer of this code (iirc on
sf.net). He recognised himself that it would have to re-writte but have no
time to do :(

For my part, I didn't find much more doc on this cards and so abandon the
idea to write this code (I am also a beginner in this field).
I can just wish you better success :)

Joel



-------------------------------------------------------------------------
L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro
pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr 
