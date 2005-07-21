From: Kurt Fitzner <kfitzner@excelcia.org>
Subject: [parisc-linux] Bug report data collection tool
Date: Thu, 21 Jul 2005 01:51:04 -0600
Message-ID: <42DF53E8.5010904@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
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

I was thinking that perhaps it would be useful to have a tool to help
collate information after a hang/crash.  Something you would run on the
next boot.

I wasn't able to tell from a cursory glance at pdc_stable.c, but if the
driver supports it then perhaps the tool could read HPMC/TOC data post
crash from nvram (rather than having to write out or use a serial
console to capture 'ser pim' data).  It could then cross reference the
crash address with the System.map, gather pre-crash data from the logs
and a machine profile from /proc.

If something like this would be useful, I could do with having a project
to help me learn the ropes.

	Kurt.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
