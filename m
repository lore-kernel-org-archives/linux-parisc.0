Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4F9AF48AE
	for <parisc-linux@parisc-linux.org>; Tue,  2 Oct 2001 09:20:57 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Bjorn Helgaas <bjorn_helgaas@hp.com>
To: Thomas Marteau <marteaut@esiee.fr>,
	"parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Second Draft of the help for the kernel options
Date: Tue, 2 Oct 2001 09:23:20 -0600
References: <3BB8F957.C9811C25@esiee.fr>
In-Reply-To: <3BB8F957.C9811C25@esiee.fr>
MIME-Version: 1.0
Message-Id: <20011002152055.DE860403B@ldl.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

>   Finally, PA8x00 is the good choice for all new stuff like A500, B1000,
>   B2000, B2600, C200+, C240+, C3000, C3600, J282, J2240, J5000, J6000,
>   J6700, J7000, K250, K260, K270, K370, K450, K460, K470, K570, L1000,
>   L2000, L3000, N4000, V2200, V2250, V2500.

I think it is unlikely that V2200, V2250, and V2500 will ever be supported.

I'm not very familiar with PDC on most of these machines, but at least on 
Halfdome, you can get a pretty good clue as to what processor to target by 
doing "in fru" at the PDC BCH menu:

  Main Menu: Enter command or menu > in fru

  CELL 0 CPU FRU INFORMATION:             

  Cab/
  Slot/                     Part        Serial    Date Art Scan   FRU   
Specific
  CPU       FRU Name       Number       Number    Code Rev  Rev   
Information
  ----- ---------------- ----------- ------------ ---- --- ---- 
----------------
  0/0/0        Processor A6445-70001 00000000001P          0000   PA8700 
Rev 2.2

Maybe a pointer to similar functionality in other firmware would be useful 
and reduce the dependence on the lists of machines.
