From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] binutils 32/64 bit question
Date: Tue, 4 Jan 2005 16:03:03 -0500
Message-ID: <20050104210302.GC14572@baldric.uwo.ca>
References: <200412302240.20913.vapier@gentoo.org>
	<200412310404.iBV44G45000401@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200412310404.iBV44G45000401@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Dec 30, 2004 at 11:04:15PM -0500, John David Anglin wrote:
> > has anyone toyed around with having the default hppa binutils support both 
> > 32bit and 64bit code ?
> 
> The main problem is that ld is different.  It would take some work
> to merge them.  The 64-bit ld uses .opd's and the 32-bit ld doesn't.
> There are advantages to using .opd's (e.g., function descriptors
> are unique).  We've talked about this but no significant progress
> has been made.

Progress on:

a. Adding OPD's to the 32-bit code?

b. Add multiarch binutils support for both 32/64 bit? 

:)

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
