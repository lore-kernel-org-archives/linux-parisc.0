Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from utelscin.el.utwente.nl (utelscin.el.utwente.nl [130.89.17.165])
	by dsl2.external.hp.com (Postfix) with SMTP id E0E314834
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Jun 2002 14:41:13 -0600 (MDT)
Date: Tue, 18 Jun 2002 22:41:04 +0200 (CEST)
From: Tim ter Laak <timl@scintilla.utwente.nl>
To: Masliy Alex <masliy@kfti.knc.ru>
Cc: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP PA 715/50 installation trouble
In-Reply-To: <adn_159_0_@dionis.kfti.knc.ru>
Message-ID: <Pine.LNX.4.21.0206182235280.13201-100000@utelscin.scintilla>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sat, 15 Jun 2002, Masliy Alex wrote:

> On Sat, 15 Jun 2002 09:52:09 +0200
> Ralf Hildebrandt <Ralf.Hildebrandt@charite.de> wrote:
> 
> >> At first, I tried to install from CDROM. In the proccess of booting the
> >> following messages were printed:
> >> ---------------
> >> Trying to scsi.4.0
> >> Failed to initialize scsi.4.0
> >> ENTRY_INIT status = -13
> RH> Hmm. Was this drive working with that box under HP-UX?
>     Yes, of course. I was mounted the Debian Install Disk under HP-UX.
>     But it is old device (August 1993). 
> 
I have the exact same problem on this hardware. As long as I boot the
kernel from network, the whole linux system comes up fine. But the BIOS
won't load the PALO from disk. :-( Throw in the old UX disk, and it just
boots.
I know there's a firmware update for the faster 715's (66MHz and
up). Could this be a firmware bug? 

Tim.
