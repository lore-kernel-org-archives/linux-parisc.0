Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 11 Apr 2003 09:58:50 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] parisc-linux.org kernel
Message-ID: <20030411155850.GA2795@dsl2.external.hp.com>
References: <20030410155223.GA5254@dsl2.external.hp.com> <3E8AE87E0000567E@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E8AE87E0000567E@ocpmta2.freegates.net>
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

On Fri, Apr 11, 2003 at 07:40:32AM +0200, Joel Soete wrote:
> Here is the rough diffstat (still have to reverse ql driver patches, I will
> try to find time this week-end :) )

cool - let me add some general comments.
You might break the diff up into chunks along the lines that
I've commented on them below. You should end up with something like
15-20 patches.

>  Documentation/Configure.help                      |   90 
	I expect parisc-specific changes here.

>  Makefile                                          |   16 
	Don't submit the Makefile unless you are sure we need it.

>  arch/m68k/config.in                               |    5 
...
	Don't submit m68k - Marcello should be ahead here.

>  arch/parisc/config.in                             |    6 
...
	parisc specific (our tree is authoritative)
	Need to review for changes in Marcelo's tree.
	I expect Marcello to take the mess as-is if there
	are no conflicts.

>  drivers/char/Config.in                            |    3 
>  drivers/char/Makefile                             |    2 
>  drivers/char/pty.c                                |    4 
>  drivers/char/serial.c                             |  115 
	Diva Support? If so, that's common to parisc/ia64.

>  drivers/gsc/dino.c                                |    9 
	parisc specific.

>  drivers/ide/pci/ns87415.c                         |    8 
>  drivers/ide/setup-pci.c                           |    2 
	Suckyio support. This probably needs to go to Andre Hedrick.

>  drivers/net/acenic.c                              |    5 
	Jes Sorensen has all my changes for this driver.
	Jes, can you compare Marcello's tree with ours?
	(and please make sure Marcello gets the latest?)

>  drivers/net/lasi_82596.c                          |    2 
	parisc specific

>  drivers/net/pcnet32.c                             |   26 
	Dunno.

>  drivers/net/tulip/eeprom.c                        |    3 
>  drivers/net/tulip/media.c                         |   29 
	Jeff Garzik has blessed changes I've made here.
	I expect this to be about the PHY reset and media table changes
	for card-mode Dino (rbrad's changes).

>  drivers/net/wireless/airo.c                       |    7 
	Fixes from Lamont. He's not the maintainer but the card should
	now work under parisc-linux. He's got one running in a B180.

>  drivers/pci/quirks.c                              |    3 
	upstream changes.

>  drivers/pci/setup-bus.c                           |   37 
	I expect this is the bridge_ctl field I added using
	Russell King's patch (arm/pci maintainer). This probably
	can NOT go in as-is. If the bulk of the other changes
	go in, I'll deal with this.

>  drivers/scsi/Config.in                            |   57 
>  drivers/scsi/Makefile                             |   15 
	Added qla2xxx

>  drivers/scsi/cpqfcTScontrol.c                     |   45 
>  drivers/scsi/cpqfcTSi2c.c                         |    3 
>  drivers/scsi/cpqfcTSinit.c                        |   12 
>  drivers/scsi/cpqfcTSstructs.h                     |    4 
>  drivers/scsi/cpqfcTSworker.c                      |    2 
	These are my cleanups so one can load/unload the module 
	without crashing the system. TL chips (5100/5166) should
	work but HP XL2 HBAs do not - need more work to read the serial
	PROM and pull the GBIC info/WWW id out.  I haven't tested
	this on ia64, only parisc.

	This is an orphan'd driver.  I talked to the current maintainers
	and they just don't have time to work on it. This is the same
	group that supports cciss driver (SmartArray cards).
	I've submitted these changes about 2 months ago. 

	See http://sourceforge.net/projects/cpqfc.

>  drivers/scsi/ncr53c8xx.c                          |  341 +
	rhirst changes for zalon support?

>  drivers/scsi/qla2xxx/Config.in                    |    6 
>  drivers/scsi/qla2xxx/Makefile                     |   13 
...
	"New" driver. This is the released qla2xxx v6.0.4 from Qlogic.
	Works on ia64 (weekend of hazard testing) but not quite on parisc.
	At least it doesn't crash parisc. I have a card installed in
	an a500 if someone has time to poke at this some more.

>  drivers/scsi/sym53c8xx.c                          |   44 
>  drivers/scsi/sym53c8xx_2/sym_glue.c               |   14 
>  drivers/scsi/sym53c8xx_2/sym_hipd.c               |   35 
>  drivers/scsi/sym53c8xx_defs.h                     |   83 
	All of these sym53c8xx changes have been blessed by Gerard Roudier.
	He's the maintainer. Please submit.

>  drivers/sound/ad1889.c                            |    2 
	parisc specific.

>  drivers/video/Config.in                           |   14 
>  drivers/video/dummycon.c                          |   10 
>  drivers/video/sstfb.c                             |  114 
	parisc specific.

>  fs/Makefile                                       |    1 
>  fs/binfmt_elf.c                                   |  288 -
>  fs/exec.c                                         |   97 
>  fs/open.c                                         |   22 
>  fs/read_write.c                                   |   40 
>  include/asm-generic/xor.h                         |  378 +
>  include/asm-m68k/machdep.h                        |    4 
>  include/asm-m68k/rtc.h                            |   50 
	I expect these are upstream changes

>  include/asm-parisc/checksum.h                     |   26 
...
	parisc specific.
	(logo was updated among other things)

>  include/linux/binfmts.h                           |    2 
...
	Need to review if the remaining diff are upstream or our changes.
	I suspect most are upstream.

> (hmm don't remember if linux_logo is of mine dpkg install or a new one in
> our tree :)

new one in our tree.

hth - thanks!
grant
