Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0AA124829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 12 Apr 2003 14:19:43 -0600 (MDT)
Message-ID: <3E987756.3000900@tiscali.be>
Date: Sat, 12 Apr 2003 20:30:14 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] parisc-linux.org kernel
References: <20030410155223.GA5254@dsl2.external.hp.com> <3E8AE87E0000567E@ocpmta2.freegates.net> <20030411155850.GA2795@dsl2.external.hp.com>
In-Reply-To: <20030411155850.GA2795@dsl2.external.hp.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Grant Grundler wrote:

>On Fri, Apr 11, 2003 at 07:40:32AM +0200, Joel Soete wrote:
>  
>
>>Here is the rough diffstat (still have to reverse ql driver patches, I will
>>try to find time this week-end :) )
>>    
>>
>
>cool - let me add some general comments.
>You might break the diff up into chunks along the lines that
>I've commented on them below. You should end up with something like
>15-20 patches.
>
>  
>
>> Documentation/Configure.help                      |   90 
>>    
>>
>	I expect parisc-specific changes here.
>
>  
>
1) CONFIG_HP_SDC (parisc specific)
2) Serial MUX and PDC support (parisc specific)
3) Generic Real Time Clock Support ?
4) CONFIG_IOMMU_CCIO (parisc specific)

>> Makefile                                          |   16 
>>    
>>
>	Don't submit the Makefile unless you are sure we need it.
>
>  
>
>> arch/m68k/config.in                               |    5 
>>    
>>
>...
>	Don't submit m68k - Marcello should be ahead here.
>  
>
Clearly

>  
>
>> arch/parisc/config.in                             |    6 
>>    
>>
>...
>	parisc specific (our tree is authoritative)
>	Need to review for changes in Marcelo's tree.
>	I expect Marcello to take the mess as-is if there
>	are no conflicts.
>
>  
>
>> drivers/char/Config.in                            |    3 
>>
>> drivers/char/Makefile                             |    2 
>>
+if [ "$CONFIG_PARISC" = "y" ]; then
+   bool 'Generic RTC device support' CONFIG_GENRTC
+fi

>> drivers/char/pty.c                                |    4 
>>
gcc-3.2 barier workaround

>> drivers/char/serial.c                             |  115 
>>    
>>
>	Diva Support? If so, that's common to parisc/ia64.
>
yes (for this last)

>
>  
>
>> drivers/gsc/dino.c                                |    9 
>>    
>>
>	parisc specific.
>
>  
>
>> drivers/ide/pci/ns87415.c                         |    8 
>> drivers/ide/setup-pci.c                           |    2 
>>    
>>
>	Suckyio support. This probably needs to go to Andre Hedrick.
>
>  
>
>> drivers/net/acenic.c                              |    5 
>>    
>>
>	Jes Sorensen has all my changes for this driver.
>	Jes, can you compare Marcello's tree with ours?
>	(and please make sure Marcello gets the latest?)
>
>  
>
>> drivers/net/lasi_82596.c                          |    2 
>>    
>>
>	parisc specific
>
>  
>
>> drivers/net/pcnet32.c                             |   26 
>>    
>>
>	Dunno.
>  
>
* v1.27c Sat Apr 13 2002 Helge Deller <deller@gmx.de>
* typo-fixes & cleanups

>> drivers/net/tulip/eeprom.c                        |    3 
>>
?? should be wrong merge (have to test on a b180 and examine compile 
logs :(( )

>> drivers/net/tulip/media.c                         |   29 
>>    
>>
>	Jeff Garzik has blessed changes I've made here.
>	I expect this to be about the PHY reset and media table changes
>	for card-mode Dino (rbrad's changes).
>
Yes (for this last)

>
>  
>
>> drivers/net/wireless/airo.c                       |    7 
>>    
>>
>	Fixes from Lamont. He's not the maintainer but the card should
>	now work under parisc-linux. He's got one running in a B180.
>
>  
>
>> drivers/pci/quirks.c                              |    3 
>>    
>>
>	upstream changes.
>
>  
>
>> drivers/pci/setup-bus.c                           |   37 
>>    
>>
>	I expect this is the bridge_ctl field I added using
>	Russell King's patch (arm/pci maintainer). This probably
>	can NOT go in as-is. If the bulk of the other changes
>	go in, I'll deal with this.
>
>  
>
>> drivers/scsi/Config.in                            |   57 
>> drivers/scsi/Makefile                             |   15 
>>    
>>
>	Added qla2xxx
>
>  
>
>> drivers/scsi/cpqfcTScontrol.c                     |   45 
>> drivers/scsi/cpqfcTSi2c.c                         |    3 
>> drivers/scsi/cpqfcTSinit.c                        |   12 
>> drivers/scsi/cpqfcTSstructs.h                     |    4 
>> drivers/scsi/cpqfcTSworker.c                      |    2 
>>    
>>
>	These are my cleanups so one can load/unload the module 
>	without crashing the system. TL chips (5100/5166) should
>	work but HP XL2 HBAs do not - need more work to read the serial
>	PROM and pull the GBIC info/WWW id out.  I haven't tested
>	this on ia64, only parisc.
>
>	This is an orphan'd driver.  I talked to the current maintainers
>	and they just don't have time to work on it.
>
Hmm I also just exchange a short mail with him and the idea was that it 
would be better to re-write completely this driver (without any doc and 
not yet enough knowledge on writing driver, I abandon the idea to work 
on, sorry)

> This is the same
>	group that supports cciss driver (SmartArray cards).
>	I've submitted these changes about 2 months ago. 
>
>	See http://sourceforge.net/projects/cpqfc.
>  
>
>> drivers/scsi/ncr53c8xx.c                          |  341 +
>>    
>>
>	rhirst changes for zalon support?
>
>  
>
>> drivers/scsi/qla2xxx/Config.in                    |    6 
>> drivers/scsi/qla2xxx/Makefile                     |   13 
>>    
>>
>...
>	"New" driver. This is the released qla2xxx v6.0.4 from Qlogic.
>	Works on ia64 (weekend of hazard testing) but not quite on parisc.
>	At least it doesn't crash parisc. I have a card installed in
>	an a500 if someone has time to poke at this some more.
>  
>
(is ql we used on some of our Sun could work also on parisc? if yes my 
pb would be to convince our _new_ HP engineer to put one in the N I 
spoke about elsewhre ;?)

>  
>
>> drivers/scsi/sym53c8xx.c                          |   44 
>> drivers/scsi/sym53c8xx_2/sym_glue.c               |   14 
>> drivers/scsi/sym53c8xx_2/sym_hipd.c               |   35 
>> drivers/scsi/sym53c8xx_defs.h                     |   83 
>>    
>>
>	All of these sym53c8xx changes have been blessed by Gerard Roudier.
>	He's the maintainer. Please submit.
>
>  
>
>> drivers/sound/ad1889.c                            |    2 
>>    
>>
>	parisc specific.
>
>  
>
>> drivers/video/Config.in                           |   14 
>> drivers/video/dummycon.c                          |   10 
>> drivers/video/sstfb.c                             |  114 
>>    
>>
>	parisc specific.
>
>  
>
>> fs/Makefile                                       |    1 
>> fs/binfmt_elf.c                                   |  288 -
>> fs/exec.c                                         |   97 
>> fs/open.c                                         |   22 
>> fs/read_write.c                                   |   40 
>> include/asm-generic/xor.h                         |  378 +
>> include/asm-m68k/machdep.h                        |    4 
>> include/asm-m68k/rtc.h                            |   50 
>>    
>>
>	I expect these are upstream changes
>
>  
>
>> include/asm-parisc/checksum.h                     |   26 
>>    
>>
>...
>	parisc specific.
>	(logo was updated among other things)
>
>  
>
>> include/linux/binfmts.h                           |    2 
>>    
>>
>...
>	Need to review if the remaining diff are upstream or our changes.
>	I suspect most are upstream.
>
>  
>
>>(hmm don't remember if linux_logo is of mine dpkg install or a new one in
>>our tree :)
>>    
>>
>
>new one in our tree.
>
>hth - thanks!
>grant
>
>  
>
Ok I will examine deepely the rest.

I already had a ruby script which help me to 'split' a patch into 'per 
file' patch so I could easily re-merge some one together as all you mark 
me parisc specific, ...

I will  try to submit a first draft next week,
     Joel
