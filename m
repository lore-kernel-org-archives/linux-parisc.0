From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] glibc update is broken in testing?
Date: Sat, 29 May 2004 20:36:49 -0600
Message-ID: <20040530023649.GF11441__22070.5670807094$1416623462$gmane$org@colo.lackof.org>
References: <20040529184910.GA11441@colo.lackof.org> <20040529201456.GB11441@colo.lackof.org> <20040529203327.GW5850@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
 debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <willy@debian.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20040529203327.GW5850@parcelfarce.linux.theplanet.co.uk>
Resent-Message-ID: <M_EA6B.A.BLB.LjUuAB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

On Sat, May 29, 2004 at 09:33:27PM +0100, Matthew Wilcox wrote:
> You can do this more easily by running
> 	ldconfig -m /target/lib /target/usr/lib

~ # ldconfig -m /target/lib/ /target/usr/lib/
ldconfig: invalid option -- m
Try `ldconfig --help' or `ldconfig --usage' for more information.

It looks like that should be "ldconfig -l -r /target"

> Then you can check it worked by running chroot /target and seeing if
> everything seems happy.

After unpacking a proper libc6_*hppa.deb by hand, the chroot worked.
I was able to run dgpkg/dselect in the chroot just fine.

"dpkg -i locales_2.3.2.ds1-12_all.deb" seems to be taking an awful
long time in "Setting up locales" step. I'm not sure if it's because
of the chroot environment or it just takes a while to regen the
locales data. I'll let it run a while and see what happens.
In any case, this box is a D-I test candidate on the next
beta release.

thanks,
grant


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
