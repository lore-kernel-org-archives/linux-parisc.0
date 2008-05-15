From: Helge Deller <deller@gmx.de>
Subject: Re: [PARISC][PATCH] fix trivial section name warnings
Date: Thu, 15 May 2008 22:20:34 +0200
Message-ID: <482C9B12.7050902@gmx.de>
References: <200805022202.48586.deller@gmx.de> <20080515145339.GL12850@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080515145339.GL12850@phobos.i.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Kyle,

Kyle McMartin wrote:
> On Fri, May 02, 2008 at 10:02:48PM +0200, Helge Deller wrote:
>> --- a/arch/parisc/kernel/perf_asm.S
>> +++ b/arch/parisc/kernel/perf_asm.S
>> @@ -41,7 +41,7 @@
>>  ; The coprocessor only needs to be enabled when
>>  ; starting/stopping the coprocessor with the pmenb/pmdis.
>>  ;
>> -	.text
>> +	__HEAD
>>  
> 
> You didn't build test this. :(

Of course I did build-tested and booted this patch.
Not sure in which problems you run (or what changed in the meantime...).

Helge
