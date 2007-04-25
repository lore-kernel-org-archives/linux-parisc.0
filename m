From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] do_page_fault
Date: Tue, 24 Apr 2007 22:39:36 -0400
Message-ID: <20070425023936.GA7219__32170.9423129962$1416624343$gmane$org@fattire.cabal.ca>
References: <5b2e36650704240241r58da9af2x5b602b2efa0e43ba@mail.gmail.com>
	<20070424125035.GA306@fattire.cabal.ca>
	<20070424131637.GE306@fattire.cabal.ca>
	<119aab440704241935g4e471711ub32e8954625993e7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440704241935g4e471711ub32e8954625993e7@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Apr 24, 2007 at 10:35:12PM -0400, Carlos O'Donell wrote:
> On 4/24/07, Kyle McMartin <kyle@mcmartin.ca> wrote:
> >On Tue, Apr 24, 2007 at 08:50:35AM -0400, Kyle McMartin wrote:
> >> > do_page_fault() pid=21916 command='gij-4.1.bin' type=15 
> >address=0x00000004
> >
> >'type' here is analogous to 'code' in arch/parisc/kernel/traps.c and
> >can be decoded using the switch of doom in traps.c
> 
> ... or the manual of doom "PA-RISC 2.0 ARCHITECTURE" section 5-1
> Interrupt Classes, Group 1-4, interrupts 1-25?
> 

Sure. I just find grep '<code>:' arch/parisc/kernel/traps.c easier than
navigating a pdf.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
