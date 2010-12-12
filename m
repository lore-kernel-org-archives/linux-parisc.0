From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.36 regression : swap support broken
Date: Sun, 12 Dec 2010 17:52:04 -0500
Message-ID: <20101212225203.GA9809@hiauly1.hia.nrc.ca>
References: <20101212193856.15f93ea4@borg.bxl.tuxicoman.be> <20101212192148.079834CF3@hiauly1.hia.nrc.ca> <20101212203322.21537607@borg.bxl.tuxicoman.be> <20101212202258.GA9184@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, eike-kernel@sf-tec.de
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101212202258.GA9184@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 12 Dec 2010, John David Anglin wrote:

> On Sun, 12 Dec 2010, Guy Martin wrote:
> 
> > On Sun, 12 Dec 2010 14:21:47 -0500 (EST)
> > "John David Anglin" <dave@hiauly1.hia.nrc.ca> wrote:
> > 
> > > Hmmm, I didn't think we allowed call instructions in the delay slot of
> > > a branch.  Even though nullified, I think there were issues on some
> > > processors.  Is an asm involved?
> > 
> > I forgot to say that I've been testing this on my C3600.
> > What do you mean by "Is an asm involved?" ?
> 
> Internally, the PA backend keeps track of "insn" types using an attribute
> mechanism.  This is what keeps calls out of the delay slot of branches, etc.
> 
> asms can do stuff that GCC doesn't know about and this can cause
> wrong code issues.  I was just speculating.

This is a GCC PA bug.  The code generation is wrong for this RTL:

(jump_insn 13 10 14 (set (pc)
        (if_then_else (eq (zero_extract:SI (reg:SI 28 %r28 [orig:100 D.22506 ] [100])
		    (const_int 1 [0x1])
		    (const_int 28 [0x1c]))
		(const_int 0 [0]))
	    (label_ref 16)
	    (pc))) include/linux/page-flags.h:297 29 {*pa.md:1610}
     (expr_list:REG_BR_PRED (const_int 5 [0x5])
        (expr_list:REG_DEAD (reg:SI 28 %r28 [orig:100 D.22506 ] [100])
	    (expr_list:REG_BR_PROB (const_int 5000 [0x1388])
		(nil))))
 -> 16)

(note 14 13 15 [bb 3] NOTE_INSN_BASIC_BLOCK)

(insn:TI 15 14 16 (parallel [
            (asm_operands/v ("") ("") 0 []
		 []
		 [] mm/swap_state.c:185)
	    (clobber (mem:BLK (scratch) [0 A8]))
	]) include/linux/page-flags.h:298 -1
    (nil))

(code_label 16 15 17 15 "" [1 uses])

(note 17 16 19 [bb 4] NOTE_INSN_BASIC_BLOCK)

(note 19 17 107 NOTE_INSN_DELETED)

(insn 107 19 122 (sequence [
            (call_insn:TI 18 19 4 (parallel [
			(set (reg:SI 28 %r28)
			    (call (mem:SI (symbol_ref/v:SI ("@get_swap_page") [flags 0x41]  <function_decl 0x40ae6280 get_swap_page>) [0 S4 A32])
...

The output_bb code used for jump_insn 13 is confused by the memory
clobber asm.  There should be a nop after the bb instruction as a
conditional branch to the following instruction is asking for disaster.
Some situations where a nop is needed are already covered, but you
have found a new one.

I created a GCC PR:
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46915

This may affect other conditional branches...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
