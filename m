Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 16 Mar 2003 19:25:42 -0700
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030317022542.GA6630@dsl2.external.hp.com>
References: <200303090351.UAA17796@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200303090351.UAA17796@udlkern.fc.hp.com>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] unsupported ioctl wrappers?
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

FYI,
booting 2.4.20-pa31, I get the follow msgs on my console.
Not sure if the following ioctl wrappers are new or known to be missing.

...
Loading modules: 
Starting raid devices: 
sys32_ioctl: Unknown cmd fd(3) cmd(40041272) arg(faf01500)
sys32_ioctl: Unknown cmd fd(3) cmd(40041272) arg(faf01500)
sys32_ioctl: Unknown cmd fd(3) cmd(40041272) arg(faf01500)
done.
Starting RAID devices: handling MD device /dev/md0
...

grant
