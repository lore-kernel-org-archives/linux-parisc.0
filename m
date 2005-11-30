From: Randolph Chung <randolph@tausq.org>
Subject: Re: Strange compiler behavior
Date: Wed, 30 Nov 2005 17:28:36 +0800
Message-ID: <438D70C4.4080003__48294.2399722107$1416624568$gmane$org@tausq.org>
References: <438D64F0.7080307@albacom.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux <parisc-linux@parisc-linux.org>,
 debian-hppa@lists.debian.org
To: Fabio Bizzi <bizzi@albacom.net>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <438D64F0.7080307@albacom.net>
Resent-Message-ID: <sFhvVD.A.U2F.6SXjDB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

> But if I miss a couple of include dir I have a correct error generation
> and a strange message in /var/log/debug , the uncorrect compile string is:

Looks like you found a gcc bug. What happened is that g++ crashed
(SIGSEGV) while processing your file.

It seems to be only in g++-3.3. I tried with g++-3.3 and g++-4.0.2 and
can not reproduce the problem.

The limited stack trace is:

Program received signal SIGSEGV, Segmentation fault.
0x000255fc in pop_everything ()
(gdb) bt
#0  0x000255fc in pop_everything ()
#1  0x0002f834 in cxx_insert_default_attributes ()
#2  0x00072688 in cxx_make_type ()
#3  0x000b7870 in c_common_parse_file ()
#4  0x0022bb8c in rtx_addr_varies_p ()
#5  0x00231224 in rtx_addr_varies_p ()
#6  0x002312e8 in rtx_addr_varies_p ()
#7  0x401ee6e4 in __libc_start_main () from /lib/libc.so.6
#8  0x00016a58 in ?? ()
(gdb) x/i $pc
0x255fc <pop_everything+808>:   ldw ec(,r20),r3
(gdb) print /x $r20
$1 = 0x0

Perhaps you can try a newer gcc, or file a bug upstream with the gcc
developers. See http://gcc.gnu.org/bugs.html

randolph


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
