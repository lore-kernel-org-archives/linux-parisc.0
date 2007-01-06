From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: [parisc-linux] sshd triggers Protection id trap
Date: Sat, 6 Jan 2007 03:34:22 +0100
Message-ID: <7d01f9f00701051834l4766fe0aya242c808bffbc407__36079.3217471384$1416624252$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
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

pa-ckers,

I booted git head on my A500. After a couple hours I tried login via
ssh. The client process got stuck after 3 unsuccessful attempts, so I
decided to take a look at the serial console.

sshd triggered a "code 27" (dump pointer follows).

After another attempt I could eventually log in again and thought this
"wasn't much" (so to speak). Then after a few more hours I realized
the loadavg on the machine was abnormally high. A sshd process was
taking 100% of CPU time. I tried to kill it (with SIGTERM first,
twice), and as it wouldn't terminate I issued a SIGKILL, which had the
very nice effect of taking down the whole machine, spitting endless
regdumps on the console (see the last dump of the following log).

The console log / short story is here:
http://www.pateam.org/archive/dumps/sshd-code27

As a side note, I just killed again that very same box trying to build
a kernel: disk was put offline after scsi reset or something (couldn't
gather more data at this point, will do that tomorrow. IIRC kyle is
experiencing that same bug though).

The last console output was a series of:
EXT3-fs error (device sdb6): ext3_find_entry: reading directory #98113 offset 0
sd 3:0:15:0: rejecting I/O to offline device

and then:
printk: 18 messages suppressed.
Buffer I/O error on device sdb5, logical block 821136
EXT3-fs error (device sdb5): ext3_readdir: directory #401876 contains
a hole at offset 0

For the records, this happened as I used (for the first time) ccache
on this particular build. My home folder lives on /dev/sdb6 which is
ext3. Previous kernel build worked fine (not using ccache), kernel
tree being on /dev/sda1 which is pure ext2. Have to wonder whether
SCSI or fs (or something else) is at fault here...

HTH

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
