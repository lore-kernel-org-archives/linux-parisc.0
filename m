Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id F395B482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Jan 2002 05:30:05 -0700 (MST)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel9.hp.com (Postfix) with ESMTP id BEC94E00231
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Jan 2002 07:30:04 -0500 (EST)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id FAA22547
	for parisc-linux@lists.parisc-linux.org; Tue, 8 Jan 2002 05:30:04 -0700 (MST)
Date: Tue, 8 Jan 2002 05:30:04 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200201081230.FAA22547@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] any info on 710/Bushmaster Audio available?
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

> I'd like to make the audio part of my 710 usable, even if it's only
> 'voice quality' according to the LASI docs.
>
> Actually, I can't find much documentation for this part. It's
> mentioned in the LASI docs, but no details of course. I understand
> that it should be in the "Cobra/Coral I/O ESR", that is not available
> yet(?). I found some mails in the list archive promising to make it
> available in 1999 ;-) Is there a status? Maybe something like the
> "Vivace ESR" would be helpful, too.

The hardball ERS that is available is almost an exact duplicate of the
Cobra/Coral ERS, i.e. not that much changed. Neither document provides
any info on the 705/710 audio interface. The Vivace ERS is the document
that describes the first implementation of CD quality audio. That
functionality was incorporated into LASI in later machines, and the
interface is essentially the same. That document would not be helpful
for the 705/710 either.

The audio codec on the 705/710 is a Siemens PSB 2160. I tried looking
on their website for information, and the only info I found was that
it was replaced by the PSB 2161. I don't know if you can still find
documentation on that old chip, or if the PSB 2161 is programmatically
similar. I cannot currently locate my printed documentation on the
chip.

The interface to the PSB 2160 is the same as what was developed for
"Woody", otherwise known as a 425e, which was a 68040 based HP
workstation. I've enclosed what little documentation exists for
the 68040 interface. If you can find documentation on the PSB 2160
then you should be able to use the following information to write
a driver.

Note that what is meant by "voice" quality is that the codec only
supports a fixed sampling rate if 8 Khz. Note that this interface
does not support dma, it is a PIO device only.

John Marvin
jsm@fc.hp.com

-----

	Woody Audio Interface
	---------------------

Below find the preliminary software model for the Woody audio interface.
This interface incorporates an inbound FIFO, an outbound FIFO, and a
control FIFO that interfaces to a CODEC (coder/decoder).  The CODEC is a
SIEMENS PSB2160 that contains an 8kHz sampling rate D/A, A/D, programable
input/ouput gain and filter coefficients.  The converters will
generate/accept uLaw ("MULAW") or Alaw 8 bit data or 16 bit linear data (I
beleive that the converters only have about 13 significant bits) The CODEC
also has a DTMF (dual tone multiple frequency) generator, a tone
generator, and a ringing generator and software selectable internal
speaker or headphones.

Basically there are three communications channels which can be fully
overlapped.  They are the inbound and outbound data and the control
channels.  The inbound data channel is digitized microphone input and has
a 128 byte FIFO although software should not depend on this size.  The
outbound data channel drives either the internal speaker or the headphones
jack, this channel also has a 128 byte FIFO.  The control channel is
outbound only and controls the operation of the CODEC.  Control commands
are 1 to 9 bytes in length and must be sent to the CODEC in successive
125us Frames.  The control channel has a 16 byte FIFO, and software should
guarantee that an entire command is written to the FIFO before the FIFO
drains -- this shouldn't be too hard since it drains at an 8k byte/s rate.
The controller will automatically send a NOP (FF) command to the CODEC if
there is nothing in the control FIFO, and will send a zero (00) data byte
to the CODEC if there is nothing in the outbound FIFO.

Register 1 (offset 1 from base address): byte

	read:	ID:	0x13 (19)	This is the card ID
	write:	reset.			This will reset the FIFOs and machine.

Register 3 (offset 3): byte

	read:	Status:	bit 7 (MSB)	IE (r/w) interrupt enable
			bit 6  		IR (r)interrupt request. 
			bit 5,4         IL1,IL0; interrupt level (1,1;level 6)
			bit 3		16 bit mode if set (1), 8 bit otherwise
			bit 2		Control channel enable if set (1)
			bit 1           0
			bit 0		Inbound channel enable if set (1)
					 Clears inbound FIFO if clear (0)

			Power-up/reset value is 0x30.

	write:	Status:	bit 7 (MSB)	IE (r/w) interrupt enable
			bit 6  		readonly
			bit 5,4		readonly
			bit 3		16 bit mode
			bit 2		control channel enable
			bit 1           readonly
			bit 0		inbound channel enable

Register 5 (offset 5): byte

	read:	intr  :	bit 7 (MSB)	Outbound FIFO empty interrupt enable.
			bit 6 		Control FIFO empty interrupt enable.
			bit 5  		Outbound FIFO less than half full
					 interrupt enable.
			bit 4  		Inbound FIFO more than half full
					 interrupt enable.
			bit 3  		Outbound FIFO empty interrupt request.
			bit 2  		Control FIFO empty interrupt request.
			bit 1  		Outbound FIFO less than half full
					 interrupt request.
			bit 0  		Inbound FIFO more than half full
					 interrupt request.

	write:	intr  :	bit 7 (MSB)	Outbound FIFO empty interrupt enable.
			bit 6 		Control FIFO empty interrupt enable.
			bit 5  		Outbound FIFO less than half full
					 interrupt enable.
			bit 4  		Inbound FIFO more than half full
					 interrupt enable.
			bit 3  		readonly
			bit 2  		readonly
			bit 1  		readonly
			bit 0  		readonly

Register 7 (offset 7): byte, readonly

	read:	intr  :	bit 7 (MSB)	Undefined
			bit 6 		Undefined
			bit 5  		Control FIFO full
			bit 4  		Control FIFO empty
			bit 3  		Outbound FIFO full
			bit 2  		Outbound FIFO empty
			bit 1  		Inbound FIFO full
			bit 0  		Inbound FIFO empty

Register 9 (offset 9): byte

	read:	inbound Data:		Read data from inbound FIFO
					 (must be enabled and not EMPTY)
	write:	outbound Data:		Write data to outbound FIFO
					 (must not be FULL)

Register 11 (offset 11): byte, writeonly

	write:  control Data:           Write data to control FIFO
					 (must not be FULL)


The interrupts asserted when the FIFO is less than half full on outbound
transfers or greater than half full on inbound transfers have 16 byte
resolution -- 64 bytes +/- 16 bytes is half-full/empty.
