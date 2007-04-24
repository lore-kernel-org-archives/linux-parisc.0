From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] do_page_fault
Date: Tue, 24 Apr 2007 09:16:37 -0400
Message-ID: <20070424131637.GE306__33134.6485451379$1416624342$gmane$org@fattire.cabal.ca>
References: <5b2e36650704240241r58da9af2x5b602b2efa0e43ba@mail.gmail.com>
	<20070424125035.GA306@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Jeff Bailey <jbailey@raspberryginger.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070424125035.GA306@fattire.cabal.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Apr 24, 2007 at 08:50:35AM -0400, Kyle McMartin wrote:
> > do_page_fault() pid=21916 command='gij-4.1.bin' type=15 address=0x00000004
> > 
> 

'type' here is analogous to 'code' in arch/parisc/kernel/traps.c and
can be decoded using the switch of doom in traps.c

cheers,
	kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
