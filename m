From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA hang with PCI SERR or PARITY enabling
Date: Mon, 15 Jun 2009 09:45:18 -0400 (EDT)
Message-ID: <20090615134519.6EE824FC5@hiauly1.hia.nrc.ca>
References: <Pine.SOC.4.64.0906151310150.20680@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: mroos@linux.ee (Meelis Roos)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.SOC.4.64.0906151310150.20680@math.ut.ee> from "Meelis Roos" at Jun 15, 2009 01:24:18 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> SYSTEM NAME: scaspdb24
> DATE: 06/15/2009 TIME: 09:44:55
> ALERT LEVEL: 7 = reserved
> 
> REASON FOR ALERT
> SOURCE: 0 = unknown, no source stated
> SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
> PROBLEM DETAIL: 0 = no problem detail
> 
> LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
>        OFF      FLASH         FLASH     ON         ON
> LED State: Unrecognized state - Refer to LED Decoder on your Support CD.
> 
> 0x0000007000FF6292 000000F0 F0000000 - type  0 = Data Field Unused
> 0x5800087000FF6292 00006D05 0F092C37 - type 11 = Timestamp 06/15/2009 09:44:55

I believe FF6292 is a HPMC.  Please collect and post the "ser pim" output
for the above.  It would also help if the location of the HPMC can be related
to your compiled kernel using objdump.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
