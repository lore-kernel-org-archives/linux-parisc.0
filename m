Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 20 Dec 2002 21:34:48 -0700
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.5 randomly kills applications with page faults
Message-ID: <20021221043448.GB26293@dsl2.external.hp.com>
References: <20021221013824.GA18983@dsl2.external.hp.com> <200212210146.gBL1kvv11019@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200212210146.gBL1kvv11019@localhost.localdomain>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Fri, Dec 20, 2002 at 07:46:57PM -0600, James Bottomley wrote:
> Actually, I found STREG,ma and LDREG,mb worked for me.

doh! of course!
those are cpp macros, not asm macros.

> > but, given the assertion we could take an interrupt between line 96 and
> > 107, would an interrupt between 95/96 cause Bad Things (tm) to happen?
> 
> Not according to the parisc assembler manual.  As long as we can guarantee 
> that the stack is incremented before the value is stored (which seems to be 
> what STREG,ma seems to assure), we should be fine.

I'm not worried about the atomicity of the instruction.

I'm worried about sr7 getting modified without the user stack
pointer getting saved to the proper place. It might not be a
problem at all. I just don't know all the uses of user/kernel
stacks in the interrupt code paths. I'm wondering if the entire
code sequence I quoted needs to block interrupts while setting
up the syscall.

grant
