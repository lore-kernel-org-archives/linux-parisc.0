Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id F042A482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Apr 2001 16:43:27 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 0F5C8B007; Mon,  2 Apr 2001 23:43:09 +0100 (BST)
Date: Mon, 2 Apr 2001 23:43:09 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Christoph Plattner <christoph.plattner@dot.at>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] New Kernel & SCSI problem on 720
Message-ID: <20010402234309.D9198@linuxcare.com>
References: <3AC8FEBC.1B7F8188@dot.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3AC8FEBC.1B7F8188@dot.at>; from christoph.plattner@dot.at on Tue, Apr 03, 2001 at 12:35:40AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Apr 03, 2001 at 12:35:40AM +0200, Christoph Plattner wrote:
> Hi PARISC/Linux hackers !
> 
> Now I built up a new C-x-tool-chain and a new kernel, and *now*
> I have problems with SCSI on the 720. I had not before a kernel

Just fixed the scsi problem about 10 minutes ago, commiting now.

Richard


If you can't wait:


RCS file: /home/cvs/parisc/linux/drivers/scsi/sim700.c,v
retrieving revision 1.25
diff -u -r1.25 sim700.c
--- sim700.c    2001/03/20 07:04:51     1.25
+++ sim700.c    2001/04/02 22:36:25
@@ -1254,7 +1254,7 @@
            resume_offset = Ent_reselect;
        }
        else if (hostdata->chip == 700 && (dstat & DSTAT_ABRT)) {
-           u32 offset = (dsp - low32(targdata->ba->script)/4);
+           u32 offset = (dsp - low32(targdata->ba->script))/4;
            if (offset == Ent_reselect/4 + 4) {
                DEB(DEB_DISC, printk("scsi%d: wait reselect aborted\n", host->host_no));
                resume_offset = Ent_patch_selection;
