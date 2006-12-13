From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] killing a set of user processes causes system reboot
Date: Wed, 13 Dec 2006 17:15:43 -0500 (EST)
Message-ID: <200612132215.kBDMFi63004518__7566.30736073038$1416624231$gmane$org@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
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

After a GCC build and check, I sometimes see some sleeping processes
that didn't terminate:

dave@hiauly6:~/gnu/gcc-4.2/objdir$ ps -ef|grep dave
dave      2496     1  0 12:04 ?        00:00:00 /home/dave/gnu/gcc-4.2/objdir/hppa-linux/libjava/testsuite/Process_3.exe
dave      2497     1  0 12:04 ?        00:00:00 /home/dave/gnu/gcc-4.2/objdir/hppa-linux/libjava/testsuite/Process_3.exe
dave      2498     1 39 12:04 ?        01:59:20 /home/dave/gnu/gcc-4.2/objdir/hppa-linux/libjava/testsuite/Process_3.exe
dave      2873     1  0 12:09 ?        00:00:00 /home/dave/gnu/gcc-4.2/objdir/hppa-linux/libjava/testsuite/Process_3.exe
dave      2874     1  0 12:09 ?        00:00:00 /home/dave/gnu/gcc-4.2/objdir/hppa-linux/libjava/testsuite/Process_3.exe
dave      2875     1 39 12:09 ?        01:56:30 /home/dave/gnu/gcc-4.2/objdir/hppa-linux/libjava/testsuite/Process_3.exe

If I kill them, the system reboots with no messages as to why:

root@hiauly6:/home/dave/gnu/gcc-4.2/objdir# kill -9 2496 2497 2498 2873 2874 2875

I had strace attached to one of the processes but it gave no info:
root@hiauly6:/home/dave# strace -p 2875
Process 2875 attached - interrupt to quit

I've seen this with 32-bit c3k kernel versions 2.6.18-rc7-pa1
and 2.6.19-g211c7899-dirty.

Thoughts?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
