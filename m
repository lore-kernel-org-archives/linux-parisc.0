From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] linux-2.6.10-pa1 panic on C360 in SCSI driver
Date: Sun, 26 Dec 2004 12:42:53 -0500
Message-ID: <20041226174253.GA7643@localhost.localdomain>
References: <200412260504.40205.vapier@gentoo.org>
	<20041226173709.GH11543@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041226173709.GH11543@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Dec 26, 2004 at 05:37:09PM +0000, Matthew Wilcox wrote:
> > Kernel Fault: Code=13 regs=10434640 (Addr=00000000)
> 
>  	 13  	 	 	 	 Conditional trap
> 
> >  IAOQ[0]: $$divU+0xc/0x210
> >  IAOQ[1]: $$divU+0x10/0x210
> 
> I guess we tried to divide by zero.
>

Interesting!

I've been seeing these while doing harmony work... That's pretty
confusing. Hmm.

Cheers,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
