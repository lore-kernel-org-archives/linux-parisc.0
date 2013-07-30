From: Meelis Roos <mroos@linux.ee>
Subject: INEQUIVALENT ALIASES in 3.11-rc3
Date: Wed, 31 Jul 2013 00:06:36 +0300 (EEST)
Message-ID: <alpine.SOC.1.00.1307310003070.19136@math.ut.ee>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I tried 3.11-rc3 yesterday on my RP3440. It works, but has acquired a 
new warning during Gentoo emerge cycle:
[  922.492000] INEQUIVALENT ALIASES 0x4197a000 and 0x7b000 in file conftest
[  922.492000] INEQUIVALENT ALIASES 0x4197a000 and 0x7b000 in file conftest
[  922.492000] INEQUIVALENT ALIASES 0x4197a000 and 0x7b000 in file conftest
[  922.492000] INEQUIVALENT ALIASES 0x4197a000 and 0x7b000 in file conftest
[  922.492000] INEQUIVALENT ALIASES 0x4197a000 and 0x7b000 in file conftest
[ 4577.536000] INEQUIVALENT ALIASES 0x41a76000 and 0x7b000 in file conftest
[ 4577.536000] INEQUIVALENT ALIASES 0x41a76000 and 0x7b000 in file conftest
[ 4577.536000] INEQUIVALENT ALIASES 0x41a76000 and 0x7b000 in file conftest
[ 4577.536000] INEQUIVALENT ALIASES 0x41a76000 and 0x7b000 in file conftest
[ 4577.536000] INEQUIVALENT ALIASES 0x41a76000 and 0x7b000 in file conftest

There is no file named conftest present after emerge, so it must have 
been some temporary program.

-- 
Meelis Roos (mroos@linux.ee)
