Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Thibaut VARENE <varenet@esiee.fr>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Making SYM2 default SYM-SCSI driver instead of SYM1 
In-Reply-To: Message from Richard Hirst <rhirst@linuxcare.com>
   of "Sun, 15 Sep 2002 08:17:16 BST." <20020915071716.GD20720@sleepie.demon.co.uk>
References: <3D8212E7.6000609@esiee.fr> <20020913190929.8F8084829@dsl2.external.hp.com>  <20020915071716.GD20720@sleepie.demon.co.uk> 
Date: Sun, 15 Sep 2002 08:35:49 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020915143549.77723482A@dsl2.external.hp.com>
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

Richard Hirst wrote:
> I don't think that is relevant.  SYM1 and SYM2 both only drive 53c8xx
> chips (and newer, 53c1010, etc).  SYM1 didn't drive some of the nearly
> 53c810 chips (iirc), and you needed ncr53c8xx.c to drive those.

Ah ok. my bad. I thought sym1 drove 53c720 but that's wrong.

Someone might consider porting the PDC_INITIATOR support to ncr53c8xx.
Should be a cut/paste from sym1 or sym2 driver.

> So, in theory, chnaging to CONFIG_SCSI_SYM53C8XX_2 for all configs
> shouldn't upset anyone.  SYM1 and SYM2 both only drive PCI chips, so
> that makes the change irrelevant to earlier boxes anyway.

OK - I've been using sym2 on both c3k and A500. I'm comfortable with it.
Sounds like I should use it on B180 as well.

Thanks for clarification richard!

grant
