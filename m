Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id C08504829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Aug 2002 18:18:29 -0600 (MDT)
To: "Michael S. Zick" <mszick@goquest.com>
Cc: "B. Douglas Hilton" <bdhilton@charter.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PCI Intel EtherExpressPro100 strangeness on
 C200 machine.
In-Reply-To: Message from Michael S.Zick <mszick@goquest.com>
   of "Mon, 19 Aug 2002 19:04:04 CDT." <02081919040400.26310@localhost.localdomain>
References: <3D5EB2D6.9090403@charter.net> <3D61787C.7060502@charter.net>
 <20020819235858.475274829@dsl2.external.hp.com>  <02081919040400.26310@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 19 Aug 2002 18:18:26 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020820001826.5672E37D68@carmen.fc.hp.com>
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

Michael S. Zick writes...

> On Monday 19 August 2002 06:58 pm, Grant Grundler wrote:
> > "B. Douglas Hilton" wrote:
> > ...
> >
> > > About the last thing in the world I want to do is buy a
> > > tape drive just to reload my firmware. Maybe one of you wizards
> > > could cook up a way to flash it from linux like is done on
> > > a Netwinder?
> >
> > If you can ressurrect built-in LAN or find an add-on Tulip card,
> > you could netboot the firmware update (it's a LIF image).
> >
> > grant
> Perhaps that old type of install, build SCSI disk on different machine, 
> physically move disk ot C200.

Yeah or a scsi cdrom. Just use cdrecord to burn the firmware update 
lifimage straight to the disk.

-- 
Matt Taggart
taggart@fc.hp.com
