From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Re: CCIO dma io_command and related io_tlb format
	questions.
Date: Mon, 16 Oct 2006 09:37:15 -0500
Message-ID: <200610160937.15846.mszick@morethan.org>
References: <J788XR$E1A2FE043CF88207AEC13412E82258F2@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <J788XR$E1A2FE043CF88207AEC13412E82258F2@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon October 16 2006 06:51, Joel Soete wrote:
>
> ====<>====
> 
> May be could we also use some define like:
> #define Mb        (1 << 20)
> #define Gb        (1 << 30)
>

Joel,
Let me add a bit (no pun intended) from the 53c7xx manuals ...

The transfer offset register is 21 bits - -

So the largest single chunk of memory 7xx can transfer is 2^21
in a single command (single list entry, if passing it lists).

There was a mention somewhere of a special use for the high bit,
I do not recall the details at this moment.

So a limit on the contiguous block size of 2^20 should work.
Larger blocks would have to generate multiple list entries
by the time the code reaches the controller.

Another limit of the transfer hardware in the controller is
that it can not transfer a block which crosses 2^32 boundaries.
(The transfer base register is 32 bits.)

In those cases, you also have to split the block into above/below
2^32 and reprogram the chips interface (HP) hardware inbetween.

Some of the 53c8xx controllers handle 2^64 physical addressing,
but I have not studied those yet.

> Duno yet if it's realted to my pb but tia for your attention,
>     Joel 
Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
