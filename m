From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] ptrace, and interrupted syscall.
Date: Mon, 27 Sep 2004 23:11:16 -0400
Message-ID: <20040928031116.GE27033@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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


pa,

rt_sigreturn(0x404dbee0)                = -1 EINTR (Interrupted system call)
write(1, "waitid(0x1, 0x54a, 0xbff00b50, 0"..., 36waitid(0x1, 0x54a, 0xbff00b50, 0xd)) = 36
SYS_235(0x1, 0x54a, 0xbff00b50, 0xd, 0x40435c18) = -1 EFAULT (Bad address)

Any clue why the syscall restart has 5 options where the syscall itself
has only 4 parameters?

Above you see SYS_235, which is the # for the waitid. The EFAULT is
probably a mistake on my part. I'm just curious about that random 5th
parameter?

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
