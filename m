From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Stop CPUs via PAT firmware before system halt or
 reboot.
Date: Mon, 15 May 2017 09:39:11 +0200
Message-ID: <eb437932-ad37-b6d4-0035-edcf76538424@gmx.de>
References: <20170512165513.GA23551@ls3530.fritz.box>
 <267CAD7B-3DB7-457E-8A82-2CFB2FF07587@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <267CAD7B-3DB7-457E-8A82-2CFB2FF07587@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 15.05.2017 02:42, John David Anglin wrote:
> On 2017-05-12, at 12:55 PM, Helge Deller wrote:
> 
>> Dave reported that he had issued a "shutdown -r" and a panic occurred during
>> the reboot while all CPUs were still up. After this, stall messages were output
>> to console after the firmware version was printed.
>>
>> To avoid that issue, add functions to call PAT firmware to stop all CPUs (with
>> the exception of the currently running CPU) before a panic reboot or a system
>> halt is issued.
> 
> This patch causes a problem with "shutdown -h" on my c8000.  After the system prints
> the message that it is okay to power off, the front panel LED shows a flashing red, and pressing
> the power button once doesn't power the system down.  Pressing it again causes the system
> to reboot.

I noticed that during my testing as well.
It seems that the firmware call stops the whole socket, not just one CPU.
Maybe it's another problem as well?

Anyway, I did included an updated patch [1] in my last git pull request to Linus (which actually
didn't made it into 4.12...).
Can you test this one instead?

Helge


[1] https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/commit/?h=parisc-4.12-1&id=5aa2aabff1ce642a0c16b8c25bce8dc5ad66ad81
