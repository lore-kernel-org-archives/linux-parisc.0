From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] cannot build kernel with hppa64-linux-gcc-3.4?
Date: Thu, 26 Aug 2004 10:56:13 -0700
Message-ID: <20040826175613.GH23033@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
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

Hi all,

while debugging some other problems, i noticed that a 64-bit kernel
built with gcc-3.4.1 (debian 3.4.1-7) will not boot. It causes a HPMC
very early on trying to write to nonexistent memory. gcc-3.3.4 (debian
1:3.3.4-9) works fine. 

haven't had time to dig more yet, but it seems to be getting a ITLB
fault, and when we try to handle the interruption, we try to write to an
unmapped virtual address 0x14ffffd00 (this is in skip_save_ior, right
after we switch back to virtual space)

anyone else tried this?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
