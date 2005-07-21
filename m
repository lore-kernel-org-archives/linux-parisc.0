From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Latest palinux crash
Date: Thu, 21 Jul 2005 00:36:27 -0400
Message-ID: <20050721043626.GY30182@systemhalted.org>
References: <20050720122227.GK10156@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050720122227.GK10156@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Jul 20, 2005 at 01:22:27PM +0100, Matthew Wilcox wrote:
> 
> This seems to be a bit different from most:
> 
> Bad Address (null pointer deref?): Code=15 regs=00000000ff8b88f0 (Addr=c000007f80000000)
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00001000000001001110001000001110 Not tainted
> r00-03  0000000000000000 ffffffffffff5000 00000000101728f4 0000000098c54000
> r04-07  00000000104b9200 00000000ff956900 00000000fff700e8 00000000ff956910
> r08-11  000000000000001a 00000000105435e8 000000000000001b 0000000000200200
> r12-15  0000000000100100 00000000ff956930 00000000000000f0 00000000000000ff
> r16-19  00000000f00003dc 00000000f000028c 00000000f0002aec 00000000003bd64c
> r20-23  ffffffff80000000 00000000eb78ed40 0000000012a06260 0000000000000000
> r24-27  000000000000b000 0000000000000002 0000000098c545c0 00000000104b9200
> r28-31  0000000000000002 00000000ff8b88c0 00000000ff8b88f0 0000000000000001
> sr0-3   0000000000046800 0000000000046800 0000000000000000 0000000000046800
> sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000
> 
> IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000101728d4 00000000101728d8
>  IIR: 0e9512c0    ISR: 000000003fffff80  IOR: c000007f80000000
>  CPU:        0   CR30: 00000000ff8b8000 CR31: 0000000010480000
>  ORIG_R28: 00000000104b9200
>  IAOQ[0]: free_block+0xac/0x1a0
>  IAOQ[1]: free_block+0xb0/0x1a0
>  RP(r2): free_block+0xcc/0x1a0
> Kernel panic: Bad Address (null pointer deref?)

Any context on the workload at the time?
/var/log/* around the time of the crash?

We need better tools for this... I wonder if we still have lkcd support
for hppa.

If we had lkcd support would you be willing to run a modified kernel on
parisc-linux?

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
