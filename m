From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Fix syscall restarts
Date: Sun, 20 Dec 2015 20:48:22 +0100
Message-ID: <56770606.9020005@gmx.de>
References: <20151218233034.GA24910@p100.box>
 <B201D30D-8677-4D06-B3F9-EA4494972EF5@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <B201D30D-8677-4D06-B3F9-EA4494972EF5@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 20.12.2015 20:39, John David Anglin wrote:
> On 2015-12-18, at 6:30 PM, Helge Deller wrote:
> 
>> +	/* Usually we don't have to restore %r20 (the system call number)
>> +	 * because it gets loaded in the delay slot of the branch external
>> +	 * instruction via the ldi instruction.
>> +	 * In some cases a register-to-register copy instruction might have
>> +	 * been used instead, in which case we need to copy the syscall
>> +	 * number into the source register before returning to userspace.
>> +	 */
> 
> I'm thinking it might be better to fix syscall() in glibc.  The copy could be
> moved before ble and a nop placed delay slot.

Yes, I think it should be fixed in glibc which makes it cleaner.
I looked at dietlibc. There a "nop" is being used.

Nevertheless, it may happen anytime if people forget, that we will see a
"copy" there again, so IMHO it's probably safer to include the workaround in 
kernel too.

Helge
