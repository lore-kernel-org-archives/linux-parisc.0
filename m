From: Randolph Chung <tausq@debian.org>
Subject: [parisc-linux] debug spinlocks
Date: Wed, 14 Jul 2004 12:23:18 -0700
Message-ID: <20040714192318.GR546@tausq.org>
References: <20040714182035.77810494692@palinux.hppa>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040714182035.77810494692@palinux.hppa>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Thibaut, thanks for fixing the debug locks.

Has anyone else tried this on a SMP config? For some reason with
CONFIG_DEBUG_SPINLOCKS=y, i cannot boot a kernel, but without the debug
spinlocks it works fine (well, it gets further). 

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
