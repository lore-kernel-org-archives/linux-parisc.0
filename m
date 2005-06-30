From: "Christopher James Weatherby" <chrisw@merseymail.com>
Subject: Re: [parisc-linux] PCI SCSI Card in slot 1 disabled :(
Date: Thu, 30 Jun 2005 11:51:02 +0100
Message-ID: <E1DnwdK-0006cH-7z@argon.connect.org.uk>
Reply-To: Christopher James Weatherby <chrisw@merseymail.com>
Cc: parisc-linux@lists.parisc-linux.org
To: "Scott Edwards" <supadupa@gmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Scott,
         I've had the same problem with my B132L, and pci cards.
 Its all to do with the Firmware version your machine is running.
 In the later versions of the Firmware , HP, in its wisdom decided to
prevent any non-supported cards (from the cards id, rather than the
chipsets), from running on their workstations, and
prevent the machine from booting, if one was inserted.My machine used to
happily boot with a wide range of PCI cards, but stopped when I upgraded to
the last Firmware version (6.1, I think).
 I think the only solution is to find an older version of the firmware, and
downgrade the machine. 
However I've never been able to find older versions of the firmware for a
B132L on HP's patch/firmware site (http://itrc.hp.com/ /
ftp://ftp.itrc.hp.com/ )

 Does anyone else know of archived sources of HP firmware?
      
    
              Chris Weatherby.

> I have a B132L workstation that I just added a symbios SCSI card to. 
> I've unable to complete POST.  Upon bootup I see a message like this:
> 
> Primary boot path   SESCSI.6.0
> Alternate boot path  SESCSI.0.0
> Console path   GRAPHICS(0)
> Keyboard path:   PS2
>  *****
>   *****  Disabled the PCI SCSI card in slot 1.
>  *****
> 
> An unsupported PCI I/O configuration has been detected.
> 
> Contact you HP service representative for warranty service to enable
> the card(s) listed above.
> 
> To use this system before those repairs are complete, power down the
> system, remove the card(s) listed above, and reboot.
> 
> Halting the system.
> 
> ---
> 
> This card appears to the use the same chipset as the B132L+ (mine is
> only B132L, no plus)
> 
> http://www.openpa.net/scsi.html#875
> 
> If anyone knows how to enable this card, please let me know.  I only
> found one similar reference on google groups, and nothing on google
> about this.  I assume this card is safe, IMO the halt message is more
> about HP's self interest HCL then damage on the system. (besides, how
> do they know this card will work with HP-UX?)  Irrelevant as it's
> Debian Sarge with stock 2.6 kernel.
> 
> Thanks in advance. I look forward to your responses.
> 
> 
> Scott Edwards
> --
> Daxal Communications - http://www.daxal.com
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 








--------------------------------------------------------------------
FREE learndirect courses for Merseyside SMEs and individual learners
Register at: http://www.connectbusinesscentre.com/learndirect/?mmf
See what you can achieve
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
