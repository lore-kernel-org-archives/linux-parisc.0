Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8471E482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Jan 2002 09:30:54 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16U9Fc-0006Uj-00; Fri, 25 Jan 2002 16:30:52 +0000
Date: Fri, 25 Jan 2002 16:30:52 +0000
From: Matthew Wilcox <willy@debian.org>
To: Greg Ingram <ingram@symsys.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] g++ problem with `std' namespace
Message-ID: <20020125163052.B20046@parcelfarce.linux.theplanet.co.uk>
References: <2F1E6AB90ECAD311943700A0C9E3B15407888693@xatl03.atl.hp.com> <Pine.LNX.4.21.0201250940350.1690-100000@maestro.symsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0201250940350.1690-100000@maestro.symsys.com>; from ingram@symsys.com on Fri, Jan 25, 2002 at 09:54:46AM -0600
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

On Fri, Jan 25, 2002 at 09:54:46AM -0600, Greg Ingram wrote:
> 
> I seem to have run into a problem with GCC on parisc-linux which the
> script below will demonstrate.  I get an "`fread' undeclared in namespace
> `std'" error.  The example works fine on four other architectures, but
> they all have gcc 2.95.x while my parisc box has gcc 3.0.x.  Is this a
> parisc problem, a gcc problem, or a coder problem?

bit of each.  gcc changed to be closer to being standards compliant,
and broke a lot of noncompliant code that had previously worked.
In this case, fread is no longer in std.  You should be using ::fread,
not std::fread

Oh -- just figured out a different solution.  If you replace #include
<stdio.h> with #include <cstdio>, std::fread works.

-- 
Revolutions do not require corporate support.
