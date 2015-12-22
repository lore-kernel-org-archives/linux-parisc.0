From: Helge Deller <deller@gmx.de>
Subject: Re: ptrace interface does not permit modification of syscall return
Date: Tue, 22 Dec 2015 22:10:56 +0100
Message-ID: <5679BC60.5090107@gmx.de>
References: <20151221175558.GA11489@vapier.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060507090003090802010103"
To: linux-parisc@vger.kernel.org, vapier@gentoo.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20151221175558.GA11489@vapier.lan>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------060507090003090802010103
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Mike,

On 21.12.2015 18:55, Mike Frysinger wrote:
> i have a ptrace program that watches for specific syscalls and when
> matched, will:
>  - on entry change the syscall nr to -1 (so the kernel will skip it)
>  - on exit change the return to -EPERM so the userspace sees a denial
> 
> i have this working on most arches (x86, x86_64, arm, alpha, ia64, etc...).
> on parisc, the kernel (using 3.18.7 currently) appears to be wrong.  in my
> tests, if i don't mess with the syscall nr, i can change the return value
> fine (to EPERM or whatever).  but the syscall executed which i do not want.
> if i change the syscall to -1, then i can't change the return value (so the
> child sees ENOSYS), but the kernel still executes the original syscall.
> 
> i have a simple test case attached to show the issue.  the code does:
>  - spawn a child with the parent tracing it
>  - child will do:
>   - dupe stderr to another fd
>   - unlink a file named ".test.flag"
>   - write a message through the new fd
>   - close a magic # so the parent knows to start denying
>     - should see EPERM but it sees ENOSYS
>   - close the new fd
>     - should see EPERM but it is closed!
>   - write to the new fd
>     - should work, but the fd is closed
>   - call create on ".test.flag"
>     - should see EPERM, but the file is created!
>  - parent will do:
>   - log the syscalls until child runs close(-12345)
>   - the parent will then try to deny all close/creat calls
>   - uses PTRACE_POKEUSER w/PT_GR20 to set syscall to -1
>   - uses PTRACE_POKEUSER w/PT_GR28 to set return to -EPERM
> 
> you can run the test case by doing:
> $ gcc test.c && ./a.out

I agree, something is fishy :-)

I did some tests with your testcase.
First problem I had was, that compiling failed since it didn't found the asm/offset.h header file.
Which one did you used? I know it usually should come with the kernel headers, but there it is asm-offsets.h.
If you used debian, which package did you installed?

Instead I used asm-offsets.h.
First problem: I had to install the 64bit header file. PT_GR20 in this one was much higher than it should be for 32bit userspace.

So, I used those defines (taken from the strace source package):
#define PT_GR20 (20*4)
#define PT_GR26 (26*4)
#define PT_GR28 (28*4)
#define PT_IAOQ0 (106*4)
#define PT_IAOQ1 (107*4)

With that I got those output:
root@c3000:~# ./a.out
a.out: parent waiting for child (pid=1344) to signal: Success
a.out: child setting up ...
a.out: parent: waiting for exec; status: 0x1a7f
a.out: parent: waiting for exec; status: 0x857f
a.out: parent: hit exec!
a.out: parent: NR: 45 brk
a.out: parent: NR: 59 uname
a.out: parent: NR: 33 access
a.out: parent: NR: 90 mmap
a.out: parent: NR: 33 access
a.out: parent: NR:  5 open
a.out: parent: NR:112 fstat64
a.out: parent: NR: 90 mmap
a.out: parent: NR:  6 close
a.out: parent: NR: 33 access
a.out: parent: NR:  5 open
a.out: parent: NR:  3 read
a.out: parent: NR:112 fstat64
a.out: parent: NR: 90 mmap
a.out: parent: NR: 90 mmap
a.out: parent: NR: 90 mmap
a.out: parent: NR:  6 close
a.out: parent: NR: 90 mmap
a.out: parent: NR:125 mprotect
a.out: parent: NR: 90 mmap
a.out: parent: NR:125 mprotect
a.out: parent: NR: 91 munmap
a.out: parent: NR: 41 dup
a.out: parent: NR: 10 
a.out: parent: NR:  4 write
child: you should see two of these
a.out: parent: NR:  6 close
a.out: parent: setting NR to -1
a.out: parent: forcing EPERM
child: close marker (should be EPERM): Function not implemented
a.out: parent: NR:  4 write
a.out: parent: NR:  6 close
a.out: parent: setting NR to -1
a.out: parent: forcing EPERM
child: real close (should be EPERM): Success
a.out: parent: NR:  4 write
a.out: parent: NR:  4 write
child: write (should be success): Bad file descriptor
a.out: parent: NR:  4 write
a.out: parent: NR:  8 creat
a.out: parent: setting NR to -1
a.out: parent: forcing EPERM
child: creat (should be EPERM): Success
a.out: parent: NR:  4 write
a.out: parent: NR: 33 access
child: access (should be ENOENT): Success
a.out: parent: NR:  4 write
a.out: parent: NR: 10 

Seems not like what it should be.
I need to look closer at it during the next few days.

Regarding on how to get correct 32bit PT_REG #defines/values even on 64bit kernel,
maybe the attached patch is a way to go.

Helge

--------------060507090003090802010103
Content-Type: text/x-diff;
 name="pt_reg_32bit.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="pt_reg_32bit.patch"

diff --git a/arch/parisc/include/uapi/asm/ptrace.h b/arch/parisc/include/uapi/asm/ptrace.h
index c4fa6c8..1f2f892 100644
--- a/arch/parisc/include/uapi/asm/ptrace.h
+++ b/arch/parisc/include/uapi/asm/ptrace.h
@@ -33,6 +33,26 @@ struct pt_regs {
 	unsigned long ipsw;	/* CR22 */
 };
 
+#if defined(__LP64__)
+struct compat_pt_regs {
+	unsigned int gr[32];	/* PSW is in gr[0] */
+	__u64 fr[32];
+	unsigned int sr[ 8];
+	unsigned int iasq[2];
+	unsigned int iaoq[2];
+	unsigned int cr27;
+	unsigned int pad0;     /* available for other uses */
+	unsigned int orig_r28;
+	unsigned int ksp;
+	unsigned int kpc;
+	unsigned int sar;	/* CR11 */
+	unsigned int iir;	/* CR19 */
+	unsigned int isr;	/* CR20 */
+	unsigned int ior;	/* CR21 */
+	unsigned int ipsw;	/* CR22 */
+};
+#endif
+
 /*
  * The numbers chosen here are somewhat arbitrary but absolutely MUST
  * not overlap with any of the number assigned in <linux/ptrace.h>.
diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
index d2f6257..e2a8030 100644
--- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -240,6 +240,96 @@ int main(void)
 	DEFINE(PT_SIZE, sizeof(struct pt_regs));
 	/* PT_SZ_ALGN includes space for a stack frame. */
 	DEFINE(PT_SZ_ALGN, align_frame(sizeof(struct pt_regs), FRAME_ALIGN));
+#ifdef CONFIG_64BIT
+	COMMENT("for 32bit userspace:");
+	DEFINE(PT_32_PSW, offsetof(struct compat_pt_regs, gr[ 0]));
+	DEFINE(PT_32_GR1, offsetof(struct compat_pt_regs, gr[ 1]));
+	DEFINE(PT_32_GR2, offsetof(struct compat_pt_regs, gr[ 2]));
+	DEFINE(PT_32_GR3, offsetof(struct compat_pt_regs, gr[ 3]));
+	DEFINE(PT_32_GR4, offsetof(struct compat_pt_regs, gr[ 4]));
+	DEFINE(PT_32_GR5, offsetof(struct compat_pt_regs, gr[ 5]));
+	DEFINE(PT_32_GR6, offsetof(struct compat_pt_regs, gr[ 6]));
+	DEFINE(PT_32_GR7, offsetof(struct compat_pt_regs, gr[ 7]));
+	DEFINE(PT_32_GR8, offsetof(struct compat_pt_regs, gr[ 8]));
+	DEFINE(PT_32_GR9, offsetof(struct compat_pt_regs, gr[ 9]));
+	DEFINE(PT_32_GR10, offsetof(struct compat_pt_regs, gr[10]));
+	DEFINE(PT_32_GR11, offsetof(struct compat_pt_regs, gr[11]));
+	DEFINE(PT_32_GR12, offsetof(struct compat_pt_regs, gr[12]));
+	DEFINE(PT_32_GR13, offsetof(struct compat_pt_regs, gr[13]));
+	DEFINE(PT_32_GR14, offsetof(struct compat_pt_regs, gr[14]));
+	DEFINE(PT_32_GR15, offsetof(struct compat_pt_regs, gr[15]));
+	DEFINE(PT_32_GR16, offsetof(struct compat_pt_regs, gr[16]));
+	DEFINE(PT_32_GR17, offsetof(struct compat_pt_regs, gr[17]));
+	DEFINE(PT_32_GR18, offsetof(struct compat_pt_regs, gr[18]));
+	DEFINE(PT_32_GR19, offsetof(struct compat_pt_regs, gr[19]));
+	DEFINE(PT_32_GR20, offsetof(struct compat_pt_regs, gr[20]));
+	DEFINE(PT_32_GR21, offsetof(struct compat_pt_regs, gr[21]));
+	DEFINE(PT_32_GR22, offsetof(struct compat_pt_regs, gr[22]));
+	DEFINE(PT_32_GR23, offsetof(struct compat_pt_regs, gr[23]));
+	DEFINE(PT_32_GR24, offsetof(struct compat_pt_regs, gr[24]));
+	DEFINE(PT_32_GR25, offsetof(struct compat_pt_regs, gr[25]));
+	DEFINE(PT_32_GR26, offsetof(struct compat_pt_regs, gr[26]));
+	DEFINE(PT_32_GR27, offsetof(struct compat_pt_regs, gr[27]));
+	DEFINE(PT_32_GR28, offsetof(struct compat_pt_regs, gr[28]));
+	DEFINE(PT_32_GR29, offsetof(struct compat_pt_regs, gr[29]));
+	DEFINE(PT_32_GR30, offsetof(struct compat_pt_regs, gr[30]));
+	DEFINE(PT_32_GR31, offsetof(struct compat_pt_regs, gr[31]));
+	DEFINE(PT_32_FR0, offsetof(struct compat_pt_regs, fr[ 0]));
+	DEFINE(PT_32_FR1, offsetof(struct compat_pt_regs, fr[ 1]));
+	DEFINE(PT_32_FR2, offsetof(struct compat_pt_regs, fr[ 2]));
+	DEFINE(PT_32_FR3, offsetof(struct compat_pt_regs, fr[ 3]));
+	DEFINE(PT_32_FR4, offsetof(struct compat_pt_regs, fr[ 4]));
+	DEFINE(PT_32_FR5, offsetof(struct compat_pt_regs, fr[ 5]));
+	DEFINE(PT_32_FR6, offsetof(struct compat_pt_regs, fr[ 6]));
+	DEFINE(PT_32_FR7, offsetof(struct compat_pt_regs, fr[ 7]));
+	DEFINE(PT_32_FR8, offsetof(struct compat_pt_regs, fr[ 8]));
+	DEFINE(PT_32_FR9, offsetof(struct compat_pt_regs, fr[ 9]));
+	DEFINE(PT_32_FR10, offsetof(struct compat_pt_regs, fr[10]));
+	DEFINE(PT_32_FR11, offsetof(struct compat_pt_regs, fr[11]));
+	DEFINE(PT_32_FR12, offsetof(struct compat_pt_regs, fr[12]));
+	DEFINE(PT_32_FR13, offsetof(struct compat_pt_regs, fr[13]));
+	DEFINE(PT_32_FR14, offsetof(struct compat_pt_regs, fr[14]));
+	DEFINE(PT_32_FR15, offsetof(struct compat_pt_regs, fr[15]));
+	DEFINE(PT_32_FR16, offsetof(struct compat_pt_regs, fr[16]));
+	DEFINE(PT_32_FR17, offsetof(struct compat_pt_regs, fr[17]));
+	DEFINE(PT_32_FR18, offsetof(struct compat_pt_regs, fr[18]));
+	DEFINE(PT_32_FR19, offsetof(struct compat_pt_regs, fr[19]));
+	DEFINE(PT_32_FR20, offsetof(struct compat_pt_regs, fr[20]));
+	DEFINE(PT_32_FR21, offsetof(struct compat_pt_regs, fr[21]));
+	DEFINE(PT_32_FR22, offsetof(struct compat_pt_regs, fr[22]));
+	DEFINE(PT_32_FR23, offsetof(struct compat_pt_regs, fr[23]));
+	DEFINE(PT_32_FR24, offsetof(struct compat_pt_regs, fr[24]));
+	DEFINE(PT_32_FR25, offsetof(struct compat_pt_regs, fr[25]));
+	DEFINE(PT_32_FR26, offsetof(struct compat_pt_regs, fr[26]));
+	DEFINE(PT_32_FR27, offsetof(struct compat_pt_regs, fr[27]));
+	DEFINE(PT_32_FR28, offsetof(struct compat_pt_regs, fr[28]));
+	DEFINE(PT_32_FR29, offsetof(struct compat_pt_regs, fr[29]));
+	DEFINE(PT_32_FR30, offsetof(struct compat_pt_regs, fr[30]));
+	DEFINE(PT_32_FR31, offsetof(struct compat_pt_regs, fr[31]));
+	DEFINE(PT_32_SR0, offsetof(struct compat_pt_regs, sr[ 0]));
+	DEFINE(PT_32_SR1, offsetof(struct compat_pt_regs, sr[ 1]));
+	DEFINE(PT_32_SR2, offsetof(struct compat_pt_regs, sr[ 2]));
+	DEFINE(PT_32_SR3, offsetof(struct compat_pt_regs, sr[ 3]));
+	DEFINE(PT_32_SR4, offsetof(struct compat_pt_regs, sr[ 4]));
+	DEFINE(PT_32_SR5, offsetof(struct compat_pt_regs, sr[ 5]));
+	DEFINE(PT_32_SR6, offsetof(struct compat_pt_regs, sr[ 6]));
+	DEFINE(PT_32_SR7, offsetof(struct compat_pt_regs, sr[ 7]));
+	DEFINE(PT_32_IASQ0, offsetof(struct compat_pt_regs, iasq[0]));
+	DEFINE(PT_32_IASQ1, offsetof(struct compat_pt_regs, iasq[1]));
+	DEFINE(PT_32_IAOQ0, offsetof(struct compat_pt_regs, iaoq[0]));
+	DEFINE(PT_32_IAOQ1, offsetof(struct compat_pt_regs, iaoq[1]));
+	DEFINE(PT_32_CR27, offsetof(struct compat_pt_regs, cr27));
+	DEFINE(PT_32_ORIG_R28, offsetof(struct compat_pt_regs, orig_r28));
+	DEFINE(PT_32_KSP, offsetof(struct compat_pt_regs, ksp));
+	DEFINE(PT_32_KPC, offsetof(struct compat_pt_regs, kpc));
+	DEFINE(PT_32_SAR, offsetof(struct compat_pt_regs, sar));
+	DEFINE(PT_32_IIR, offsetof(struct compat_pt_regs, iir));
+	DEFINE(PT_32_ISR, offsetof(struct compat_pt_regs, isr));
+	DEFINE(PT_32_IOR, offsetof(struct compat_pt_regs, ior));
+	DEFINE(PT_32_SIZE, sizeof(struct compat_pt_regs));
+	/* PT_32_SZ_ALGN includes space for a stack frame. */
+	DEFINE(PT_32_SZ_ALGN, align_frame(sizeof(struct compat_pt_regs), FRAME_ALIGN));
+#endif
 	BLANK();
 	DEFINE(TI_TASK, offsetof(struct thread_info, task));
 	DEFINE(TI_FLAGS, offsetof(struct thread_info, flags));

--------------060507090003090802010103--
