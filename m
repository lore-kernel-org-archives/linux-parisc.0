Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 972024834
	for <parisc-linux@lists.parisc-linux.org>; Sun, 25 Aug 2002 18:54:00 -0600 (MDT)
Date: Sun, 25 Aug 2002 17:55:57 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020826005557.GG25592@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] questionable code in glibc sunrpc code?
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

glibc's sunrpc/clnt_tcp.c contains code like this:

      *(u_long *)(ct->ct_mcall + 3 * BYTES_PER_XDR_UNIT)
              = htonl(*(u_long *)info);

ct->ct_mcall is a char[] array that's after a struct,
BYTES_PER_XDR_UNIT is 4

if sizeof(u_long) is 8, then this is an unaligned access... (gcc notices
and complains loudly :-)

this code apparently works on other 64-bit archs.... anyone know how?

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
