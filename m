From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] PA8800/ZX1 support committed to 2.6.7-rc2-pa2
Date: Fri, 11 Jun 2004 09:03:55 -0600
Message-ID: <20040611150355.GB10279@colo.lackof.org>
References: <20040604202546.GC18574@colo.lackof.org>
	<20040605065126.GA28343@colo.lackof.org>
	<1086444652.1999.20.camel@mulgrave>
	<20040605210515.GA8098@colo.lackof.org>
	<1086470366.1999.36.camel@mulgrave>
	<20040611055819.GA32005@colo.lackof.org>
	<1086962549.1949.23.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1086962549.1949.23.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jun 11, 2004 at 10:02:29AM -0400, James Bottomley wrote:
> > Changing "4 + cnf.cc_shift" (stride=128) to "3 + cnf.cc_shift"
> > (stride=64) didn't help. This implies the stride is not the problem.
> 
> The stride in the rest of the PA architecture is either 16 or 32; I'd be
> surprised if the L1 stride in the 8800 were bigger (smaller stride is
> actually more efficient since it gives finer control over caching).

I always thought the stride was the smallest cacheline size.

> Could you just hard code it to 32 to make assureances certain that the
> stride value isn't the source of the segv's?

It didn't help. sshd is still not working.
I'll try 16 as well.

pa8800:~# dmesg | fgrep sshd                                                    
do_page_fault() pid=457 command='sshd' type=15 address=0x80fc43ac               
do_page_fault() pid=461 command='sshd' type=6 address=0x00000003                
sshd(463): unaligned access to 0x00000000faf0105b at ip=0x00000000406e536b      
sshd(463): unaligned access to 0x00000000faf0107b at ip=0x00000000406e537f      
do_page_fault() pid=463 command='sshd' type=15 address=0x00000002               
do_page_fault() pid=465 command='sshd' type=15 address=0x0000000c               
do_page_fault() pid=469 command='sshd' type=15 address=0x0000000c               
sshd (pid 471): Illegal instruction (code 8) at 0000000000074b7b                


But I have to wonder why do RC scripts work?
And why can I login on the console?
I thought all of those things would fork/exec other binaries as well.
Given everything is coming over NFS root, I can't blame IO either.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
