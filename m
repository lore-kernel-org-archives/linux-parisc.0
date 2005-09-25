From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Space registers and how to use them
Date: Sun, 25 Sep 2005 13:43:58 -0400 (EDT)
Message-ID: <200509251743.j8PHhw4w013823@hiauly1.hia.nrc.ca>
References: <20050925034342.GA1459@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org
To: matthew@wil.cx (Matthew Wilcox)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050925034342.GA1459@parisc-linux.org> from "Matthew Wilcox" at
	Sep 24, 2005 09:43:42 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Instructions with a 2-bit s field have two cases.  If s is 1-3, we use
> the corresponding space register (sr1-sr3).  If the value in the s field
> is 0, we do not use space register 0.  Instead, we use one of sr4-7 as
> determined by the top two bits of the *base register*.

Actually, there is another twist to the above in wide mode (PSW[W]==1).
Instructions with long displacements always use the implicit addressing
scheme.  The space register bits are used instead to provide a 16-bit
displacement.  At the moment, we need support for some additional
relocations to handle long displacements for all instruction formats
(e.g., we lack support for long displacements in floating point loads
and stores).

Short and indexed instructions behave the same as in 32-bit mode for
s_field==0 (i.e., space register is determined by the top two bits
of the base register).  However, it's an undefined operation to have
a nonzero s_field in unprivileged code.

Regarding GAS, I changed the rules regarding the specification of
space registers in instructions to avoid confusion.  In instructions
that have a 3-bit space register field, it is now a requirement to
explicitly specify the space register field.  The treatment of sr0 in
these instructions is completely different from the treatment in
instructions with 2-bit space register fields (i.e., the base register
selection process isn't used).  There were a couple of entries in
the opcode table that allowed omitting the space register field in
instructions with 3-bit space register fields.  These have been
removed.  Indeed, without doing this, it wouldn't have been possible
to support both the 2 and 3-bit formats for "fic".

As a coding note, it's best not to specify sr0 in instructions which
use the base register selection mechanism.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
