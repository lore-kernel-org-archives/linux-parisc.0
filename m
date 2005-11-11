From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Linux on rp8400
Date: Fri, 11 Nov 2005 07:38:13 -0700
Message-ID: <20051111143813.GB1658@parisc-linux.org>
References: <92dc10290511090202w13610049p489c16a0fc0642bb@mail.gmail.com>
	<20051109122253.GA27540@parisc-linux.org>
	<20051109161200.GA4507@colo.lackof.org>
	<92dc10290511091404q4e4d1d91k36dcbb7737fd6153@mail.gmail.com>
	<43746C1E.4070003@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <43746C1E.4070003@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Nov 11, 2005 at 10:02:06AM +0000, Joel Soete wrote:
> Vesa Ruokonen wrote:
> >This problem was solved by using latest palo v1.9. I don't know
> >what was wrong or how it had changed since v1.5.

The bad news is that palo 1.9 doesn't necessarily work.  The same
lifimage which boots on nicol (N4000) won't boot on the rp8400.

> >Good news is Linux didn't panic on booting kernel, but bad
> >news are missing devices and lost serial console.
>
> Are you trying a smp kernel? (as it's a smp system that's what would seems 
> the most obvious ;-)
> 
> But did you also tried a up kernel? Is it the same behabiour in this case 
> (missing devices and lost serial console)?

The problem with missing devices is that there's a conflict (two devices
with the same hw path).  At that point, the PAT device enumeration code
gives up.  I've given Vesa a kernel which should fix this, but of course
palo isn't working.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
