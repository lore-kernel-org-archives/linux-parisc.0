From: rubisher <rubisher@scarlet.be>
Subject: How to grab begining/end functions' address? [Wa: 'Trace patches
 test' ]
Date: Sun, 17 Feb 2008 10:52:28 +0000
Message-ID: <47B811EC.3080707@scarlet.be>
References: <JV1SEX$ACF9E213A9B966069761EDBBFFD7BB89@scarlet.be> <20080123071343.GD20348@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080123071343.GD20348@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Grant Grundler wrote:
> On Tue, Jan 22, 2008 at 02:35:21PM +0100, rubisher wrote:
>> Btw, a while back, I dream to use relayfs to grab debug info.
>> (<http://lists.parisc-linux.org/pipermail/parisc-linux/2006-April/053237.html>)
>>
>> Somebody else write it:
>> <http://lkml.org/lkml/2007/11/13/208>
>>
>> Obviously, I have to instrument things manually but I test it succesfully.
>> Here is already some primarily data test:
>> [snip]
>> :1201001199222127606:ccio_map_single_1:ccio_map_single() 0x1eb91896 ->
>> 0x63b4896 size: 0x1000
>> :1201001199222203288:ccio_map_single_2: pdir 1fcb1da0 038100000eb91017
>> :1201001199222391065:ccio_map_single_1:ccio_map_single() 0x1febc096 ->
>> 0x63b5096 size: 0x1000
> ...
>> Exciting results?
> 
> Yes! Nice!
> 
>> (just what would give me DEBUG_RUN() printk() but without
>>  degrading system performance)
> 
> I don't believe that. :)
> Measure the CPU utilization and/or compare pktgen performance with
> and without the tracing compiled into the kernel.
> 
> However, that doesn't mean this is useless. This is alot better than
> rolling our own "light weight" tracing mechanism and it's certainly
> alot better than using printk's to debug DMA issues (as long as
> the system doesn't crash - e.g. HPMC).
> 
> hth,
> grant
> 
>> I still have to had some more DEBUG_RUN_SG() stuff and hope to be able to
>> collect more.
>>
Hello Grant,

Has far as the gcc builtin instrument-functions doesn't work as I expected, I would like to grab manually the address of the 
functions' begin and end like something:
void foo(){
foo_start:
	printk ("%s() start at %p.\n, __FUNCTION__, ???ADDRESS_OF???(foo_start);
[snip]
foo_end:
	printk ("%s() start at %p.\n, __FUNCTION__, ???ADDRESS_OF???(foo_end);
};

It seems to me that I read it something like this in the past but no means to remember how to do it.
Can you help me to refresh my mind?

Tia,
	r.
