Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sisko.scot.redhat.com (82-41-9-54.cable.ubr02.edin.blueyonder.co.uk [82.41.9.54])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2BEBA48A0
	for <parisc-linux@lists.parisc-linux.org>; Fri, 19 Sep 2003 10:34:20 -0600 (MDT)
Subject: Re: [Fwd: [parisc-linux] Problems with raw interface.]
From: "Stephen C. Tweedie" <sct@redhat.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	Ranjith Sudarsanan <ranjith_sudarsanan@hp.com>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Cc: Stephen Tweedie <sct@redhat.com>
In-Reply-To: <1063919293.16536.2.camel@dhcp23.swansea.linux.org.uk>
References: <1063919293.16536.2.camel@dhcp23.swansea.linux.org.uk>
Content-Type: text/plain
Message-Id: <1063989244.2834.48.camel@sisko.scot.redhat.com>
Mime-Version: 1.0
Date: 19 Sep 2003 17:34:04 +0100
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

Hi,

On Thu, 2003-09-18 at 22:08, Alan Cox wrote:
> Might interest you since this is possibly showing raw has cache
> coherency issues with HPPA (which is basically software coherency only)

> -----Forwarded Message-----
> > From: "SUDARSANAN,RANJITH (HP-India,ex2)" <ranjith_sudarsanan@hp.com>
> > To: parisc-linux@lists.parisc-linux.org
> > Subject: [parisc-linux] Problems with raw interface.
> > Date: Fri, 19 Sep 2003 00:36:55 +0530

> >         I am developing a scsi disk exerciser and I am blocked on a
> > strange problem with the raw interface. When I use the block device
> > /dev/sda directly I am able to read and write from the disk properly.
> > But when I use the raw interface I get garbage. For instance please
> > look at the output below. I am reading the 1st sector of the disk,
> > which is the boot sector, When I use the block device /dev/sda I get
> > my expected output, whereas when I use the raw interface I get
> > garbage. Can any one explain? The machine I am using is an L Class. 

Do you _ever_ get valid output, or is raw always failing?  There may
well be a cache coherency point being missed.

The key places are rw_raw_dev(), where we set up the virtual address to
physical page mappings, and brw_kiovec(), where the actual physical page
IO is done.

--Stephen
