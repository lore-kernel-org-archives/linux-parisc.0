Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2498C484B
	for <parisc-linux@lists.parisc-linux.org>;
	Sat,  3 Jan 2004 21:55:53 -0700 (MST)
Date: Sat, 3 Jan 2004 21:55:51 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Matt Lewis <nitephyre@iinet.net.au>
Subject: Re: [parisc-linux] Probem Installing: slang(version).deb corrupt
Message-ID: <20040104045551.GA16904@colo.lackof.org>
References: <000801c3d1de$08e053d0$0101a8c0@nitephyre>
	<3FF6A74F.3000108@tiscali.be>
	<001f01c3d24b$5e810600$0101a8c0@nitephyre>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <001f01c3d24b$5e810600$0101a8c0@nitephyre>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Jan 04, 2004 at 08:46:03AM +1000, Matt Lewis wrote:
> ok, i went and got the latest testing iso, but now it's saying
> that libc6_2.2.5-6_hppa.deb was corrupt and cannot download...
> thats cd no.2 coastered and another 70mb down... any tips?

Full net install? (net boot with NFS root to run the installer?)

current lifimages are also available that match the net install ISOs.
lifimage needs to be served from a bootp server.

> the orginal problem was from both a cd i got with the computer
> (an earlier 70mb d/l it seems) and the latest full 650mb iso i downloaded...
> though if i try and boot from the big iso, the installer starts then the
> keyboard wont work... getting frustrated :|

Is the keyboard hanging using a serial or graphics console?

In general, the serial console is more stable and I suggest installing
via the serial console. Disconnect the USB keyboard and connect a DB9
serial cable to another linux box (9600, 8N1).  Once installed, upgrade
to a 2.4.23 kernel (available from ftp.p-l.o/kernels/c3000) and then
reconnect the keyboard before rebooting.

grant
