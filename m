Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from jaguar.mkp.net (jaguar.mkp.net [66.11.169.42])
	by dsl2.external.hp.com (Postfix) with ESMTP id C0EC34829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 24 Jun 2003 11:34:49 -0600 (MDT)
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Need Replacement was: Matrox graphics card and C360
From: "Martin K. Petersen" <mkp@mkp.net>
References: <Pine.LNX.4.44.0306241727370.26179-100000@sal.ucc.ie>
Date: 24 Jun 2003 13:34:40 -0400
In-Reply-To: <Pine.LNX.4.44.0306241727370.26179-100000@sal.ucc.ie>
Message-ID: <yq1adc7pefj.fsf@wilson.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

>>>>> "M" == M Grabert <xam@cs.ucc.ie> writes:

M> BTW, I have some hardware problems with my C240 lately. When it is
M> cut of from power (i.e. when there is a power outage or I pull the
M> power plug), I can turn it on again! I have to wait for some hours
M> until and suddenly the power button works again. This started to
M> happen a couple of months ago. I hardly turn the machine of, so I
M> don't care that much, but it's annoying nevertheless!  Even more
M> strangely the SCSI bay doesn't get any power anymore, so I have to
M> use an external SCSI disk. This happened about a month ago after I
M> wanted to install a new SCSI drive. I suppose a fuse or two are
M> broken ...  The power botton works, but none of the LEDs!

I've experienced similar things in the past.  One of my C160s is a
notoriously bad booter.

The trick is to make sure that both the disk tray and the motherboard
tray are properly seated and screws tightened.

I tend to put my Cxxx boxes down on the floor - face side down - and
let the motherboard tray fall down the last couple of inches.  That
usually seats things nicely.

Also, make sure your disk tray screw is properly inserted.  The
power/LED assy. as well as disk device power and SCSI data pins are
all hooked up through a single connector at the back of the disk tray.

Give that box a big, tight hug.  That usually fixes it *).

*) Make sure nobody can see you when you are doing this.  More than
 once I have been accused of humping my PA-RISC hardware while
 performing this delicate repair procedure.

-- 
Martin K. Petersen      http://mkp.net/
