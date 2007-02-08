From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Floppy disk support for 9000 series (715, 755,
	etc.) workstations.
Date: Thu, 8 Feb 2007 13:11:48 -0700
Message-ID: <20070208201148.GP13101__32070.1528959491$1416624274$gmane$org@parisc-linux.org>
References: <45B67554.6010208@scires.com>
	<20070124162810.GA31075@colo.lackof.org>
	<45CB5C9D.1070601@scires.com>
	<20070208173808.GL13101@parisc-linux.org>
	<45CB8357.2050703@scires.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "James K. Love" <jlove@scires.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <45CB8357.2050703@scires.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Feb 08, 2007 at 03:08:55PM -0500, James K. Love wrote:
> I haven't looked at the fdformat code either, but it aborts early due to the
> scsi floppy device having the wrong major number.  I don't think it even 
> gets to
> any ioctls.  BTW, the mtools functions all appear to work.

Oh ... I guess we just need to fix fdformat then.  Thanks.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
