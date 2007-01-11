From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] [PATCH] shmat() and CONFIG_STACK_GROWSUP
Date: Thu, 11 Jan 2007 20:15:58 +0100
Message-ID: <200701112015.58821.deller__16019.4718781442$1416624261$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
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

I think this patch for the shmat() is obviously correct for our stack (which grows up).
Basically we gain a small region of 4 Pages in which shmat() may map memory.

Ok ?
If yes, should I commit or send to linux-kernel mailing list ?

Helge

diff --git a/ipc/shm.c b/ipc/shm.c
index 6d16bb6..f5cc635 100644
--- a/ipc/shm.c
+++ b/ipc/shm.c
@@ -852,6 +852,7 @@ long do_shmat(int shmid, char __user *sh
 		user_addr = ERR_PTR(-EINVAL);
 		if (find_vma_intersection(current->mm, addr, addr + size))
 			goto invalid;
+#ifndef CONFIG_STACK_GROWSUP
 		/*
 		 * If shm segment goes below stack, make sure there is some
 		 * space left for the stack to grow (at least 4 pages).
@@ -859,6 +860,7 @@ long do_shmat(int shmid, char __user *sh
 		if (addr < current->mm->start_stack &&
 		    addr > current->mm->start_stack - size - PAGE_SIZE * 5)
 			goto invalid;
+#endif
 	}
 		
 	user_addr = (void*) do_mmap (file, addr, size, prot, flags, 0);
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
