From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Question about ccio and fdc request:
Date: Sun, 30 Oct 2005 08:25:48 -0700
Message-ID: <20051030152548.GC9235@parisc-linux.org>
References: <1130389617.31977.16.camel@localhost.localdomain>
	<20051027201333.GA3107@netfall.com>
	<1130543952.20233.10.camel@localhost.localdomain>
	<1130563229.20233.19.camel@localhost.localdomain>
	<4363E43D.5030208@tiscali.be>
	<20051029214456.GB6550@parisc-linux.org>
	<4363FBD4.9000003@tiscali.be>
	<20051030000253.GA11807@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051030000253.GA11807@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Oct 29, 2005 at 06:02:53PM -0600, Grant Grundler wrote:
> No. Older PDC (pre-Astro) probably doesn't implement that bit.
> Sorry, I don't have time to investigate exactly which ones do
> besides the Astro boxes and PAT PDC.
> 
> And even for SBA, I'd like to make this self modifying code
> that writes a NOP over the FDC in if it detects the system
> doesn't need FDC. That would get rid of another branch in
> a critical code path.

Is it possible this bit is set incorrectly on PA8800 boxes and that's
the cause of our cache problems?

(I doubt it, but wouldn't it be nice if that were the case ;-)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
