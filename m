From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Resurrecting my C3000.
Date: Thu, 23 Dec 2010 13:31:46 -0500
Message-ID: <AANLkTimOpLijMDTttD-MD9uKfGFz6KrnCmae71-S=Deq@mail.gmail.com>
References: <AANLkTinFSs6z35AcsAWZ8AuvvPgSDwj8G6Xt4uhOY1XV@mail.gmail.com>
	<20101223182318.A026E4E69@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101223182318.A026E4E69@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Dec 23, 2010 at 1:23 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> The workstation reference manual for the C3000 has this to say:
>> Ostat: INI
>> Code: 8890
>> FRU: IO BD
>> Message: early Super init
>> Description: Initializing Super-I/O for early RS-232 output.
>>
>> Technically one must re-seat or replace the failing FRU, but I don't
>> know what FRU "IO BD" is? The motherboard? :-(
>>
>> Any ideas?
>
> Possibly this manual will help:
> http://bizsupport1.austin.hp.com/bc/docs/support/SupportManual/lpv383=
36/lpv38336.pdf
>
> I don't think this is motherboard. =A0Look for board with RS-232 conn=
ector.

The C3K is a single board system, the RS-232 connectors on the back
are mounted and routed directly to the motherboard (like a common PC).

If I remove the disks, CDROM, floppy, and memory from the system, it
still powers up and displays the same error.

I was surprised it booted without any ram in the slots, but it's a
robust design :-)

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
