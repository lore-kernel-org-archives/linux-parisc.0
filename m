Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.66.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id B2A81482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 May 2002 08:25:27 -0600 (MDT)
Date: Tue, 7 May 2002 16:25:25 +0200
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: DerrickMcCray@aol.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP 9000 systems
Message-ID: <20020507142525.GL23511@charite.de>
References: <110.11d06265.2a08e5e6@aol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <110.11d06265.2a08e5e6@aol.com>
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

On Tue, May 07, 2002 at 04:10:14AM -0400, DerrickMcCray@aol.com wrote:
> Hi, 
> I recently ran across some HP 9000 715/80 and 712/60 computers at a garage 
> sale and bought 4 systems for 70 dollars. There is no operating system on the 

Way to go!

> computers and no cd-rom drive. My question is how can a get PA-Risc Linux 
> installed on these machines because I can't seem to get the systems to boot 
> from the floppy drive. What is the best way to get PA-Risc Linux installed on 
> the systems. Any information will be greatly appreciated. Thank you.

Either you get a SCSI CD-ROM to boot from and use the 0.9.3 or better
ISO image or your boot from a DHCP/BOOTP server:

http://pateam.esiee.fr/parisc-linux-boot/parisc-linux-boot.html#BOOTNETWORK

Warning: This may not be for the faint of heart.

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
Why you can't find your system administrators:
Hiding in another office where he can work without getting interrupted. 
