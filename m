Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.66.220])
	by dsl2.external.hp.com (Postfix) with SMTP id 33E654829
	for <parisc-linux@parisc-linux.org>; Fri, 11 Oct 2002 06:33:17 -0600 (MDT)
Received: from postamt1.charite.de (postamt1.charite.de [193.175.66.246])
	by hauptpostamt.charite.de (Postfix) with ESMTP id 77E9215C011
	for <parisc-linux@parisc-linux.org>; Fri, 11 Oct 2002 14:33:13 +0200 (CEST)
Date: Fri, 11 Oct 2002 14:33:12 +0200
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] hardware features of 712-60 ?
Message-ID: <20021011123312.GP16680@charite.de>
References: <20021011132811.6e84c1d8.varenet@esiee.fr> <Pine.LNX.4.21.0210111454200.24681-100000@hal.pp.fishpool.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0210111454200.24681-100000@hal.pp.fishpool.fi>
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

> Right, let's run through this list and see if it's as clear as you think:
> 
> 1) Gecko (712/60) (Processor) (PA7100LC (PCX-L))
> 2) Gecko (Memory)
> 3) Gecko Optional RS-232 (Foreign I/O Module) (Serial driver)
> 4) Gecko Optional Lan (802.3) (Foreign I/O Module) (Lasi_82596 driver)
> 5) Gecko Core PC Keyboard (Foreign I/O Module) (PS/2 driver)
> 6) Gecko Core PC Floppy (Foreign I/O Module)
> 7) Gecko Audio (Foreign I/O Module) (Harmony driver)
> 8) Gecko Core Centronics (Foreign I/O Module) (Parallel driver)
> 9) Gecko Core RS-232 (Foreign I/O Module) (Serial driver)
> a) Gecko Core Lan (802.3) (Foreign I/O Module) (Lasi_82596 driver)
> b) Gecko Core SCSI (Foreign I/O Module) (NCR53c710 driver)
> c) Gecko GSC Core Graphics (Foreign I/O Module)
> d) Gecko Optional BA (Bus Adapter) (Lasi driver)
> e) Gecko Core BA (Bus Adapter) (Lasi driver) 

I have a kernel config for a 712/80 where I threw out all the crap I
didn't need and I build as much as possible as a module. Interested?

-- 
Ralf Hildebrandt (Im Auftrag des Referat V a)   Ralf.Hildebrandt@charite.de
Charite Campus Mitte                            Tel.  +49 (0)30-450 570-155
Referat V a - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
Why you can't find your system administrators:
Is out back beating a luser into corn mash who asked "When will the system be back up" one time too many. 
