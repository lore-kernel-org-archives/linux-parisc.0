Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bob.ncssm.edu (bob.ncssm.edu [152.34.37.42])
	by dsl2.external.hp.com (Postfix) with SMTP id 67816482C
	for <parisc-linux@parisc-linux.org>; Tue, 13 Nov 2001 14:23:20 -0700 (MST)
Date: Tue, 13 Nov 2001 16:18:49 -0500 (EST)
From: Phil Anderson <andersop@neverland.ncssm.edu>
To: <parisc-linux@parisc-linux.org>
In-Reply-To: <20011113182825.A20911@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.33.0111131610080.9967-100000@bob.ncssm.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] First Time Install on 712/80i
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

Hi!

I've been following this list for a while ever since my school handed me 5
735's, some "Series 700's" and three 712's. I asked around and decided to
try to install pa-risc linux on the 712's as they "have better support".
So, I'm sitting here with the machine running. There's a SCSI cd-rw on the
SCSI-2 port. The machine is a 712/80i with 1 GB disk and 64MB ram, also an
internal floppy.

I have a copy of pa-risc linux, the ~134MB 0.9.2 ISO file, on a CD. It
will boot, and all's fine in the debian installation until the "Configure
Device Driver Modules" step.  When I do this, it claims,

"No modules were found in /target/lib/modules/2.4.0-32 that could be
configured. Please install the kernel modules first, bu running the
"Configure Device Driver Modules" step"

I take it you can see my quandrary.

Does anyone know what to do? I've heard a serial install works better,
what does that entail? Also, I believe that this is a 64 bit machine, am I
right?

With the serial install, I have a VT 420 on the serial port. I tried
booting a copy of the parisc 64 bit serial ISO but it didn't work...

I know the CDrom is good too because I can install HPUX 10.20 off CD from
that same drive, on the same computer.

Thanks,

-phil


-- 
===============================================================================

Phil Anderson
UNIX Systems Admin
andersop@neverland.ncssm.edu
The_13th_Ewok@hotmail.com

"Go CRAZY? Don't mind if I do! Woowoowoowoo!" -Homer Simpson
