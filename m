From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] bitops.h: fls(unsigned long )
Date: Tue, 24 Aug 2004 12:45:42 -0400
Message-ID: <20040824164542.GR5207@baldric.uwo.ca>
References: <412A3C74.9000903@tiscali.be>
	<412135A8000049BB@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <412135A8000049BB@ocpmta3.freegates.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Aug 24, 2004 at 02:51:59PM +0200, Joel Soete wrote:
> Hi all,
> 
> Sorry for this auto-reply but I just reboot with success my N4k (smp 64bit
> kernel 2.6.8.1-pa7) with this patch and all works fine :)
> 
> If Ok for everybody can somebody ci for me (no cvs access :) )?

Do you have a 32-bit test program that shows this code works?

I'm one for writing a small test to verify that the code is doing what
the specification says it should.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
