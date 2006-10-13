From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] NICs on EISA bus...
Date: Fri, 13 Oct 2006 11:08:25 -0600
Message-ID: <20061013170825.GE11633@parisc-linux.org>
References: <452CFD68020000C500004FA3@mail.scires.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James.Bottomley@SteelEye.com,
 parisc-linux@lists.parisc-linux.org
To: James Love <jlove@scires.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <452CFD68020000C500004FA3@mail.scires.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Oct 11, 2006 at 02:19:20PM -0400, James Love wrote:
> This particular 715 appears to have a Scorpio EISA bus adapter.  I see
> no mention of WAX as a device in the boot logs (excerpt appended below).

The EISA bit of Wax and Mongoose are essentially the same.

>  Is the Scorpio a good or a bad thing in regards to getting this bus
> working?  I also have a 755 with a Cobra EISA BA, any idea whether that
> will work either?

That's also a Mongoose.

Interrupts probably work; I haven't tried them recently, but they should.
Port IO and Memory IO accesses to the chip from the CPU should work.
DMA from the chip to host RAM will not work.  I've read the chapter in
the ERS which describes how to make it work; unfortunately, I don't
remember it in enough detail, and don't have that document any more.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
