From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Thu, 20 Apr 2006 12:36:37 -0500
Message-ID: <200604201236.37925.mszick@morethan.org>
References: <200604201728.k3KHSH7W022804@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604201728.k3KHSH7W022804@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu April 20 2006 12:28, John David Anglin wrote:
> > > (here) insn, an interruption occures which in turn launch the
> > > fixup_put_user_skip_1()
> > 
> > A couple more questions for research :)
> > 
> > Q: Does the process of interruption clobber registers?
> 
Joel,

The machine should switch a small sub-set of the general
registers to an alternate set, called the 'shadow registers'
for the interruption routine to use.

I do not recall the exact list of which register numbers
those are.  Search for 'shadow registers' in the acd.pdf

I do not know if r1 is shadowed or not.

If the interrupt routine needs to use other registers,
then it must save/restore them in that routine.

Mike
> r8 and r9?
> 
> Dave
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
