From: Kyle McMartin <kyle@debian.org>
Subject: [parisc-linux] Call for Testing
Date: Sun, 27 Mar 2005 15:45:50 -0500
Message-ID: <20050327204550.GC7728__14247.1447041773$1416623722$gmane$org@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: debian-hppa@lists.debian.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi,

I've backported some more patches to 2.6.8 for possible[1] inclusion in
sarge (they fix some possibly important bits).

You can find kernels here:
	http://www.parisc-linux.org/~kyle/debian-kernel/2005-03-27/

I'd appreciate it if everyone could take 10 minutes so we can get good
coverage testing these fixes, to make sure there are no regressions
from the kernels already in sarge. If you could test the sarge kernels
too, that would be fantastic.

Please reply either to the list, or to me personally with the dmesg
output from a boot, and what machine(s) you were able to test on.

Thanks,
	Kyle

[1]: The release team has "effectively" frozen all kernels from propogating
     to sarge. But I think it's worth keeping fixes around, even if they
     don't get included immediately.
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
