Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4FC044841
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Feb 2002 09:50:23 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16ag8E-0000a6-00; Tue, 12 Feb 2002 16:50:14 +0000
Date: Tue, 12 Feb 2002 16:50:14 +0000
From: Matthew Wilcox <willy@debian.org>
To: "Roylance, Stephen D." <SROYLANCE@PARTNERS.ORG>
Cc: 'Grant Grundler' <grundler@dsl2.external.hp.com>,
	"'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Getting a D370 off the ground
Message-ID: <20020212165014.C1173@parcelfarce.linux.theplanet.co.uk>
References: <FE6B88CC9D2BD311AD120008C7B3AF87081ED28D@phsexch3.mgh.harvard.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <FE6B88CC9D2BD311AD120008C7B3AF87081ED28D@phsexch3.mgh.harvard.edu>; from SROYLANCE@PARTNERS.ORG on Tue, Feb 12, 2002 at 11:39:40AM -0500
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

On Tue, Feb 12, 2002 at 11:39:40AM -0500, Roylance, Stephen D. wrote:
> OK, looks like I have two PA8000's.  I apt-get upgraded to unstable and
> d/l'ed the latest kernel tar.gz.  
> I'm getting an error trying to compile a 64 bit SMP kernel:
> make[1]: hppa64-linux-gcc: Command not found

Yeah, I don't think we have 64-bit compilers packaged properly yet.
you can get some 64-bit debs from:
http://ftp.parisc-linux.org/unofficial-debs/

though i still recommend running a 32-bit kernel unless you really need
a 64-bit kernel (eg have >4GB of ram or have firmware which only supports
64-bit mode.)

-- 
Revolutions do not require corporate support.
