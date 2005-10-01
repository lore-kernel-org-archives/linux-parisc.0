From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: 2.6.14-rc2-pa2 ccio patch
Date: Sat, 1 Oct 2005 00:50:49 -0600
Message-ID: <20051001065049.GA3308@colo.lackof.org>
References: <20050929154308.GA29975@colo.lackof.org>
	<200509292321.j8TNLc60012238@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200509292321.j8TNLc60012238@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Sep 29, 2005 at 07:21:38PM -0400, John David Anglin wrote:
> > Yes and Yes. But my reading of the PA1.1 arch says it *only* has a 2-bit
> > s field.
> 
> Oops, my mix up (fic/fdc confusion).

no problem - I've done worse.

>   However, don't add sr0 to the instruction.

Why not? I added it because I didn't like assumption the caller
to *io_pdir_entry was passing KERNEL_SPACE argument. If that's going
to forever be true, then we may as well hardcode KERNEL_SPACE
in both ccio and sba io_pdir_entry() routines instead of
taking a space_id parameter. Would save us a few cycles.

>   Specifying %r0 instead of '0' is the issue.  Strictly,
> the immediate form is only allowed in PA 2.0.  However, if the assembler
> doesn't accept it let me know.

That's what it looked like to me too.
It now uses %r0.

> I'm going to take a crack at trying to fix PA 1.0 to 1.1 promotion
> this weekend.  This is currently tied to the the lax matching used
> with PA 1.0 instructions.

Like I said, this isn't a problem that bothers me.

thanks!
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
