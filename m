From: Kurt Fitzner <kfitzner@excelcia.org>
Subject: Re: [parisc-linux] Machine hanging during high-traffic NFS
Date: Thu, 21 Jul 2005 01:42:12 -0600
Message-ID: <42DF51D4.3010106@excelcia.org>
References: <42DD6A7F.8090706@excelcia.org>
	<20050720010425.GC24060@roadwarrior.mcmartin.ca>
	<42DDF65E.7010605@excelcia.org> <20050720164058.GA3681@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <20050720164058.GA3681@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

John David Anglin wrote:
> 2.6.8.1-pa11 is quite stable (12 days up and numerous GCC builds).

I have switched to that version and now cannot reproduce the hang
problem.  Thank-you for the suggestion.

> It might help to have a "stable" branch that is maintained longer
> than is current practice.  At a minimum, the current tree needs to
> be slushed until the main problems are resolved.
> Grant Grundler wrote:

I am used to the old classic 'stable' line where each successive kernel
release under the stable tree was (theoretically) more stable than the
previous one.  Perhaps, at a suggestion, a compromise can be reached by
relabelling kernels.  When one is found to be quite stable label it the
2.6.N-paX.  Other than that, call them 2.6.N-paX-test.

It shouldn't require too much in the way of maintenance and it might
keep naive users (like me) from using unstable kernels before they are
ready to give meaningful bug reports and feedback on problems in them.

Grant Grundler wrote:
> Sounds like either an interrupt storm from the card or a deadlock
> in nfs code. Unfortunately TOC doesn't provide more stack trace
> informaion. And I'm not able to chase NFS issues at the moment.

I 'downgraded' to 2.6.8.1-pa11 as Mr. Anglin suggested and I am not able
to reproduce the hang.  Would it be helpful if I were to identify the
exact kernel version where the hang first begins to occur?

	Kurt.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
