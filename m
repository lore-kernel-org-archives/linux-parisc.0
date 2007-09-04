From: Rob Sciuk <rob@controlq.com>
Subject: Re: Unknown device 0x0005f
Date: Tue, 4 Sep 2007 19:56:23 -0400 (EDT)
Message-ID: <20070904195341.E32489__7555.16176946021$1416624433$gmane$org@saddam.controlq.com>
References: <20070828215632.R6291@saddam.controlq.com> <200709042213.25542.deller@gmx.de>
 <20070904172254.Q31055@saddam.controlq.com> <200709042344.30215.deller@gmx.de>
 <20070904221537.GV14130@parisc-linux.org>
Reply-To: rob@controlq.com
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII;
  format=flowed
Cc: Helge Deller <deller@gmx.de>,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <rob@controlq.com>
In-Reply-To: <20070904221537.GV14130@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 4 Sep 2007, Matthew Wilcox wrote:

> Date: Tue, 4 Sep 2007 16:15:37 -0600
> From: Matthew Wilcox <matthew@wil.cx>
> To: Helge Deller <deller@gmx.de>
> Cc: rob@controlq.com, parisc-linux@lists.parisc-linux.org,
>     debian-hppa@lists.debian.org
> Subject: Unknown device 0x0005f
> 
> On Tue, Sep 04, 2007 at 11:44:29PM +0200, Helge Deller wrote:
>> Additionally, does someone knows what this device is ?
>>> 12. unknown device at 0xf190c000 [10/4/12] { 2, 0x0, 0x004, 0x0005f }
>
> I don't.  We don't have anything with the 0x0005f programming model in
> the database.  We have:
>
>        {HPHW_A_DMA, 0x004, 0x00050, 0x80, "Lanbrusca 802.3 (36967A)"},
>        {HPHW_B_DMA, 0x008, 0x00051, 0x80, "HP-PB Transit 802.3"},
>        {HPHW_B_DMA, 0x004, 0x00052, 0x80, "Miura LAN/Console (J2146A)"},
>        {HPHW_A_DMA, 0x004, 0x00056, 0x80, "HP-PB LoQuix FDDI"},
>        {HPHW_A_DMA, 0x004, 0x00057, 0x80, "HP-PB LoQuix FDDI (28670A)"},
>        {HPHW_B_DMA, 0x008, 0x00058, 0x80, "HP-PB Transit 802.4"},
>        {HPHW_A_DMA, 0x004, 0x0005E, 0x00, "Gecko Add-on Token Ring"},
>
> The owner could probably help us out by taking a look at the card in
> slot 10/4/12 and seeing what chips are on it, and what connectors it has.

I can photograph it, if you like, how does one determine where slot 
10/4/12 is??  I know that there are a couple of mux boards on the back, 
but frankly I haven't opened up the box as of yet.  Pointers?

Cheers,
Rob.
