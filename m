Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 688B9482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Aug 2001 06:15:05 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 2E82DB00C; Tue, 28 Aug 2001 13:16:39 +0100 (BST)
Date: Tue, 28 Aug 2001 13:16:39 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: jacobsbd <jacobsbd@jacobs.coxatwork.com>
Cc: parisc-linux@lists.parisc-linux.org, jacobsbd@aol.com
Subject: Re: [parisc-linux] PA-RISC linux newby needs help doing an install
Message-ID: <20010828131638.P7064@linuxcare.com>
References: <000001c12bda$3a018e90$701e10ac@winxp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000001c12bda$3a018e90$701e10ac@winxp>; from jacobsbd@jacobs.coxatwork.com on Thu, Aug 23, 2001 at 05:15:34AM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Aug 23, 2001 at 05:15:34AM -0700, jacobsbd wrote:
> OK, I am sure I am overlooking some obvious things here, but it looks like I am stuck to the point of needing help so here goes.
> 
> I downloaded the iso and burned it with Nero on a win2k machine (the only burner I have easy access to)
> 
> my configurtion is hp 735/125 workstation,  209 meg ram,  
> on narrow SCSI chain I have  2 gig ST32550N (currently HP-UX), NEC 6x external CD-ROM drive. 4mm dds1 tape drive.
> on fast wide HVD 4gig ST15150W 
> 
> I can not seem to get the serial ports to work on this system even when I run HP_UX 11.00. I have tried unplugging the keyboard and the video card to no effect.

Internal FWD scsi on 735 is known not to work, but that shouldn't stop
you installing to the external narrow scsi.  Most likely the graphical
console is not supported yet, so your best bet is to persue trying to
get the serial ports working.

Richard
