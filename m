From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] PA 2.0 float conversion to unsigned long long
Date: Wed, 13 Jul 2005 23:56:28 -0400 (EDT)
Message-ID: <200507140356.j6E3uShf022345@hiauly1.hia.nrc.ca>
References: <20050714033206.GD4949@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050714033206.GD4949@roadwarrior.mcmartin.ca> from "Kyle
	McMartin" at Jul 13, 2005 11:32:06 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Wed, Jul 13, 2005 at 10:53:50PM -0400, John David Anglin wrote:
> > The enclosed testcase derived from GCC PR 22474 aborts under linux but
> > not under hpux.  The problem is the following insn:
> >=20
> > 0x00002930 <f2ull+24>:  fcnv,t,sgl,udw fr22,fr22
> >=20
> 
> Might this be an insn that is not implemented in hardware, and
> correctly being trapped on hpux, but not on Linux? I took a look
> in arch/parisc/math-emu, but it's quite a bit more than I can handle. :)

That's what I was thinking when I wrote the message.  Under linux,
both the left and right halves of fr22 end up with 0x80000000.  Under
hpux, the left result is 0x80000000 and the right 0.  The only other
explanation is that the c3k fpu has a bug that's not present in an A500
(doubtful).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
