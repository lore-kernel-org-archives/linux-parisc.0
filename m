From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: linux signal race fixes,
	patches against hppa tree, please te
Date: Wed, 1 Sep 2004 16:08:47 -0400 (EDT)
Message-ID: <200409012008.i81K8mGw011839@hiauly1.hia.nrc.ca>
References: <200408312043.i7VKhBDp005965@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: James.Bottomley@steeleye.com,
 parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200408312043.i7VKhBDp005965@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Aug 31, 2004 04:43:11 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Randolph,

> > I've been running this now for three days on hiauly6 with a 32-bit
> > 2.6.8.1-pa7 kernel (default c3000 config) doing almost continuous gcc
> > builds.  Things seem pretty promising.  No random SIGSEGVs and expect
> > seems to be behaving itself.
> 
> As usual, I have to eat my words.  The libjava "PR218 -O3 execution -
> source compiled test" hung in the libjava testsuite on the next gcc
> build.  Looking at libjava.log, I see that there is no "WARNING:
> program timed out." message for this test.  Thus, the alarm signal
> for this test somehow got lost.  The testsuite continued after I
> killed PR218.exe.

Ok, the next time around on gsyprf11 expect did a SIGSEGV after the
exact same test.  The timeout warning was printed in the log this time.

The core dump, core.20875, is in my home directory.  The expect
program is /home/dave/opt/gnu/bin/expect.  I can see that expect
died because %r4 has apparently gotten clobbered.  It contains
0.  %r4 was used to restore the pic register after the last call.
We then die in a stub that uses the pic register.

Is there any chance you could look at fixing the backtrace command
in gdb?  Here is the bt:

(gdb) bt
#0  0x406a0ef4 in NativePathInFilesystem () from /usr/lib/libtcl8.4.so.0
#1  0x406d5be4 in Tcl_WaitForEvent () from /usr/lib/libtcl8.4.so.0
#2  0x00000000 in ?? ()
#3  0x00000000 in ?? ()
(gdb) maint print unwind 0x406d5be4
unwind_table_entry (0x6a6744):
        region_start = 0x406d59b0 <Tcl_WaitForEvent+784>
	region_end = 0x406d5e0c <Tcl_WaitForEvent+1900>
	flags = Save_RP
	Region_description = 0x1
	Entry_FR = 0x0
	Entry_GR = 0x10
	Total_frame_size = 0x48
(gdb) disass 0x406a0ee4 0x406a0f04
Dump of assembler code from 0x406a0ee4 to 0x406a0f04:
0x406a0ee4 <NativePathInFilesystem+1668>:       ldw 518(,r1),r21
0x406a0ee8 <NativePathInFilesystem+1672>:       bv r0(r21)
0x406a0eec <NativePathInFilesystem+1676>:       ldw 51c(,r1),r19
0x406a0ef0 <NativePathInFilesystem+1680>:       addil -1800,r19,%r1
0x406a0ef4 <NativePathInFilesystem+1684>:       ldw 320(,r1),r21
0x406a0ef8 <NativePathInFilesystem+1688>:       bv r0(r21)
0x406a0efc <NativePathInFilesystem+1692>:       ldw 324(,r1),r19
0x406a0f00 <NativePathInFilesystem+1696>:       addil -1800,r19,%r1
(gdb) disass 0x406d5bc4 0x406d5bf4
Dump of assembler code from 0x406d5bc4 to 0x406d5bf4:
0x406d5bc4 <Tcl_WaitForEvent+1316>:     stw r8,-34(,sp)
0x406d5bc8 <Tcl_WaitForEvent+1320>:     copy r4,r19
0x406d5bcc <Tcl_WaitForEvent+1324>:     copy r5,r26
0x406d5bd0 <Tcl_WaitForEvent+1328>:     ldo -238(sp),r25
0x406d5bd4 <Tcl_WaitForEvent+1332>:     ldo -1b8(sp),r24
0x406d5bd8 <Tcl_WaitForEvent+1336>:     ldo -138(sp),r23
0x406d5bdc <Tcl_WaitForEvent+1340>:     b,l 0x406a2394 <NativePathInFilesystem+6
964>,rp
0x406d5be0 <Tcl_WaitForEvent+1344>:     ldi 60,r7
0x406d5be4 <Tcl_WaitForEvent+1348>:     cmpib,= -1,ret0,0x406d5b24 <Tcl_WaitForE
vent+1156>
0x406d5be8 <Tcl_WaitForEvent+1352>:     copy r4,r19
0x406d5bec <Tcl_WaitForEvent+1356>:     b,l 0x406a0ef0 <NativePathInFilesystem+1
680>,rp
0x406d5bf0 <Tcl_WaitForEvent+1360>:     copy r14,r26
(gdb) p/x $rp
$1 = 0x406d5bf7
(gdb) disass 0x406a2394 0x406a23a4
Dump of assembler code from 0x406a2394 to 0x406a23a4:
0x406a2394 <NativePathInFilesystem+6964>:       addil -800,r19,%r1
0x406a2398 <NativePathInFilesystem+6968>:       ldw a0(,r1),r21
0x406a239c <NativePathInFilesystem+6972>:       bv r0(r21)

I'm not quite sure how we got to the point of the segfault.  However,
with respect to gdb, the back trace uses the wrong function symbol
in both frames 0 and 1.  We are in a stub in frame 0.  I'm fairly
sure that this is why the bt fails at frame 2.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
