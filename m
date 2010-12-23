From: Thibaut VARENE <varenet@parisc-linux.org>
Subject: Re: Resurrecting my C3000.
Date: Thu, 23 Dec 2010 19:58:33 +0100
Message-ID: <AANLkTikrtfn22+NU750hk_iFcysfuodXtShkzG_1owK6@mail.gmail.com>
References: <AANLkTimOpLijMDTttD-MD9uKfGFz6KrnCmae71-S=Deq@mail.gmail.com> <20101223184400.384304E75@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "Carlos O'Donell" <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101223184400.384304E75@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Dec 23, 2010 at 7:43 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> The C3K is a single board system, the RS-232 connectors on the back
>> are mounted and routed directly to the motherboard (like a common PC=
).
>>
>> If I remove the disks, CDROM, floppy, and memory from the system, it
>> still powers up and displays the same error.
>>
>> I was surprised it booted without any ram in the slots, but it's a
>> robust design :-)
>
> Can you switch to graphics console? =C2=A0Otherwise, it looks like yo=
u need
> a new system board...

graphics console without SuckyIO means no USB, ergo, no input... It
sure can be fixed, but is it worth it? :)

HTH
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
