Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id CDA0C482B
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Feb 2003 05:22:03 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18hqT7-0001yQ-00; Sun, 09 Feb 2003 12:21:57 +0000
Date: Sun, 9 Feb 2003 12:21:57 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20030209122157.F27544@parcelfarce.linux.theplanet.co.uk>
References: <20030208222242.AA3554829@dsl2.external.hp.com> <20030208222746.GB19683@dsl2.external.hp.com> <20030208232303.B27544@parcelfarce.linux.theplanet.co.uk> <20030209081121.GA31855@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030209081121.GA31855@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Sun, Feb 09, 2003 at 01:11:21AM -0700
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux grundler
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

On Sun, Feb 09, 2003 at 01:11:21AM -0700, Grant Grundler wrote:
> I've rebuilt "unstable" binutils + ldwa,o patch on "testing" and dropped
> them on
> 	ftp://ftp.parisc-linux.org/unofficial-debs/
> 
> -rw-r--r--    1 grundler ftpadmin   478700 Feb  8 23:51 binutils-dev_2.13.90.0.16-1_hppa.deb
> -rw-r--r--    1 grundler ftpadmin  3311272 Feb  8 23:53 binutils-multiarch_2.13.90.0.16-1_hppa.deb
> -rw-r--r--    1 grundler ftpadmin  2307548 Feb  8 23:54 binutils_2.13.90.0.16-1_hppa.deb

I've removed these.  Few problems:

 - Same version number as the unstable package, so an upgrade wouldn't
   replace them
 - Not listed in the Packages file.
 - debian/changelog not updated

I'm doing a fresh build now.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
