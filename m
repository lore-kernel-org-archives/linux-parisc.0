From: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] glibc update is broken in testing?
Date: Sat, 29 May 2004 21:33:27 +0100
Message-ID: <20040529203327.GW5850__31397.7762162269$1416623462$gmane$org@parcelfarce.linux.theplanet.co.uk>
References: <20040529184910.GA11441@colo.lackof.org> <20040529201456.GB11441@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20040529201456.GB11441@colo.lackof.org>
Resent-Message-ID: <b_Hq2D.A.ca.ZOPuAB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

On Sat, May 29, 2004 at 02:14:56PM -0600, Grant Grundler wrote:
> o the rest can be cut/pasted:
> 	cd /target/lib
> 	ln -s ld-2.3.2.so ld.so.1
> 	ln -s libc-2.3.2.so libc.so.6
> 	ln -s libm-2.3.2.so libm.so.6
> 	ln -s libdl-2.3.2.so libdl.so.2
> 	ln -s libutil-2.3.2.so libutil.so.1
> 	cd /
> 	umount /target

You can do this more easily by running
	ldconfig -m /target/lib /target/usr/lib

Then you can check it worked by running chroot /target and seeing if
everything seems happy.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
