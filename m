From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] 2.6.16-rc1 merge
Date: Tue, 17 Jan 2006 10:18:48 -0500
Message-ID: <20060117151848.GF4049@quicksilver.road.mcmartin.ca>
References: <20060117150625.GG19769@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060117150625.GG19769@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jan 17, 2006 at 08:06:25AM -0700, Matthew Wilcox wrote:
> The 2.6.16-rc1 merge was a bit complex, so please check any areas you
> feel responsible for to make sure I didn't mess you up.
> 
> arch/parisc/kernel/process.c
> 
> The merge seems to have undone some of viro's task_stack_page stuff.
> I don't think this was deliberate, needs checking.
>

Shit. Ok. I'll fix this.
 
> drivers/parisc/pdc_stable.c
> 
> I think I just took Thibaut's newest version for everything here.
>

Yes, that's right, I merged a not-quite-totally-fixed interim version
(fixed some sysfs error checking, but not much else, iirc).
 
> drivers/scsi/constants.c
> drivers/scsi/ncr53c8xx.c
> drivers/scsi/ncr53c8xx.h
> drivers/scsi/sym53c8xx_2/sym_glue.c
> drivers/scsi/sym53c8xx_2/sym_glue.h
> drivers/scsi/sym53c8xx_2/sym_hipd.c
> 
> I'll take care of these; they're all my fault.
> 

:)

> include/sound/opl3.h
> sound/drivers/opl3/opl3_lib.c
> sound/pci/Kconfig
> sound/pci/ad1889.c
> 
> Stuart, please look.  It was all very complicated, and I'm not convinced
> I haven't missed some cleanups necessary on error paths.
>

Can we just split out a diff of the OPL3 stuff and remove it from CVS until
it gets sorted? The ALSA folk seem to like to fuck around with our code
without informing us of it.
 
> kernel/compat.c
> 
> I kept our version of compat_sys_timer_create.  Someone please test the
> upstream version works.
> 

I can do this.

A couple things needed to go into cvs that I held off for, atomic64
for one, to avoid merge clashes because of Christoph Lameter's changes
in git.

Cheers,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
