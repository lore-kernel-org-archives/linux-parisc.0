Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id F3922482A
	for <parisc-linux@parisc-linux.org>; Thu, 18 Oct 2001 16:28:55 -0600 (MDT)
Message-Id: <200110182225.QAA03204@puffin.external.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] More on the B2000 
In-Reply-To: Message from Richard Hirst <rhirst@linuxcare.com>
   of "Thu, 18 Oct 2001 19:35:35 BST." <20011018193535.T11105@linuxcare.com>
Date: Thu, 18 Oct 2001 16:25:31 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst wrote:
> On Thu, Oct 18, 2001 at 11:32:30AM -0600, Grant Grundler wrote:
> > I'm helping get IDE-CDOM working and I have also started work on
> > getting the built-in narrow scsi working (sym53c8xx driver needs
> > to make a PDC GET_INITIATOR call).
> 
> The narrow scsi works provided you boot with "sym53c8xx=buschk:2" as
> per the CD errata though, doesn't it?

I haven't tried that. I will.

I tried forcing the sym53c8xx to use narrow only and that
hangs the box. The internal LVD disk insist on
re-negotiating for wide and never get past that.

grant
