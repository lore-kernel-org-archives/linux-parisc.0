Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
Cc: nsc <nsc@connectednet.co.uk>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problem installing 0.9.3 on 715/100XC 
In-Reply-To: Message from Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
   of "Sat, 23 Feb 2002 14:58:40 +0100." <20020223135840.GG25954@charite.de>
References: <200202231352.NAA04205@liberator.zorg.org>  <20020223135840.GG25954@charite.de> 
Date: Sun, 24 Feb 2002 00:16:43 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020224071643.6D6EE482D@dsl2.external.hp.com>
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

Ralf Hildebrandt wrote:
> > This machine has BootRom Version 1.1, could this be causing a problem?
> 
> You could try updating the BootRom via bootp/tftp,

If version 1.2 isn't available from HP firmware ftp site (see the FAQ),
then I'd not updated the 715/100XC.  If it is available, then the buglist
will be in the notes along with the firmware update.

> but booting from
> CDROM is something even the buggiest rom MUST handle.

THe CD-ROM might behave in some way that confuses the PDC.
It's only a bug if that CD-ROM was shipped with the machine.
ie, it's a tested and supported configuration.
That's why I keep harping about the SCSI device jumper settings.

grant
