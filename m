From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] [Updates] glibc 2.3.3 experimental update.
Date: Tue, 12 Oct 2004 16:45:37 -0400
Message-ID: <20041012204536.GJ24430@baldric.uwo.ca>
References: <20041008175619.GF24430@baldric.uwo.ca>
	<20041008225352.GN14151@tausq.org>
	<20041009182448.GS24430@baldric.uwo.ca>
	<20041010230457.GT14151@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041010230457.GT14151@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> as you've probably noticed upstream has changed the way this function is
> defined between gcc 2.3.2 and 2.3.3. not sure exactly what's wrong, but
> as you said it'll be interesting to build one on i386 and compare...

Upstream i386 and linuxthreads is unbuildable. I don't really want to
fix i386 + linuxthreads to debug this, when in reality we should just
change it so that it's not hidden :)

I'll set this to build.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
