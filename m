Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.73.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id B5B054840
	for <parisc-linux@lists.parisc-linux.org>; Sat, 23 Feb 2002 06:58:42 -0700 (MST)
Date: Sat, 23 Feb 2002 14:58:40 +0100
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: nsc <nsc@connectednet.co.uk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problem installing 0.9.3 on 715/100XC
Message-ID: <20020223135840.GG25954@charite.de>
References: <200202231352.NAA04205@liberator.zorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200202231352.NAA04205@liberator.zorg.org>
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

On Sat, Feb 23, 2002 at 01:52:10PM +0000, nsc wrote:

> 'sea ipl' shows the CD-ROM
> 
> So I issue 'boot scsi.2.0 ipl' and the get the following:

For mee "boot scsi.2.0" was sufficient.

> This machine has BootRom Version 1.1, could this be causing a problem?

You could try updating the BootRom via bootp/tftp, but booting from
CDROM is something even the buggiest rom MUST handle.

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
Why you can't find your system administrators:
(S)he's off round the building trying to find who has tured off which router, or have they just unplugged our link to the outside world. --Ian (God they both happened in one week) Dobbie ian@muscle.kcl.ac.uk
