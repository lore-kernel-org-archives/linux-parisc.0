Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 25 Apr 2003 16:52:16 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Arjen Hommersom <arjenh@chello.nl>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sstfb crash
Message-ID: <20030425225216.GB11509@dsl2.external.hp.com>
References: <200304251408.39242.arjenh@chello.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200304251408.39242.arjenh@chello.nl>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, Apr 25, 2003 at 02:08:38PM +0200, Arjen Hommersom wrote:
> Kernel Fault: Code=15 regs=1ec64900 (Addr=eae3e729)

data page fault - trying to access an invalid address.
 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111111100001110
> r00-03  00000000 102ad810 101f5f68 1ebe5ab4
> r04-07  00000000 00000000 00000000 1ebe5800
> r08-11  ffffffff 1ec64810 6269745f 1ebaa000
> r12-15  1fdabcc0 1ec64550 000435a8 00042da8
> r16-19  00042da8 00042da8 000521c8 00450192
> r20-23  001f5dce 2bb0e9ab eae3e71d 745f6c6f
> r24-27  00000000 00000000 745f6c6f 10292010
> r28-31  0000000f f3000000 1ec64900 101f20d4
> sr0-3   00000000 0000034d 00000000 0000034d 
> sr4-7   00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IADQ: 10135394 10135398

"IAOQ" (not IADQ) points at the offending instruction.

grant
