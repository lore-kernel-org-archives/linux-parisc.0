Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "B. Douglas Hilton" <bdhilton@charter.net>
Cc: parisc-linux@lists.parisc-linux.org,
	grundler@dsl2.external.hp.com
Subject: Re: [parisc-linux] PCI Intel EtherExpressPro100 strangeness on C200 machine. 
In-Reply-To: Message from "B. Douglas Hilton" <bdhilton@charter.net>
   of "Mon, 19 Aug 2002 19:00:12 EDT." <3D61787C.7060502@charter.net>
References: <3D5EB2D6.9090403@charter.net> <20020817223713.GA25852@gate450.dyndns.org> <20020818051633.209BD4829@dsl2.external.hp.com> <3D5FC35F.7060402@charter.net>  <3D61787C.7060502@charter.net> 
Date: Mon, 19 Aug 2002 17:58:58 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020819235858.475274829@dsl2.external.hp.com>
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

"B. Douglas Hilton" wrote:
> None of this brought back my motherboard's original
> ethernet devices. I wish I could figure out what happened,
> but I know that the never worked again after plugging a
> HCRX-24Z card into the GSC bus.

Sounds like static or something fried the GSC devices on that bus.

> "... Something really bad has happened ..." but it never
> re-appeared, and neither did the tulip or LASI ether devices.

ouch.

...
> About the last thing in the world I want to do is buy a
> tape drive just to reload my firmware. Maybe one of you wizards
> could cook up a way to flash it from linux like is done on
> a Netwinder?

If you can ressurrect built-in LAN or find an add-on Tulip card,
you could netboot the firmware update (it's a LIF image).

grant
