Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080C82B2487.cpe.net.cable.rogers.com [24.112.142.143])
	by dsl2.external.hp.com (Postfix) with ESMTP id A229F482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Jan 2002 14:59:26 -0700 (MST)
Date: Tue, 8 Jan 2002 17:00:22 -0500
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Sorin Ghinescu <sghinesc@columbus.rr.com>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20020108170022.X11181@systemhalted>
References: <20020103180330.464F9482E@dsl2.external.hp.com> <001001c19861$55b59de0$0800a8c0@beta>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <001001c19861$55b59de0$0800a8c0@beta>; from sghinesc@columbus.rr.com on Tue, Jan 08, 2002 at 11:27:10AM -0500
Subject: [parisc-linux] 53c700 SCSI Driver Problems ~?= 712/80 and Quantum Fireball 1050MB HD problem
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

> Help with the following problem would be much appreciated:
> 
> I boot parisc-linux from cd-drive and everything goes fine except the HD
> is not detected. All other hardware is correctly detected. The
> installation program recommends passing args to boot: or load
> appropriate module.
> 
> Has anyone experienced this kind of problem?
> Thanks
> Sorin
>

Can you try to get a snip of text printed by the SCSI driver?

I seem to be having some issues with the newer SCSI driver
(October merge) on my 715/50's ... I'll post my info tommorow.

In particular (0.9.3 Install with apt-get updates):

Kernel 2.4.16-pa21 (Will be updating tommorow)

- Most of the drives I put into the box refuse to spinup.
	= E.g. "spinning up....." until timeout

- Boxes with 525MB HP Quantum ProDrive HD's lockup solid in
  mke2fs while writing superblocks (always happens).

- Drives that do spinup are reported as 0MB's because the 
  sector size was invalid (4GIG Barracudas)

- Random lockups accessing the drive on 712/50's that 
  seem to have functional drives. Usually manifested as
  a solid lock at a Random time during Init scripts.
  (I know cause I ran init=/bin/sh and straced evertyhing)

Most of our cluster is running 2.4.9-pa25 <= Very Stable.

Mind you, the latest kernel runs fine on our 712/60. 
And since the problem _looks_ to be SCSI related...
that's what I'm going to try investigate.

=-= Help investigating =-=

I'm wondering if I'll need to get kgdb??
Or something other than serial?
The box _locks_ solid, no response, and I'm not quite sure
how to diagnose that.

c.
