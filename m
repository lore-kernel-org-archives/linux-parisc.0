From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Re: hppa glibc 2.3.3
Date: Wed, 6 Oct 2004 00:56:46 -0400
Message-ID: <20041006045646.GJ23260@baldric.uwo.ca>
References: <200409271755.i8RHtNoa017851@hiauly1.hia.nrc.ca>
	<Pine.LNX.4.58.0409272134390.422@trillian.uni>
	<20040928032200.GF27033@baldric.uwo.ca>
	<Pine.LNX.4.58.0410050846320.924@trillian.uni>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Elliott Potter <mailinglist@eep.burdell.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.58.0410050846320.924@trillian.uni>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Oct 05, 2004 at 08:47:56AM -0500, Elliott Potter wrote:
> > This was a bug fixed upstream, where the nscd thread daemon was using
> > NPTL related syscalls when it shouldn't. Pull cvs again and that should
> > fit the problem.
> 
> Just an update, this seemed to work just fine.  I'm going to play with
> it a bit in my chroot environment and see how it works.

Perfect. I'm working on a variant where I've forward ported the debian
specific patches into upstream head.

Please report back if you have any problems, or if you have success :)

e.g. Try installing Xnest + gnome, and run some stuff remotely?

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
