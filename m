Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.73.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8BAA6485E
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Feb 2002 05:35:47 -0700 (MST)
Date: Thu, 21 Feb 2002 13:33:42 +0100
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: Jbit <james_a_n_lee@yahoo.com>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 712 Software Temperature
Message-ID: <20020221123342.GY4237@charite.de>
References: <3C74DF52.7090308@yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C74DF52.7090308@yahoo.com>
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

On Thu, Feb 21, 2002 at 11:51:46AM +0000, Jbit wrote:
> Hi,
> looking inside my 712, I noticed that it has a thermocouple or somthing to 
> dectect the temperature in the case.
> Tracing back the wires finds that they connect to the mainboard, and on the 
> same connector, theres 2 wires that goto the power supply.
> I'd assume this is for a secondry fan?

According to the manual, the fan shifts ito higher gear, once the
temperature exceeds 30 deg. celsius.

> Anyway, since it goes to the mainboard, does this mean its posible to find 
> out the temperature in software?

THAT would be interesting.

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
Murphy's Law is recursive.  
Washing your car to make it rain doesn't work. 
