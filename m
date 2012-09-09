From: John David Anglin <dave.anglin@bell.net>
Subject: Thread stack allocation
Date: Sun, 9 Sep 2012 13:52:08 -0400
Message-ID: <BLU0-SMTP405E1823EA93DF4FBFC1797AD0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Carlos,

This weekend I decided to try build openjdk-6-6b24-1.11.4.  After a  
bit of hacking
to configure, I researched a point where the build fails with a  
segmentation fault:

/bin/sh: line 6: 27423 Segmentation fault      (core dumped) /home/ 
dave/debian/openjdk-6/openjdk-6-6b24-1.11.4/build/bootstrap/jdk1.6.0/ 
bin/java -version
/home/dave/debian/openjdk-6/openjdk-6-6b24-1.11.4/build/bootstrap/ 
jdk1.6.0/bin/java cannot be found or is corrupted.

The program fails here:
Program received signal SIGSEGV, Segmentation fault.
0x40ae4868 in ClassLoader::load_zip_library ()
     at /home/dave/debian/openjdk-6/openjdk-6-6b24-1.11.4/build/ 
openjdk-ecj/hotspot/src/share/vm/classfile/classLoader.cpp:599
599	void ClassLoader::load_zip_library() {
(gdb) p/x $sp
$12 = 0x40755a40

(gdb) disass $pc-16,$pc+16
Dump of assembler code from 0x40ae4858 to 0x40ae4878:
    0x40ae4858 <ClassLoader::print_bootclasspath()+188>:	ldw,mb  
-80(sp),r7
    0x40ae485c <ClassLoader::print_bootclasspath()+192>:	nop
    0x40ae4860 <ClassLoader::load_zip_library()+0>:	stw rp,-14(sp)
    0x40ae4864 <ClassLoader::load_zip_library()+4>:	ldo 1480(sp),sp
=> 0x40ae4868 <ClassLoader::load_zip_library()+8>:	stw r4,-68(sp)
    0x40ae486c <ClassLoader::load_zip_library()+12>:	stw r19,-20(sp)
    0x40ae4870 <ClassLoader::load_zip_library()+16>:	stw r7,-74(sp)
    0x40ae4874 <ClassLoader::load_zip_library()+20>:	stw r6,-70(sp)
End of assembler dump.
(gdb) p/x $sp-0x68
$20 = 0x407559d8

(gdb) bt
#0  0x40ae4868 in ClassLoader::load_zip_library ()
     at /home/dave/debian/openjdk-6/openjdk-6-6b24-1.11.4/build/ 
openjdk-ecj/hotspot/src/share/vm/classfile/classLoader.cpp:599
#1  0x40ae6928 in ClassLoader::initialize ()
     at /home/dave/debian/openjdk-6/openjdk-6-6b24-1.11.4/build/ 
openjdk-ecj/hotspot/src/share/vm/classfile/classLoader.cpp:1019
#2  0x40bb4060 in init_globals ()
     at /home/dave/debian/openjdk-6/openjdk-6-6b24-1.11.4/build/ 
openjdk-ecj/hotspot/src/share/vm/runtime/init.cpp:94
#3  0x40d85044 in Threads::create_vm (args=<optimized out>,
     canTryAgain=0x407542c8)
     at /home/dave/debian/openjdk-6/openjdk-6-6b24-1.11.4/build/ 
openjdk-ecj/hotspot/src/share/vm/runtime/thread.cpp:3092

When the thread is initially entered, we have:
[New Thread 0x408d3480 (LWP 22180)]
[Switching to Thread 0x408d3480 (LWP 22180)]

Breakpoint 1, Threads::create_vm (args=<optimized out>,  
canTryAgain=0x407542c8)
     at /home/dave/debian/openjdk-6/openjdk-6-6b24-1.11.4/build/ 
openjdk-ecj/hotspot/src/share/vm/runtime/thread.cpp:3092
3092	  jint status = init_globals();
(gdb) p/x $sp
$26 = 0x407544c0

The thread is created in this bit of code:
int
ContinueInNewThread(int (JNICALL *continuation)(void *), jlong  
stack_size, void * args, int ret) {
     int rslt;
#ifdef __linux__
     pthread_t tid;
     pthread_attr_t attr;
     pthread_attr_init(&attr);
     pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE);

     if (stack_size > 0) {
       pthread_attr_setstacksize(&attr, stack_size);
     }

     if (pthread_create(&tid, &attr, (void *(*)(void*))continuation,  
(void*)args) == 0) {
       void * tmp;
       pthread_join(tid, &tmp);
       rslt = (int)tmp;

in "openjdk-ecj/jdk/src/solaris/bin/java_md.c".

The stack_size value is 0x180000 (1572864).  I checked that  
pthread_attr_setstacksize
is called and doesn't fail.  However, pthread_create only allocates a  
stack with PTHREAD_STACK_MIN
(16384) bytes:
dave@mx3210:/proc/21515$ cat maps
00010000-00019000 r-xp 00000000 08:07  
385654                             /home/dave/debian/openjdk-6/ 
openjdk-6-6b24-1.11.4/build/openjdk.build-ecj/j2sdk-image/bin/java
00019000-0001a000 rwxp 00009000 08:07  
385654                             /home/dave/debian/openjdk-6/ 
openjdk-6-6b24-1.11.4/build/openjdk.build-ecj/j2sdk-image/bin/java
0001a000-0003b000 rwxp 00000000 00:00  
0                                  [heap]
40000000-40010000 rw-p 00000000 00:00 0
40010000-40011000 r--p 00000000 00:00 0
40011000-40014000 rw-p 00000000 00:00 0
40145000-4015b000 r-xp 00000000 08:05  
153472                             /usr/lib/hppa-linux-gnu/libz.so.1.2.6
4015b000-4015c000 rwxp 00016000 08:05  
153472                             /usr/lib/hppa-linux-gnu/libz.so.1.2.6
401de000-401ff000 r-xp 00000000 08:05  
112978                             /lib/hppa-linux-gnu/ld-2.13.so
401ff000-40203000 rwxp 00021000 08:05  
112978                             /lib/hppa-linux-gnu/ld-2.13.so
402ab000-402bb000 r-xp 00000000 08:05  
24345                              /lib/hppa-linux-gnu/libgcc_s.so.4
402bb000-402bc000 rwxp 00010000 08:05  
24345                              /lib/hppa-linux-gnu/libgcc_s.so.4
402c8000-402d5000 r-xp 00000000 08:07  
346778                             /home/dave/debian/openjdk-6/ 
openjdk-6-6b24-1.11.4/build/openjdk.build-ecj/j2sdk-image/jre/lib/ 
parisc/libverify.so
402d5000-402d6000 rwxp 0000d000 08:07  
346778                             /home/dave/debian/openjdk-6/ 
openjdk-6-6b24-1.11.4/build/openjdk.build-ecj/j2sdk-image/jre/lib/ 
parisc/libverify.so
40315000-4031d000 r-xp 00000000 08:05  
112976                             /lib/hppa-linux-gnu/ 
libnss_compat-2.13.so
4031d000-4031e000 rwxp 00008000 08:05  
112976                             /lib/hppa-linux-gnu/ 
libnss_compat-2.13.so
4034e000-40352000 r-xp 00000000 08:07  
384388                             /home/dave/debian/openjdk-6/ 
openjdk-6-6b24-1.11.4/build/openjdk.build-ecj/j2sdk-image/jre/lib/ 
parisc/jli/libjli.so
40352000-40353000 rwxp 00004000 08:07  
384388                             /home/dave/debian/openjdk-6/ 
openjdk-6-6b24-1.11.4/build/openjdk.build-ecj/j2sdk-image/jre/lib/ 
parisc/jli/libjli.so
4036e000-40385000 r-xp 00000000 08:05  
112967                             /lib/hppa-linux-gnu/libnsl-2.13.so
40385000-40386000 rwxp 00017000 08:05  
112967                             /lib/hppa-linux-gnu/libnsl-2.13.so
40386000-40389000 rwxp 00000000 00:00 0
403e8000-403f0000 r-xp 00000000 08:05  
113001                             /lib/hppa-linux-gnu/librt-2.13.so
403f0000-403f1000 rwxp 00008000 08:05  
113001                             /lib/hppa-linux-gnu/librt-2.13.so
403f5000-40412000 r-xp 00000000 08:05  
112947                             /lib/hppa-linux-gnu/ 
libpthread-2.13.so
40412000-40413000 rwxp 0001d000 08:05  
112947                             /lib/hppa-linux-gnu/ 
libpthread-2.13.so
40413000-40415000 rwxp 00000000 00:00 0
404d8000-40557000 r-xp 00000000 08:05  
112997                             /lib/hppa-linux-gnu/libm-2.13.so
40557000-4055a000 rwxp 0007f000 08:05  
112997                             /lib/hppa-linux-gnu/libm-2.13.so
405e5000-405e8000 r-xp 00000000 08:05  
112993                             /lib/hppa-linux-gnu/libdl-2.13.so
405e8000-405e9000 rwxp 00003000 08:05  
112993                             /lib/hppa-linux-gnu/libdl-2.13.so
405eb000-4074b000 r-xp 00000000 08:05  
112951                             /lib/hppa-linux-gnu/libc-2.13.so
4074b000-40751000 rwxp 00160000 08:05  
112951                             /lib/hppa-linux-gnu/libc-2.13.so
40751000-40755000 rwxp 00000000 00:00  
0                                  [stack:22180]
40755000-40758000 ---p 00000000 00:00 0
40758000-408d2000 rwxp 00000000 00:00 0
408d2000-408d3000 ---p 00000000 00:00 0
408d3000-408d4000 rwxp 00000000 00:00 0
4094b000-4097a000 r-xp 00000000 08:07  
346767                             /home/dave/debian/openjdk-6/ 
openjdk-6-6b24-1.11.4/build/openjdk.build-ecj/j2sdk-image/jre/lib/ 
parisc/libjava.so
4097a000-4097d000 rwxp 0002f000 08:07  
346767                             /home/dave/debian/openjdk-6/ 
openjdk-6-6b24-1.11.4/build/openjdk.build-ecj/j2sdk-image/jre/lib/ 
parisc/libjava.so
409f2000-40e4b000 r-xp 00000000 08:07  
376216                             /home/dave/debian/openjdk-6/ 
openjdk-6-6b24-1.11.4/build/openjdk.build-ecj/j2sdk-image/jre/lib/ 
parisc/server/libjvm.so
40e4b000-40e78000 rwxp 00459000 08:07  
376216                             /home/dave/debian/openjdk-6/ 
openjdk-6-6b24-1.11.4/build/openjdk.build-ecj/j2sdk-image/jre/lib/ 
parisc/server/libjvm.so
40e78000-40e85000 rwxp 00000000 00:00 0
40f68000-40f73000 r-xp 00000000 08:05  
24357                              /lib/hppa-linux-gnu/ 
libnss_nis-2.13.so
40f73000-40f74000 rwxp 0000b000 08:05  
24357                              /lib/hppa-linux-gnu/ 
libnss_nis-2.13.so
41005000-4100d000 rw-s 00000000 08:05  
217840                             /tmp/hsperfdata_dave/21515
41268000-41351000 r-xp 00000000 08:05  
306529                             /usr/lib/hppa-linux-gnu/libstdc+ 
+.so.6.0.17
41351000-41358000 rwxp 000e9000 08:05  
306529                             /usr/lib/hppa-linux-gnu/libstdc+ 
+.so.6.0.17
41358000-4135f000 rwxp 00000000 00:00 0
41362000-4136f000 r-xp 00000000 08:05  
112987                             /lib/hppa-linux-gnu/ 
libnss_files-2.13.so
4136f000-41370000 rwxp 0000d000 08:05  
112987                             /lib/hppa-linux-gnu/ 
libnss_files-2.13.so
fbf00000-fbf22000 rwxp 00000000 00:00  
0                                  [stack]

This is the cause of the segv.

Thoughts?

Dave
--
John David Anglin	dave.anglin@bell.net



