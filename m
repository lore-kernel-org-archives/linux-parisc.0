Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0AA8E483E
	for <parisc-linux@lists.parisc-linux.org>; Sat,  1 Nov 2003 01:20:16 -0700 (MST)
Date: Sat, 1 Nov 2003 00:24:51 -0800
From: Randolph Chung <tausq@debian.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031101082451.GJ28967@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] what's up with the ipc syscalls?
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

in our syscall table, semctl, msgctl and shmctl are marked as "broken".
Does anybody know what's up with that?

i did a simple hack, which is to replace

        return sys_msgctl (msqid, cmd & ~IPC_64, buf);

with 

        return sys_msgctl (msqid, cmd | IPC_64, buf);

in sys_parisc.c, and at least in some simple tests it seems to work
(whereas the original one was really broken)

haven't tested it very much yet.... a similar hack for semctl doesn't
seem to work. haven't investigated more yet.. but wanted to know if
others can shed light on what was the problems there....

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
