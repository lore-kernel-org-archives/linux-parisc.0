Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.66.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id 442B34846
	for <parisc-linux@lists.parisc-linux.org>; Sat, 15 Jun 2002 01:52:12 -0600 (MDT)
Date: Sat, 15 Jun 2002 09:52:09 +0200
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: Masliy Alex <masliy@kfti.knc.ru>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP PA 715/50 installation trouble
Message-ID: <20020615075209.GK8736@charite.de>
References: <adn_155_0_@dionis.kfti.knc.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <adn_155_0_@dionis.kfti.knc.ru>
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

On Sat, Jun 15, 2002 at 11:43:36AM +0400, Masliy Alex wrote:
> I have some troubles in installation of Linux on HP PA 715/50
> 
> I have the following hardvare - HP PA 715/50 WS, 64Mb RAM, 1Gb SCSI HDD
> QUANTUM LPS1080, DDS Tape Drive HP6400 2000, Floppy Drive Teac and CDROM
> Nec CDR84JD-1
> 
> I have downloaded the last stable release - Debian port on HP PA 0.9.3 -
> 469Mb iso image
> 
> At first, I tried to install from CDROM. In the proccess of booting the
> following messages were printed:
> ---------------
> Trying to scsi.4.0
> Failed to initialize scsi.4.0
> ENTRY_INIT status = -13

Hmm. Was this drive working with that box under HP-UX?

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
USER, n.: The word computer professionals use when they mean "idiot."
                              --Dave Barry, "Claw Your Way to the Top
