From: "Michael S. Zick" <mszick@goquest.com>
Subject: Re: [parisc-linux] Should I read SHR[DW] as SHRP[DW] in parisc2.pdf?
Date: Thu, 12 Aug 2004 14:33:15 -0500
Message-ID: <200408121433.15444.mszick@goquest.com>
References: <200408121741.KAA29481@lucy.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200408121741.KAA29481@lucy.cup.hp.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu August 12 2004 12:41, Jim Hull wrote:
> Joel:
> 
- - - - -
> 
> Does the PA2.0 gnu assembler not recognize these (and other) pseudo-ops? 
Perhaps too well.
If I recall properly, the same table & code is used for both the assembler and
the 'disassemble' (-d) option of objdump.

'objdump -d' tries to be explicit in showing the space register assumed...
but it also displays the pseudo operations rather than the actual operation.
(Grumble, Grumble)

I think that Joel's question comes from (his and my) wondering if we need to
make 'machine independent' defines of some of these instructions.
According to Appendix J - we don't - the PA1.1 codes will assemble for
PA2.0 (with HP's assembler).
Time will show if gcc-inline assembly is that nice to we programmers.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
