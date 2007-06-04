From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] -pie is broken on hppa
Date: Sun, 3 Jun 2007 21:37:12 -0400 (EDT)
Message-ID: <200706040137.l541bCmm022707__40226.4352109798$1416624386$gmane$org@hiauly1.hia.nrc.ca>
References: <200706040123.l541Nnc1022459@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: kyle@mcmartin.ca,
 debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org,
 matthew@wil.cx
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200706040123.l541Nnc1022459@hiauly1.hia.nrc.ca> from "John David Anglin" at Jun 3, 2007 09:23:49 pm
Resent-Message-ID: <AtRczD.A.m4E.SJ3YGB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

> However, svn is still behaving wierdly:

Running svn cleanup with strace, these are the last few syscalls:

lstat64("libgcc/config/ia64/.svn/tmp/propsbase", 0xc02b6f08) = -1 ENOENT (No such file or directory)
gettimeofday({1180920486, 457857}, NULL) = 0
_newselect(0, NULL, NULL, NULL, {0, 642143}) = 0 (Timeout)
write(2, "svn: Can\'t read directory \'libgc"..., 112svn: Can't read directory 'libgcc/config/ia64/.svn/tmp': Partial results are valid but processing is incomplete
) = 112
close(3)                                = 0
brk(0x80000)                            = 0x80000
exit_group(1)                           = ?
Process 1357 detached

I wonder if there is a problem with lstat64.  Is this one of the syscalls
that was added recently?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
