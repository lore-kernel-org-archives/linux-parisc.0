Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viemta06.chello.at (viemta06.chello.at [195.34.133.56])
	by dsl2.external.hp.com (Postfix) with ESMTP id 56430482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Apr 2001 17:12:23 -0600 (MDT)
Sender: chris@dsl2.external.hp.com
Message-ID: <3AC90756.67939658@dot.at>
Date: Tue, 03 Apr 2001 01:12:22 +0200
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] New Kernel & SCSI problem on 720
References: <3AC8FEBC.1B7F8188@dot.at> <20010402234309.D9198@linuxcare.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Perfect. After CVS update (now), the kernel SCSI problem is fixed.
But the other problem with the "Breakpoint 0" in `init' (pid=9 ?,
pid is normally 1, but the things comparable with "kernel threads"
have low numbers and are contolled by init ....) is still there,
but has nothing to do with SCSI.

Thanks, good work

	Christoph P.


Richard Hirst wrote:
> 
> On Tue, Apr 03, 2001 at 12:35:40AM +0200, Christoph Plattner wrote:
> > Hi PARISC/Linux hackers !
> >
> > Now I built up a new C-x-tool-chain and a new kernel, and *now*
> > I have problems with SCSI on the 720. I had not before a kernel
> 
> Just fixed the scsi problem about 10 minutes ago, commiting now.
> 
> Richard
> 
> If you can't wait:
> 
> RCS file: /home/cvs/parisc/linux/drivers/scsi/sim700.c,v
> retrieving revision 1.25
> diff -u -r1.25 sim700.c
> --- sim700.c    2001/03/20 07:04:51     1.25
> +++ sim700.c    2001/04/02 22:36:25
> @@ -1254,7 +1254,7 @@
>             resume_offset = Ent_reselect;
>         }
>         else if (hostdata->chip == 700 && (dstat & DSTAT_ABRT)) {
> -           u32 offset = (dsp - low32(targdata->ba->script)/4);
> +           u32 offset = (dsp - low32(targdata->ba->script))/4;
>             if (offset == Ent_reselect/4 + 4) {
>                 DEB(DEB_DISC, printk("scsi%d: wait reselect aborted\n", host->host_no));
>                 resume_offset = Ent_patch_selection;

-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
