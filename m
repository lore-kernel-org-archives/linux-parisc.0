Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.66.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8E4084859
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Jun 2002 14:44:08 -0600 (MDT)
Date: Tue, 18 Jun 2002 22:44:04 +0200
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: Tim ter Laak <timl@scintilla.utwente.nl>
Cc: Masliy Alex <masliy@kfti.knc.ru>,
	Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP PA 715/50 installation trouble
Message-ID: <20020618204404.GC18927@charite.de>
References: <adn_159_0_@dionis.kfti.knc.ru> <Pine.LNX.4.21.0206182235280.13201-100000@utelscin.scintilla>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0206182235280.13201-100000@utelscin.scintilla>
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

Am 18.06.2002 um 22:41:04 +0200 schrieb Tim ter Laak folgendes:

> I have the exact same problem on this hardware. As long as I boot the
> kernel from network, the whole linux system comes up fine. But the BIOS
> won't load the PALO from disk. :-( Throw in the old UX disk, and it just
> boots.
> I know there's a firmware update for the faster 715's (66MHz and
> up). Could this be a firmware bug? 

Maybe. You can perform a firmware update using tftp and bootp, its just
like booting the kernel.

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
Computer /nm./: a device designed to speed and automate errors.
                                       -- From the Jargon File. 
