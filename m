Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from xo.hp.is (xo.hp.is [194.105.242.199])
	by dsl2.external.hp.com (Postfix) with ESMTP id B0C4A482C
	for <parisc-linux@parisc-linux.org>; Tue, 13 Nov 2001 11:13:54 -0700 (MST)
Received: (from ra@localhost)
	by xo.hp.is (8.11.6/RA-8.11.6) id fADIDqe00413
	for parisc-linux@parisc-linux.org; Tue, 13 Nov 2001 18:13:52 GMT
Date: Tue, 13 Nov 2001 18:13:52 +0000
From: Richard Allen <ra@hp.is>
To: parisc-linux@parisc-linux.org
Message-ID: <20011113181352.B382@hp.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Deb's broken ?
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

bofh:~# apt-get upgrade
Reading Package Lists... Done
Building Dependency Tree... Done
The following packages have been kept back
  binutils bsdutils cpp-3.0 g++-3.0 gcc-3.0 gzip ipchains libstdc++3
  libstdc++3-dev logrotate mount nano net-tools procps sysvinit util-linux 
0 packages upgraded, 0 newly installed, 0 to remove and 16  not upgraded.

bofh:~# apt-get install gzip
Reading Package Lists... Done
Building Dependency Tree... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.

Since you only requested a single operation it is extremely likely that
the package is simply not installable and a bug report against
that package should be filed.
The following information may help to resolve the situation:

Sorry, but the following packages have unmet dependencies:
  gzip: PreDepends: libc6 (>= 2.2.4-4) but 2.2.4-3 is to be installed
E: Sorry, broken packages

ii  libc6          2.2.4-3        GNU C Library: Shared libraries and Timezone
ii  libc6-dev      2.2.4-3        GNU C Library: Development Libraries and Hea


Something Im missing ?

-- 
Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
               --  Solaris 7 Certified Systems and Network Administrator.
Bell Labs Unix --  Reach out and grep someone.
Those who do not understand Unix are condemned to reinvent it, poorly.
