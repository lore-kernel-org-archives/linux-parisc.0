From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA hang with PCI SERR or PARITY enabling
Date: Mon, 15 Jun 2009 10:06:10 -0400 (EDT)
Message-ID: <20090615140610.E26A14FE3@hiauly1.hia.nrc.ca>
References: <Pine.SOC.4.64.0906151310150.20680@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: mroos@linux.ee (Meelis Roos)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.SOC.4.64.0906151310150.20680@math.ut.ee> from "Meelis Roos" at Jun 15, 2009 01:24:18 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> [17179584.300000] tulip 0000:18:00.0: enabling device (0000 -> 0003)
> [17179584.308000] tulip 0000:18:00.0: enabling SERR and PARITY (0003 -> 0143)
> 
> ************* SYSTEM ALERT **************
> SYSTEM NAME: scaspdb24

As noted here,
http://osdir.com/ml/linux.ports.hppa/2007-07/msg00036.html
the VFP may have obscured some kernel output.  It may be available
in the console log.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
