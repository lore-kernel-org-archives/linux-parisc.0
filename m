Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc2-hem11-4-cust120.bre.cable.ntl.com [213.107.176.120])
	by dsl2.external.hp.com (Postfix) with ESMTP id 58900482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Sep 2002 02:26:06 -0600 (MDT)
Date: Sun, 15 Sep 2002 08:17:16 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Thibaut VARENE <varenet@esiee.fr>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Making SYM2 default SYM-SCSI driver instead of SYM1
Message-ID: <20020915071716.GD20720@sleepie.demon.co.uk>
References: <3D8212E7.6000609@esiee.fr> <20020913190929.8F8084829@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020913190929.8F8084829@dsl2.external.hp.com>
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

On Fri, Sep 13, 2002 at 01:09:29PM -0600, Grant Grundler wrote:
> Thibaut VARENE wrote:
> > Now I'm asking you to know if anybody has an objection against making 
> > SYM2 the default driver in debian-configs instead of old SYM1.
> 
> I don't. All the boxes I care about have 53c8xx chips in them.

I don't think that is relevant.  SYM1 and SYM2 both only drive 53c8xx
chips (and newer, 53c1010, etc).  SYM1 didn't drive some of the nearly
53c810 chips (iirc), and you needed ncr53c8xx.c to drive those.

> A slightly safer approach is to make sym2 the default for PA2.0 systems
> and the old sym the default for PA1.1 systems. But GSC/HSC c720 cards
> don't fit that model since they go into systems with either sub-arch.

There was no linux driver for 53c720 before parisc.  Now we drive 53c720
with a modified ncr53c8xx.  So, something like my B180 with a bluefish
card uses:

CONFIG_SCSI_LASI700 (James driver) for 53c710 (cdrom)
CONFIG_SCSI_ZALON (modified ncr53c8xx) for 53c720 on blusfish
CONFIG_SCSI_SYM53C8XX (SYMV1) for 53c8?? main disk interface

So, in theory, chnaging to CONFIG_SCSI_SYM53C8XX_2 for all configs
shouldn't upset anyone.  SYM1 and SYM2 both only drive PCI chips, so
that makes the change irrelevant to earlier boxes anyway.

Cheers,
  Richard
