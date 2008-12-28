From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: uid/gid issues on 2.6.26-rc2
Date: Sat, 27 Dec 2008 19:53:46 -0500
Message-ID: <20081228005346.GA22574@hiauly1.hia.nrc.ca>
References: <7d01f9f00805181331y77b83a35jb897b622f163b0ef@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="VbJkn9YxBvnuCH5J"
Cc: linux-parisc@vger.kernel.org
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7d01f9f00805181331y77b83a35jb897b622f163b0ef@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, 18 May 2008, Thibaut VARENE wrote:

> Then, checking auth.log, I spotted a few very surprising things:
> 
> May 18 09:15:04 mkhppa3 sshd[1265]: Invalid user varenet from 147.215.7.200
> May 18 09:15:04 mkhppa3 sshd[1265]: Failed none for invalid user
> varenet from 147.215.7.200 port 58220 ssh2

I have seen this today testing 2.6.28 (32-bit UP).  The problem is also
present in postfix:

dave@hiauly6:/var/log$ less mail.err
Dec 27 12:45:41 hiauly6 postfix/sendmail[16726]: fatal: file /etc/postfix/main.cf: parameter mail_owner: unknown user name value: postfix

The only place this can occur is here:

static void check_mail_owner(void)
{
    struct passwd *pwd;

    if ((pwd = getpwnam(var_mail_owner)) == 0)
	msg_fatal("file %s/%s: parameter %s: unknown user name value: %s",
		  var_config_dir, MAIN_CONF_FILE,
		  VAR_MAIL_OWNER, var_mail_owner);

So, the problem is with getpwnam.  I don't see this with 2.6.22.19, so
the problem is likely a syscall issue.  These seem to be the syscalls
that directly relate to the getpwnam call:

open("/lib/libnss_files.so.2", O_RDONLY) = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0$\f\0\0\0004\0"..., 512) = 512
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 52324, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x40b92000
mmap(0x40b9e000, 4096, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xb000) = 0x40b9e000
close(3)                                = 0
munmap(0x4051b000, 30889)               = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40006000
open("/etc/passwd", O_RDONLY|O_CLOEXEC) = 3
fcntl64(3, F_GETFD)                     = 0x1 (flags FD_CLOEXEC)
_llseek(3, 0, [0], SEEK_CUR)            = 0
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap2(NULL, 1557, PROT_READ, MAP_SHARED, 3, 0) = 0x407ae000
_llseek(3, 1557, [1557], SEEK_SET)      = 0
munmap(0x407ae000, 1557)                = 0
close(3)                                = 0
exit_group(0)                           = ?

The failure appears random.  I think the problem occurs shortly after
forking.  It doesn't seem to be present in the 64-bit SMP 2.6.28 test
kernel that I'm testing.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--VbJkn9YxBvnuCH5J
Content-Type: application/x-gunzip
Content-Disposition: attachment; filename="config-uly6.gz"
Content-Transfer-Encoding: base64

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

--VbJkn9YxBvnuCH5J--
