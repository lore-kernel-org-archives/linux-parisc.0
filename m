Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from relay-5m.club-internet.fr (relay-5m.club-internet.fr [194.158.104.44])
	by dsl2.external.hp.com (Postfix) with ESMTP id A31C0482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Feb 2003 10:19:31 -0700 (MST)
Received: from club-internet.fr (f14m-5-74.d1.club-internet.fr [212.195.92.74])
	by relay-5m.club-internet.fr (Postfix) with SMTP id 858B0E07B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Feb 2003 18:19:44 +0100 (CET)
From: Bad Max <badmax@club-internet.fr>
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 11 Feb 2003 18:20:13 +0200
Message-ID: <yam9172.666.149231680@mail.club-internet.fr>
In-Reply-To: <3E4922F6.8020206@bluehash.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] Re: Tag Starvation on 715/100
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

Hello

On my 712/80, I could also read the same message but I do not have any
SCSI error. It is running under 2.4.17-pa20.

On 11-fév-03, you wrote:

| > Hi,
| > 
| > today my machine hangs when I tried to do a 'cvs update' for the newest
| > PA/RISC-Kernel. So I pressed the power button to reboot the machine. But
| > now during startup when fsck is running, the scsi-driver gives me an
| > error message, that my harddisc is "suffering from tag starvation".
| > Later the machine crashes. Booting a 2.5.59-kernel is no problem (even
| > it's not possible to login on serial console... ).
| > 
| > Has anybody the same problem and/or can anybody help?
| > 
| > Facts: 715/100, 128 MB, 2 GB Seagate, Kernel 2.4.20-pa22, gcc-3.0.4, 
| > Debian testing.
| > System.map is here: 
| > http://homepages.tu-darmstadt.de/~rscholz/parisc/System.map 
| > <http://homepages.tu-darmstadt.de/%7Erscholz/parisc/System.map>
| > 
| > TIA, Rüdiger
| > 

-------
Bad Max
========
Amiga User
GNU User
WWW: perso.club-internet.fr/badmax
