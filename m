From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: HPPA hang with PCI SERR or PARITY enabling
Date: Tue, 11 Aug 2009 11:27:42 +0200
Message-ID: <7d01f9f00908110227m213cc695w7f3113098819cff1@mail.gmail.com>
References: <20090805174507.GB11458@lackof.org>
	 <20090806141542.bf48febf.berndg@fsim-ev.de>
	 <20090807162242.GA18373@lackof.org>
	 <20090808113100.37e0f4ab.berndg@fsim-ev.de>
	 <20090809052714.GA22362@lackof.org> <4A7F7652.6050209@tausq.org>
	 <7d01f9f00908100101w3d73e91fmce80eb79e85bdc61@mail.gmail.com>
	 <7d01f9f00908100109y6265c3efs31a6a2c46679ae90@mail.gmail.com>
	 <20090810130827.98dfd895.berndg@fsim-ev.de>
	 <20090810232036.GA20454@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Bernd Gietzelt <berndg@fsim-ev.de>,
	Randolph Chung <randolph@tausq.org>,
	linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090810232036.GA20454@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Aug 11, 2009 at 1:20 AM, Grant
Grundler<grundler@parisc-linux.org> wrote:
> On Mon, Aug 10, 2009 at 01:08:27PM +0200, Bernd Gietzelt wrote:
>> On Mon, 10 Aug 2009 10:09:36 +0200
>> Thibaut VARENE <T-Bone@parisc-linux.org> wrote:
>>
>> > Bummer, I've been reading the logs a bit too quickly. It seems we have
>> > two different problems here:
>> >
>> > 2.6.30-1-64smp doesn't boot (apparently doesn't load init, hangs after
>> > the badness in smp.c message)
>> > 2.6.30-1-64up crashes while loading PCI drivers
>> >
>> > A log of the up kernel with pdcchassis=0 would thus be helpful.
>>
>> http://pastebin.com/m2a494b9b
>>
>> I couldn't see any difference to the log without pdcchassis=0.
>
> Yeah, wierd....I must be misremembering then.

No you're not and yes there are differences: without pdcchassis=0 you
have the "system initialization" GSP messages throughout the boot log.
The final message from the GSP is, as I pointed out, unrelated to the
pdcchassis driver, it's triggered directly by hardware.

HTH

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
