From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: HPPA hang with PCI SERR or PARITY enabling
Date: Mon, 10 Aug 2009 13:18:51 +0200
Message-ID: <7d01f9f00908100418x20ef23d5p2e752e05e8246ce4@mail.gmail.com>
References: <20090615134519.6EE824FC5@hiauly1.hia.nrc.ca>
	 <Pine.SOC.4.64.0908052241550.4076@math.ut.ee>
	 <20090806141542.bf48febf.berndg@fsim-ev.de>
	 <20090807162242.GA18373@lackof.org>
	 <20090808113100.37e0f4ab.berndg@fsim-ev.de>
	 <20090809052714.GA22362@lackof.org> <4A7F7652.6050209@tausq.org>
	 <7d01f9f00908100101w3d73e91fmce80eb79e85bdc61@mail.gmail.com>
	 <7d01f9f00908100109y6265c3efs31a6a2c46679ae90@mail.gmail.com>
	 <20090810130827.98dfd895.berndg@fsim-ev.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Randolph Chung <randolph@tausq.org>,
	Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Bernd Gietzelt <berndg@fsim-ev.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090810130827.98dfd895.berndg@fsim-ev.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Aug 10, 2009 at 1:08 PM, Bernd Gietzelt<berndg@fsim-ev.de> wrote:
> On Mon, 10 Aug 2009 10:09:36 +0200
> Thibaut VARENE <T-Bone@parisc-linux.org> wrote:
>
>> Bummer, I've been reading the logs a bit too quickly. It seems we have
>> two different problems here:
>>
>> 2.6.30-1-64smp doesn't boot (apparently doesn't load init, hangs after
>> the badness in smp.c message)
>> 2.6.30-1-64up crashes while loading PCI drivers
>>
>> A log of the up kernel with pdcchassis=0 would thus be helpful.
>
> http://pastebin.com/m2a494b9b
>
> I couldn't see any difference to the log without pdcchassis=0.

The final output of GSP is probably due to a HPMC. Could you check in
GSP "CL" command (for Console Logs) that there is no more kernel
output after line 218 in your dump?

Thanks

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
