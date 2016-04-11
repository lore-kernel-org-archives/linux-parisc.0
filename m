From: Rolf Eike Beer <eike@sf-mail.de>
Subject: Re: [PATCH] parisc: Simplify and speed up get_user() and put_user()
Date: Mon, 11 Apr 2016 09:38:16 +0200
Message-ID: <52a10551454689c5c3af48f7bea788ce@sf-mail.de>
References: <20160409062614.GA4203@ls3530.box>
 <4798044.iQpCdZPV03@caliban.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4798044.iQpCdZPV03@caliban.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Am 2016-04-11 08:16, schrieb Rolf Eike Beer:
> Am Samstag, 9. April 2016, 08:26:14 schrieb Helge Deller:
>> This patch simplifies the code for get_user() and put_user() a lot.
>> 
>> Instead of accessing kernel memory (%sr0) and userspace memory (%sr3)
>> hard-coded in the assembler instruction, we now preload %sr2 with 
>> either
>> %sr0 (for accessing KERNEL_DS) or with sr3 (to access USER_DS) and
>> use %sr2 in the load directly.
>> 
>> The generated code avoids a branch and speeds up execution by 
>> generating
>> less assembler instructions.
> 
> I have put this on my C3600 (Linux 4.5.0, 32 bit kernel) and I see no 
> negative
> effects.

It's not 4.5.0, it's 4.4.6.

Eike
