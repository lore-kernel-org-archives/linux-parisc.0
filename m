Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA16761
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Jun 1999 23:34:28 -0600
Received: from srmail.sr.hp.com (srmail.sr.hp.com [15.4.45.14])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id WAA23626
	for <parisc-linux@thepuffingroup.com>; Mon, 14 Jun 1999 22:34:20 -0700 (PDT)
Received: (from billk@localhost) by meow.sr.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0) id WAA14372 for parisc-linux@thepuffingroup.com; Mon, 14 Jun 1999 22:34:16 -0700 (PDT)
Message-Id: <199906150534.WAA14372@meow.sr.hp.com>
Subject: Re: [parisc-linux] Dino PCI and I/O spaces (fwd)
To: parisc-linux@thepuffingroup.com
Date: Mon, 14 Jun 1999 22:34:16 -0700 (PDT)
From: Bill Katz <billk@sr.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

|Alan Cox wrote:
|> > > accesses. There seems to be no way to do byte sized config accesses, do
|> > > I just read 32bits mask and write 32bits ?
|> > 
|> > I thought Dino will forward the byte enables to the PCI bus.
|> > PCI-PCI bridge numbering I think depends on this.
|> 
|> So how do I set those. The documentaiton also says the low two bits of
|> the register read back as 0. I guess that doesnt actually imply that the
|> write of it has no affect. 
|
|The PCI_CONFIG_ADDR register (offset 0x64) is used to source the
|word address. So it's not surprising the lower order bits are RO.
|
|"Byte enables" are GSC and PCI bus signals - not register contents.
|The PA processor generates byte enable signals on the GSC bus and
|Dino forwards those for the appropriate bytes (swapped to match
|the swapping/endian conversion done for the PCI_CONFIG_DATA register.)
|The byte enable signals are taken when a processor read/write targets
|the PCI_CONFIG_DATA register (offset 0x68). The contents of PCI_CONFIG_ADDR
|and bytes enable signals from GSC bus are combined to generate a read/write
|transaction on the PCI bus.
|
|(Disclaimer: I'm not as certain of the above as it sounds though I
|believe it's correct - remember, I'm a SW engineer :^)
|

Grant has it right.  I've watchedd Dino with a full logic analyzer on
both GSC and PCI...  The 4 byte enables get swapped as Grant described
and if you do a single byte access, a single byte pops out the other side.

	-Bill
