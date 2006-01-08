From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [PATCH 5/5] Decrapify evdev.c of per-arch compat
	hacks
Date: Sun, 8 Jan 2006 14:38:11 -0500
Message-ID: <20060108193811.GL3782__41882.8173111708$1416623986$gmane$org@tachyon.int.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-input@atrey.karlin.mff.cuni.cz,
 willy@parisc-linux.org,
 carlos@parisc-linux.org,
 linux-kernel@vger.kernel.org,
 parisc-linux@lists.parisc-linux.org
To: akpm@osdl.org
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

From: Kyle McMartin <kyle@parisc-linux.org>

A nice cleanup of evdev.c by using the is_compat_task() macro.

Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

---

 drivers/input/evdev.c |   18 +++---------------
 1 files changed, 3 insertions(+), 15 deletions(-)

3e7a8822763c01f93afdb2f0011dec6b641df1fb
diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index f7490a0..3cabb4b 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -154,27 +154,15 @@ struct input_event_compat {
 	__s32 value;
 };
 
-#ifdef CONFIG_X86_64
-#  define COMPAT_TEST test_thread_flag(TIF_IA32)
-#elif defined(CONFIG_IA64)
-#  define COMPAT_TEST IS_IA32_PROCESS(ia64_task_regs(current))
-#elif defined(CONFIG_S390)
-#  define COMPAT_TEST test_thread_flag(TIF_31BIT)
-#elif defined(CONFIG_MIPS)
-#  define COMPAT_TEST (current->thread.mflags & MF_32BIT_ADDR)
-#else
-#  define COMPAT_TEST test_thread_flag(TIF_32BIT)
-#endif
-
 static inline size_t evdev_event_size(void)
 {
-	return COMPAT_TEST ?
+	return is_compat_task(current) ?
 		sizeof(struct input_event_compat) : sizeof(struct input_event);
 }
 
 static int evdev_event_from_user(const char __user *buffer, struct input_event *event)
 {
-	if (COMPAT_TEST) {
+	if (is_compat_task(current)) {
 		struct input_event_compat compat_event;
 
 		if (copy_from_user(&compat_event, buffer, sizeof(struct input_event_compat)))
@@ -196,7 +184,7 @@ static int evdev_event_from_user(const c
 
 static int evdev_event_to_user(char __user *buffer, const struct input_event *event)
 {
-	if (COMPAT_TEST) {
+	if (is_compat_task(current)) {
 		struct input_event_compat compat_event;
 
 		compat_event.time.tv_sec = event->time.tv_sec;
-- 
1.0.7

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
