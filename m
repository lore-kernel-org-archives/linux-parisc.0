From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Stop CPUs via PAT firmware before system halt or
 reboot.
Date: Tue, 16 May 2017 21:22:30 +0200
Message-ID: <cdeeccf5-653f-2b99-5370-707b2862e46a@gmx.de>
References: <20170512165513.GA23551@ls3530.fritz.box>
 <267CAD7B-3DB7-457E-8A82-2CFB2FF07587@bell.net>
 <eb437932-ad37-b6d4-0035-edcf76538424@gmx.de>
 <926005BA-0712-4D52-8995-E9FEDB5F890E@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <926005BA-0712-4D52-8995-E9FEDB5F890E@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 16.05.2017 02:29, John David Anglin wrote:
> On 2017-05-15, at 3:39 AM, Helge Deller wrote:
> 
>> Anyway, I did included an updated patch [1] in my last git pull request to Linus (which actually
>> didn't made it into 4.12...).
>> Can you test this one instead?
> 
> I still see same behavior.
> (After the system prints the message that it is okay to power off, 
> the front panel LED shows a flashing red, and pressing the power 
> button once doesn't power the system down. Pressing it again 
> causes the system to reboot.

I'll probably drop the patch then.
I didn't noticed that myself because I turn off/on the machine
via a remote power plug (via USB connected to a x86).

Helge
