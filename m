From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] How hp implemented 'undefined instruction'?
Date: Sat, 26 Aug 2006 11:21:43 -0400
Message-ID: <20060826152143.GM1455@athena.road.mcmartin.ca>
References: <44F04733.1050305@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <44F04733.1050305@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Aug 26, 2006 at 01:05:55PM +0000, Joel Soete wrote:
> Within each major opcode, there may be undefined opcode extensions and
> modifiers (these are undefined instructions). Interpretation of these 
> opcodes
> is left to the implementor, but system integrity is not compromised.
> An undefined instruction, or sequence of undefined instructions, executed 
> at a
> given privilege level has no effect on system state other than what would 
> have
> been produced by a sequence of defined instructions running at the same
> privilege level. This limits the possible side-effects that could
> result from undefined instructions.
> 
> Undefined operations are equivalently specified. These result from normally
> defined instructions but with operands or specifiers that are explicitly
> disallowed.
> --- snip ---

I believe what they mean here is "Implementation-specific" opcodes. If you
look in the PCXL2 ERS, there are unarchitected additions to the instruction
set.

I hand crafted a binary using some of these extended insns, and they didn't
cause a SIGILL on a PA8500 (vastly different from PCXL2...) I believe the
insn in question was a little endian LDW.

However, if you craft an insn outside of the defined major opcodes, you
definitely will get a SIGILL trap.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
