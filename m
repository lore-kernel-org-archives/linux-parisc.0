From: Joel Soete <soete.joel@scarlet.be>
Subject: [parisc-linux] How hp implemented 'undefined instruction'?
Date: Sat, 26 Aug 2006 13:05:55 +0000
Message-ID: <44F04733.1050305@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello all,

In cpu books (parisc2.0.pdf or pa11_acd.pdf), in some well defined conditions, an insn can be an 'undefined instruction'.

Those books said about this:
--- snip ---
Within each major opcode, there may be undefined opcode extensions and
modifiers (these are undefined instructions). Interpretation of these opcodes
is left to the implementor, but system integrity is not compromised.
An undefined instruction, or sequence of undefined instructions, executed at a
given privilege level has no effect on system state other than what would have
been produced by a sequence of defined instructions running at the same
privilege level. This limits the possible side-effects that could
result from undefined instructions.

Undefined operations are equivalently specified. These result from normally
defined instructions but with operands or specifiers that are explicitly
disallowed.
--- snip ---

In "Interpretation of these opcodes is left to the implementor", I understand HP's integration of those cpu n their system?

But the text make me thought they aren't trap?

Does system behave like it's some kind of nop?

TIA,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
