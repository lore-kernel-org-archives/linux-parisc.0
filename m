Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.66.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id C3ACC4875
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Jul 2002 06:17:39 -0600 (MDT)
Date: Wed, 3 Jul 2002 14:17:38 +0200
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: Carlos O'Donell <carlos@baldric.uwo.ca>,
	Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Power Button doesn't turn machine off anymore
Message-ID: <20020703121737.GS15228@charite.de>
References: <20020702183558.GO25586@charite.de> <B1225F09-8DEC-11D6-A95C-0030656F07A2@esiee.fr> <20020702185708.GP25586@charite.de> <20020702190606.GA3678@systemhalted> <20020702190842.GR25586@charite.de> <20020702192147.GC3678@systemhalted> <20020702193116.GU25586@charite.de> <20020703052415.GB32490@charite.de> <20020703121306.GA8464@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020703121306.GA8464@systemhalted>
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

Am 03.07.2002 um 08:13:06 -0400 schrieb Carlos O'Donell folgendes:

> Do you see _anything_ in your log files when you press
> the power switch?

Nada. Nothing. Zippo. Zilch.
 
> Could you please post the .config that your kernel 
> builds with?

I rebooted this morning after I recompiled a kernel. I added
CONFIG_IOMMU_CCIO=y
but I have yet to see if it turns itself off now when the button is
pressed. Note that it used to work WITHOUT

CONFIG_IOMMU_CCIO=y

Jul  3 11:24:31 gecko kernel: Initializing RT netlink socket
Jul  3 11:24:31 gecko kernel: Gecko-style soft power switch enabled.
Jul  3 11:24:31 gecko kernel: Starting kswapd

Linux gecko 2.4.18-pa46 #1 Wed Jul 3 09:48:44 CEST 2002 parisc unknown


-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
ignorami: n: 
The BOFH art of folding problem lusers into representational shapes.
