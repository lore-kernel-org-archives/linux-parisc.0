From: Kyle McMartin <kyle@debian.org>
Subject: RFC: Updating hppa kernel-image packages
Date: Tue, 22 Mar 2005 15:47:51 -0500
Message-ID: <20050322204751.GC26941__32284.3544338413$1416623707$gmane$org@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-hppa@lists.debian.org,
 debian-kernel@lists.debian.org
To: parisc-linux@lists.parisc-linux.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
Resent-Message-ID: <W79l6D.A.DyC.gTIQCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

[d-k copied about ABI[0] change]

The current crop of 2.6.8 kernel images in unstable and testing are
quite good, but a new upload is required to fix some security bugs
and some hppa-related bugs.

This is basically a call for suggestions for what I should backmerge
to 2.6.8 from recent CVS. I will go through the parisc-linux-cvs archive
again and try to pull what I can see, but I'd like a bit of help.

These changes can be categorized in two, ones which change the module
ABI, and ones that don't. 

To help keep the lives of the debian-installer folks sane, I'm not
going to honour suggestions to turn on/off various drivers, unless
I get an explicit ok.

[Non-ABI breaking changes] - The following are candidates for merging
                             immediately.

	- Rebuild against recent kernel source for security fixes.
	- Grant pointed out some recent fixes he made to ccio and sba_iommu
          which fix memory starvation on low-memory machines with iommus.

[ABI breaking changes] - The following will wait until the next ABI
                         rev from kernel-source.

	- Disabling USB_DEBUG in all the configs. This was erroneously
          enabled and is disabled on all other architectures.

There seem to be a few security bugs waiting on a rev of the ABI as
well.

Thanks,
	Kyle M.

[0] - for those following at home, the ABI of a kernel is reflected
      in the package name, like the soname of a shared library.


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
