Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6A9A1482B
	for <parisc-linux@parisc-linux.org>; Tue,  6 Nov 2001 04:47:58 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id D8DFCB00C; Tue,  6 Nov 2001 11:49:04 +0000 (GMT)
Date: Tue, 6 Nov 2001 11:49:04 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: kenneth westelinck <kennywest1@hotmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Kaj-Michael Lang <milang@tal.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Compiling Mozilla on parisc-linux fails
Message-ID: <20011106114904.L8938@linuxcare.com>
References: <OE761L3gJcYPqd2rg2Q00007507@hotmail.com> <003101c163a9$48570590$56dc10c3@amos> <OE13GhAj5p1Fjxe0ymQ00007efc@hotmail.com> <20011105032426.A1671@solo.franken.de> <OE72TyAAfCKQBu8Etaa00008646@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <OE72TyAAfCKQBu8Etaa00008646@hotmail.com>; from kennywest1@hotmail.com on Tue, Nov 06, 2001 at 09:04:04AM +0100
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

On Tue, Nov 06, 2001 at 09:04:04AM +0100, kenneth westelinck wrote:
> Hi,
> 
> 
> I tried to do a dpkg-buildpackage. He seems to be complaining about the
> "zip" package. Appearantly the build depends on this package. However, when
> I tried a "apt-get install zip" the package was not found. Is there an alias
> for this package, or do I also need to build this package from the
> source-deb?

Works for me:


root@slab:/build/palo/palo-0.95# apt-get install zip
Reading Package Lists... Done
Building Dependency Tree... Done
The following NEW packages will be installed:
  zip 
0 packages upgraded, 1 newly installed, 0 to remove and 52  not upgraded.
Need to get 101kB of archives. After unpacking 254kB will be used.
Get:1 http://non-us.debian.org unstable/non-US/main zip 2.30-3 [101kB]
Fetched 101kB in 0s (151kB/s)
Selecting previously deselected package zip.
(Reading database ... 25584 files and directories currently installed.)
Unpacking zip (from .../archives/zip_2.30-3_hppa.deb) ...
Setting up zip (2.30-3) ...


Maybe you need to apt-get update ?

Richard
