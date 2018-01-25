From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: Running the gdb 7.12.1 testsuite breaks kernel 4.13.8 on C8000
Date: Thu, 25 Jan 2018 16:36:54 +0100
Message-ID: <57873f7fe3e5227fcf2f4ed20407f2b6@sf-tec.de>
References: <11946948.1Lt8Nslq4k@devpool21> <5A69D52B.90405@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5A69D52B.90405@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
> On 2018-01-25 3:59 AM, Rolf Eike Beer wrote:
>> [  909.756303] Kernel panic - not syncing: Bad Address (null pointer 
>> deref?)
>> [  909.756303] ---[ end Kernel panic - not syncing: Bad Address (null 
>> pointer deref?)
>> 
>> This is actually the second place where it breaks, before that I had 
>> the same
>> with this test (twice):
> Would you post the PIM dump of the most recent HPMC in the service
> menu?

The service menu does not give any information, as in this older bug: 
https://bugs.gentoo.org/481768

> Also needed
> is the assembler dump of the routine where the HPMC occurred in your
> kernel.  You need the
> 64-bit version of objdump for this.

I have put the kernel on 
https://opensource.sf-tec.de/c8000-kernel.tar.xz

Eike
