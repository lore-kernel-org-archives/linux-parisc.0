Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 9 Feb 2003 01:11:21 -0700
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030209081121.GA31855@dsl2.external.hp.com>
References: <20030208222242.AA3554829@dsl2.external.hp.com> <20030208222746.GB19683@dsl2.external.hp.com> <20030208232303.B27544@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030208232303.B27544@parcelfarce.linux.theplanet.co.uk>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Sat, Feb 08, 2003 at 11:23:03PM +0000, Matthew Wilcox wrote:
> Is all that's needed to take the latest binutils from debian unstable
> and rebuild it on woody?

I've rebuilt "unstable" binutils + ldwa,o patch on "testing" and dropped
them on
	ftp://ftp.parisc-linux.org/unofficial-debs/

-rw-r--r--    1 grundler ftpadmin   478700 Feb  8 23:51 binutils-dev_2.13.90.0.16-1_hppa.deb
-rw-r--r--    1 grundler ftpadmin  3311272 Feb  8 23:53 binutils-multiarch_2.13.90.0.16-1_hppa.deb
-rw-r--r--    1 grundler ftpadmin  2307548 Feb  8 23:54 binutils_2.13.90.0.16-1_hppa.deb

They install fine on my c3k though TBH, I haven't tried to use them.
(I did use the tarballs before posting earlier).
If someone wants to repeat that exercise for woody, that would be
fine with me.

/me checks off an item from his TODO list

Apperently, we still have problems with timers or timer code on PA20 SMP.
Still haven't been able to isolate this to any peice of code. :^(

g'night,
grant
