Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.uct.ac.za (mail.uct.ac.za [137.158.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 951F1482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Oct 2001 04:03:29 -0600 (MDT)
Received: from marmite.its.uct.ac.za ([137.158.26.155])
	by mail.uct.ac.za with smtp (Exim 3.33 #4)
	id 15x3rO-000BOl-00
	for parisc-linux@lists.parisc-linux.org; Fri, 26 Oct 2001 12:05:06 +0200
Date: Fri, 26 Oct 2001 12:02:21 +0200
From: Michael Wood <mwood@its.uct.ac.za>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] very odd problem
Message-ID: <20011026120221.A3151@marmite.its.uct.ac.za>
References: <F128WXpA1DHstgNogS400011dde@hotmail.com> <20011025135548.C17203@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011025135548.C17203@dogbert.localdomain>
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

Hi

On Thu, Oct 25, 2001 at 01:55:48PM +0200, Albert Strasheim wrote:
> Hello,
> 
> I had this same problem on i386 -- I think it's a dependancy
> bug that gets exposed during installation (ppp depending on
> libpcap, I think), which causes some setup scripts to fail
> during installation.
> 
> Look for a start-stop-daemon.REAL file and copy it over your
> start-stop-daemon. I think that should solve the problem. Or
> I'm utterly confused... which is probably more likely. :-)

debootstrap moves start-stop-deamon to start-stop-daemon.REAL
(see /usr/lib/debootstrap/scripts/woody)

It's supposed to move it back again at the end, so maybe it
failed somewhere along the way?

> Regards,
> 
> Albert
> 
> On Thu, 25 Oct 2001, Kenneth Westelinck wrote:
> 
> > Hi all,
> > 
> > 
> > I've recently installed the test-release of woody on my 712/60. I've also 
> > compiled a recent kernel available from the parisc-linux site. All works 
> > well, except from a very strange problem. The start-stop-daemon call, which 
> > is used throughout the init scripts, doesn't seem to work. So, executing the 
> > 
> > inetd script results in nothing, not even an error. Starting inetd on the 
> > command line (/usr/sbin/inetd) works great. Is there a known bug in the 
> > start-stop-daemon program? Can this be solved, or will I have to rewrite my 
> > init scripts?
> > 
> > Many thanks in advance.
> > 
> > 
> > regards,
> > 
> > Kenneth



-- 
Michael Wood <mwood@its.uct.ac.za>
