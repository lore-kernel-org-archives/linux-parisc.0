From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] traps, unwind new patch proposal.
Date: Sun, 01 May 2005 14:25:12 +0000
Message-ID: <4274E6C8.9020704@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: Randolph Chung <tausq@debian.org>
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

Hi Randolph and *,

Here is my new proposal to attempt to fix the show_stack() bug in the early boot stage:
--- include/asm-parisc/unwind.h.Orig    2005-05-01 15:55:25.000000000 +0200
+++ include/asm-parisc/unwind.h 2005-05-01 15:23:56.000000000 +0200
@@ -61,6 +61,14 @@
         unsigned long prev_sp, prev_ip;
  };

+struct unwind_frame_regs {
+       unsigned long sp, ip, rp, r31;
+};
+
+#define UFI_REGS_BUF_MAX       128     /* about 4k for LP64 */
+extern struct unwind_frame_regs ufi_regs_buf[UFI_REGS_BUF_MAX];
+extern unsigned int ufi_regs_buf_i;
+
  struct unwind_table *
  unwind_table_add(const char *name, unsigned long base_addr,
                  unsigned long gp, void *start, void *end);
@@ -68,9 +76,11 @@
  unwind_table_remove(struct unwind_table *table);

  void unwind_frame_init(struct unwind_frame_info *info, struct task_struct *t,
-                      struct pt_regs *regs);
+                       struct unwind_frame_regs *regs);
  void unwind_frame_init_from_blocked_task(struct unwind_frame_info *info, struct task_struct *t);
+#if 0   /* FIXME: not used */
  void unwind_frame_init_running(struct unwind_frame_info *info, struct pt_regs *regs);
+#endif
  int unwind_once(struct unwind_frame_info *info);
  int unwind_to_user(struct unwind_frame_info *info);

--- arch/parisc/kernel/unwind.c.Orig    2005-05-01 15:50:50.000000000 +0200
+++ arch/parisc/kernel/unwind.c 2005-05-01 15:40:39.000000000 +0200
@@ -326,14 +326,18 @@
  }

  void unwind_frame_init(struct unwind_frame_info *info, struct task_struct *t,
-                      struct pt_regs *regs)
+                       struct unwind_frame_regs *regs)
  {
-       memset(info, 0, sizeof(struct unwind_frame_info));
+       if (unlikely(!info)) {
+               printk(KERN_ERR "%s: info == NULL\n", __FUNCTION__);
+               return;
+       }
+       memset(info, 0, sizeof(*info));
         info->t = t;
-       info->sp = regs->gr[30];
-       info->ip = regs->iaoq[0];
-       info->rp = regs->gr[2];
-       info->r31 = regs->gr[31];
+       info->sp = regs->sp;
+       info->ip = regs->ip;
+       info->rp = regs->rp;
+       info->r31 = regs->r31;

         dbg("(%d) Start unwind from sp=%08lx ip=%08lx\n",
             t ? (int)t->pid : -1, info->sp, info->ip);
@@ -342,22 +346,21 @@
  void unwind_frame_init_from_blocked_task(struct unwind_frame_info *info, struct task_struct *t)
  {
         struct pt_regs *r = &t->thread.regs;
-       struct pt_regs *r2;
+       struct unwind_frame_regs r2;

-       r2 = (struct pt_regs *)kmalloc(sizeof(struct pt_regs), GFP_KERNEL);
-       if (!r2)
-               return;
-       *r2 = *r;
-       r2->gr[30] = r->ksp;
-       r2->iaoq[0] = r->kpc;
-       unwind_frame_init(info, t, r2);
-       kfree(r2);
+       r2.sp  = r->ksp;
+       r2.ip  = r->kpc;
+       r2.rp  = r->gr[2];
+       r2.r31 = r->gr[31];
+       unwind_frame_init(info, t, &r2);
  }

+#if 0  /* FIXME: not used */
  void unwind_frame_init_running(struct unwind_frame_info *info, struct pt_regs *regs)
  {
         unwind_frame_init(info, current, regs);
  }
+#endif

  int unwind_once(struct unwind_frame_info *next_frame)
  {
--- arch/parisc/kernel/traps.c.Orig     2005-05-01 15:50:32.000000000 +0200
+++ arch/parisc/kernel/traps.c  2005-05-01 15:38:08.000000000 +0200
@@ -158,25 +158,35 @@
         printk("\n");
  }

+struct unwind_frame_regs ufi_regs_buf[UFI_REGS_BUF_MAX];
+unsigned int ufi_regs_buf_i = 0;
+
  void show_stack(struct task_struct *task, unsigned long *s)
  {
         struct unwind_frame_info info;
+       struct unwind_frame_regs *r;

         if (!task) {
+               if (ufi_regs_buf_i >= UFI_REGS_BUF_MAX) {
+                       printk(KERN_ERR "Can't %s().\n", __FUNCTION__);
+                       return;
+               }
+
                 unsigned long sp;
-               struct pt_regs *r;

  HERE:
                 asm volatile ("copy %%r30, %0" : "=r"(sp));
-               r = (struct pt_regs *)kmalloc(sizeof(struct pt_regs), GFP_KERNEL);
-               if (!r)
-                       return;
-               memset(r, 0, sizeof(struct pt_regs));
-               r->iaoq[0] = (unsigned long)&&HERE;
-               r->gr[2] = (unsigned long)__builtin_return_address(0);
-               r->gr[30] = sp;
+               r = &ufi_regs_buf[ufi_regs_buf_i++];
+               memset(r, 0, sizeof(*r));
+               r->ip = (unsigned long)&&HERE;
+               r->rp = (unsigned long)__builtin_return_address(0);
+               r->sp = sp;
                 unwind_frame_init(&info, current, r);
-               kfree(r);
+               ufi_regs_buf_i--;
+               if (ufi_regs_buf_i < 0) {
+                       printk(KERN_ERR "Wouldn't have reach here???\n");
+                       return;
+               }
         } else {
                 unwind_frame_init_from_blocked_task(&info, task);
         }
@@ -423,7 +433,10 @@
         {
                 /* show_stack(NULL, (unsigned long *)regs->gr[30]); */
                 struct unwind_frame_info info;
-               unwind_frame_init(&info, current, regs);
+               struct unwind_frame_regs r2;
+               r2.sp = regs->gr[30]; r2.ip = regs->iaoq[0];
+               r2.rp = regs->gr[2]; r2.r31 = regs->gr[31];
+               unwind_frame_init(&info, current, &r2);
                 do_show_stack(&info);
         }

====<>====

compile and boot fine on c110.

Thanks for additional advise,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
