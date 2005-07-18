From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] PA 2.0 float conversion to unsigned long long
Date: Mon, 18 Jul 2005 13:45:28 -0600
Message-ID: <20050718194528.GD11016@colo.lackof.org>
References: <20050714033206.GD4949@roadwarrior.mcmartin.ca>
	<200507140356.j6E3uShf022345@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200507140356.j6E3uShf022345@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Jul 13, 2005 at 11:56:28PM -0400, John David Anglin wrote:
...
> That's what I was thinking when I wrote the message.  Under linux,
> both the left and right halves of fr22 end up with 0x80000000.  Under
> hpux, the left result is 0x80000000 and the right 0.  The only other
> explanation is that the c3k fpu has a bug that's not present in an A500
> (doubtful).

If they are running at the same clock speed, they are likely to have
identical CPUs. Some of the 440Mhz boxes did roll CPU HW version
after initial release - including some SMP bugs that C3K wouldn't
be exposed to. I'm skeptical it's a bug in the FPU unless you
can demonstrate the same code works on another (newer) CPU model.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
