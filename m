From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Getting PIE to work (was How to reclaim .rela.dyn
	entries for symbols that become hidden?)
Date: Fri, 08 Jul 2005 10:06:05 +0800
Message-ID: <42CDDF8D.4000305@tausq.org>
References: <20050630165918.GG5269@systemhalted.org>	<200507071759.12521.vapier@gentoo.org>
	<42CDDD31.4030403@tausq.org> <200507072200.10597.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200507072200.10597.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> ah, was not aware parisc kept a glibc cvs tree

we just added this recently to work on TLS.

I realized after I sent that last email that the pie patch probably has
some other dependencies so it may take some time to get it upstream. If
you want to look the changes are all in dl-machine.h

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
